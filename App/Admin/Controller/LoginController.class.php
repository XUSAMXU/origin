<?php
namespace Admin\Controller;
use Think\Controller;
use \Org\Util\Rbac;

class LoginController extends Controller {
	
    public function index(){
    	$this->display(); 
	}
	
	public function login(){
		if(!IS_POST) halt('页面找不到');
		$code = I('verify'); 
		if(!$this->check_verify($code,'login')) {
			$this->error('验证码错误');	
		}
		
		$username = I('username');
		
		$user = M('user')->where(array('username'=>$username))->find();
		//判断用户名字
		if(!$user){
			$this-> error('账号不存在，请注册后登陆');
		}
		
		$pwd =I('password','','md5');
		//判断密码
		if($user['password'] !== $pwd){
			$this-> error('密码错误');
		}
		
		if($user['lock']) {
			$this->error('用户被锁定','Index/index');
		};
		$data = array(
		'id'=>$user['id'],
		'time' => time(),
		'ip' => get_client_ip(),
		);
		
		M('user')->save($data);
		// 用户验证 ---- 更新登录信息----将信息写入SESSION
		session(C("USER_AUTH_KEY"),$user['id']);
		session('username',$user['username']);
		session('ip',$user['ip']);
		session('time',date('Y-m-d H:i',$user['time']));
		//判断超级管理员 
		if($user['username'] == C('RBAC_SUPERADMIN')){
			
			session(C('ADMIN_AUTH_KEY'),true);
			
		}
		//引入RBac类
		import('Org.Util.Rbac');
		Rbac::saveAccessList($user['id']);
		$this->redirect('Admin/index/index');
	}
	
	
	//验证码类生成和验证
 	function check_verify($code, $id = ''){   
 	 $verify = new \Think\Verify();  
 	   return $verify->check($code, $id);
 	}
 
	
	public function verify(){
		$config = array(
		'imageW' => 100,
		'imageH' => 38,
		'fontSize' =>14,
		'length' =>1,
		'useNoise' => false,
		'codeSet' => '0123456789',
		'setKey' => 'md5'
		);
		$_SESSION=array();
		$verify =new \Think\Verify($config);
		$verify->entry('login');
	}
	
	public function expertRegister(){
		$this->display();
	}
	public function userRegister(){
		$this->display();
	}
	public function checkAjax(){
		p($_POST);
		die;
		$username = $_GET['username'];
		$email =$_GET['email'];
		$result1 = M('user')->where(array('username'=>$username))->find();
		$result2= M('user')->where(array('email'=>$username))->find();
		if($result1){
			$this->error('用户名已存在');
		}
		if($result2){
			$this->returnAjax('邮箱已经存在');
		}
		
	}
	public function userRegisterHandle(){
		$post = $_POST;
		
		
		
	}
	
	//发送邮件找回找账号密码
	//账户管理
	public function sendmail(){
		$this->display();
	}
	
	public function sendMailHandle(){
		
		$email = $_GET['email'];
		$test = M('user')->where(array('email'=>$email))->find();
		$time = time();
		$accessexpires = $time + 60*5;
		
		if(!$test){
			$this->ajaxReturn('邮箱不存在，请重新输入');
		}else{
			if($test['email']==$email){	
			$font='此邮箱为找账号和密码验证邮件，请勿回复，您的验证码为：';
			$code=rand(1000,9999);
			$content = $font."<strong>".$code.";</strong> </br>您的用户名为:".$test['username']." </br> 请凭借验证码去修改密码，验证码有效期为5分钟，请尽快填写";
			$result=think_send_mail($email,'学术会议平台1','学术会议平台账户信息',$content);
				if($result){
						$data = array(
						'retime'=>$time,
						'accesstoken'=>$code,
						'accessexpires'=>$accessexpires,
						'enabled'=>1 // 可以修改密码标志
						);
						$userSave = M('user')->where(array('email'=>$email))->save($data);
						if($userSave){
							$this->ajaxReturn('发送邮件成功，打开邮箱可以查看验证码');
						}
				}else{
							$this->ajaxReturn('发送邮件出错，请重新发送');
				}
				}
			}
	}
	
	//获取发送邮箱后提交的表单信息
	//验证上传数据
	//返回结果
	public function getmailHandle(){
		$nowTime = time(); //提交时间
		$accesstoken = I('code');
		$password = I('password','','md5');
		$email = I('email');
		$user = M('user')->where(array('email'))->find();
		if($user['enabled'] == 0) exit('您没有送验证码，或者您的邮箱输入有误！');
		if($nowTime > $user['accessexpires']) exit('您的验证码已经过期，请重新获取验证码！');
		
		if($accesstoken == $user['accesstoken']) {
			$data = array(
			'password' => $password,
			'enabled' =>0
				);
			$result = M('user')->where(array('email'=>$email))->save($data);
			if(0 !== $result || false !== $result){
				$this->success('修改成功，赶紧去登录您的账号吧',U('Login/index'));
			}
		}
	}
	
	

}


?>