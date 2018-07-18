<?php
namespace Admin\Controller;
use Think\Controller;
use \Org\Util\Rbac;

class RegisterController extends Controller {
    public function index(){
    	$this->display('login/userRegister'); 
	}
	public function expertIndex(){
    	$this->display('login/expertRegister'); 
	}
	public function userRegister(){
		$role_id = 1;
		$code = I('verify');
		
		p(md5($code));
		p($_SESSION);
		if(!$this->check_verify($code,'verifyUser')) {
			$this->error('验证码错误',U('register/index'));	
		}
		$post = $_POST;
		$username = $post['username'];
		$email =$post ['email'];
		
		$result1 =M('user')->where(array('username'=>$username))->find();
		$result2 =M('user')->where(array('email'=>$email))->find();
		
		if($result1){
			$this->error('用户名已存在');
		}
		if($result2){
			$this->error('邮箱已存在');
		}
		$data = array(
		'username' => $username,
		'email' => $email,
		'password' => I('password','','md5'),
		'createtime'=>time(),
		'ip'=>get_client_ip()
		);
		$user_id= M("user")->add($data);
		$data= array(
		'role_id'=>$role_id,
		'user_id'=>$user_id
		);
		
		$result3=M('role_user')->add($data);
		
		if($result3){
		$this->success('注册用户成功,正在跳转登录页面....',U('login/index'));
		}

		
	}
	
	public function expertRegister(){
		$role_id =2;
		$registerCode = I('registerCode');
		$code = I('verify');
		if(!$this->check_verify($code,'verifyUser')) {
			$this->error('验证码错误',U('register/expertIndex'));	
		}
		
		if($registerCode == C('REGISTER')){
		$post = $_POST;
		$username = $post['username'];
		$email =$post ['email'];	
		$result1 =M('user')->where(array('username'=>$username))->find();
		$result2 =M('user')->where(array('email'=>$email))->find();
		if($result1){
			$this->error('用户名已存在');
		}
		if($result2){
			$this->error('邮箱已存在');
		}
		$data = array(
		'username' => $username,
		'email' => $email,
		'password' => I('password','','md5'),
		'createtime'=>time(),
		'ip'=>get_client_ip()
		);
		$user_id= M("user")->add($data);
		$data= array(
		'role_id'=>$role_id,
		'user_id'=>$user_id
		);
		$result3=M('role_user')->add($data);
		if($result3){
		$this->success('专家账号注协成功,正在跳转登录页面....',U('login/index'));
		}else{
		$this->success('页面出错了',U('register/expertIndex'));
			
		}
		}else{
		$this->error('不存在的注册码',U('login/index'));
		}

	}
	
	
	function check_verify($code, $id = ''){   
 	 $verify = new \Think\Verify();  
 	   return $verify->check($code, $id);
 	}
 
	
	public function verifyUser(){
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
		$verify->entry('verifyUser');
	}
}
?>