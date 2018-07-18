<?php

namespace Admin\Controller;
use Think\Controller;
use \Org\Util\Rbac;

 class CommonController extends Controller {
   	public function _initialize(){
   			if(!isset($_SESSION[C('USER_AUTH_KEY')])){
				$this->redirect('Admin/Login/index');
			}
			
			$noAuth = in_array(CONTROLLER_NAME,explode(',',C('NOT_AUTH_MODULES'))) ||  in_array(ACTION_NAME,explode(',',C('NOT_AUTH_ACTION')));

			if(C('USER_AUTH_ON') && !$noAuth){
			Rbac::AccessDecision() || $this->error('该功能暂时关闭',U('Index/index'));
			}
   	}
 }

?>