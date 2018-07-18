<?php

namespace Home\Controller;
use Think\Controller;
	header('content-type:text/html;charset=utf8');
class IndexController extends Controller {
     public function index(){
     	
     	$this->topic = M('topic')->limit(5)->select();
     	$list = M('cate') -> where(array('pid'=>0))->order('sort')->select();
     	//自定义递归
     	import('Common.Class.Xunhuan');
     	$cate = M('cate') -> order('sort') -> select();
     	$db =M('content'); 
     	$field = array('id','title','time');
     	//自定义递归
     	foreach($list as $k => $v){
     	$cids = \Xunhuan::getChildsId($cate,$v['id']);
     	$cids[]=$v['id'];
		$where=array('cid'=>array('IN',$cids));
     	$list[$k]['content'] = $db->field($field)->where($where) -> select();
     	}
     	$this -> res= $list;
     	$this->display();
    }
}
?>