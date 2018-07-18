<?php
namespace Home\Controller;
use Think\Controller;
header('content-type:text/html;charset=utf8');
class ListController extends Controller {
     public function index(){
     	$id = (int) $_GET['id'];
     	$cate = M('cate') -> order ('sort') ->select() ;
     	import('Common.Class.Xunhuan');
     	$cids = \Xunhuan::getChildsId($cate,$id);
     	$cids[] = $id;
     	$this->blog = D('ContentView')->where(array('cid' => array('IN',$cids)))->select();
     	$this->display('list');
		
    }
}
?>