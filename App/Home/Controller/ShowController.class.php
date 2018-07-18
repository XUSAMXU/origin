<?php

namespace Home\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf8');
class ShowController extends Controller {
     public function index(){
     	$id = $_GET['id'];
     	
     	$show = M('content')->where(array('id'=>$id))->find();
     	$this->show= $show;
     	$this->display('show');
    }
}
?>