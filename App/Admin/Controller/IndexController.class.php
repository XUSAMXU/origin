<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController{
    public function index(){

    	$this->display();
	}
	public function  userInfo(){
		
		$user_id=$_SESSION['user_id'];
		
		$userInfo = M('user')->where(array('id'=>$user_id))->find();
		
		$this->user=$userInfo;
		$this->display();
	}
	
	public function userInfoHandle(){
		
	}
	
	public function logout(){
		session_unset();
		session_destroy();
		$this->redirect('Login/index');
	}

}