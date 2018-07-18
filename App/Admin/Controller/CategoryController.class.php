<?php
namespace Admin\Controller;
use Think\Controller;

class CategoryController extends CommonController {
	//分类列表视图
	public function cate(){
		$cate =M('cate')->order('sort ASC')->select();
		
		import('Common.Class.Xunhuan');
		$this -> cate = \Xunhuan::unlimitedForLevel($cate);
		$this -> display();
	}
	//添加分类列表视图	
	public  function addCate(){
		
		$this->pid = I('pid',0,'intval');
		
		$this -> display();
	}
	//添加分类列表管理

	public function runAddCate(){
		if(M('cate')->add($_POST)){
		$this -> success("添加成功",U(MODULE_NAME.'/Category/cate'));
		}else{
			$this -> error('faild');
		}
		
	}
	
	public function sort() {
		
		$db = M('cate');
		foreach($_POST as $id => $sort) {
			
			$db->where(array('id'=> $id))->setField('sort',$sort);
			
		}
		
		
		$this -> redirect(MODULE_NAME.'/Category/cate');
		
		
	}
	
	
}

?>