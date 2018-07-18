<?php
namespace Home\Widget;
use Think\Controller;
class CateWidget extends Controller { 
	    public function menu($data){
	    		$field= array('id','title','time');
			$this->webname = 'myblog';
			$this->content = M('content')->field($field)->limit(5)->order('time DESC')->select();
	   	    $this->display('Public/menu');
	   	}
	   	
	   	
	   	public function nav() {
	   		
	   		$nav = M('cate')->order('sort')-> select();
	   		import('Common.class.Xunhuan');
	   		
	   		$cate = \Xunhuan::unlimitedForLayer($nav);
	   		
	   		
	   		$this -> navTop = $cate;
	   		
	   		$this -> display('Public/header');
	   		
	   	}
}
?> 