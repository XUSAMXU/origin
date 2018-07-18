<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Upload;

header('content-type:text/html;charset=utf8');

class MettingController extends CommonController{
    public function index(){
   
	}
	
	//会议列表
	public function metting() {
    	$metting=M('metting')->select();
    	$count = M('metting')->count();
 		$page= $this->getpage($count,2);
 		$show =$page->show();
    	$limit =$page->firstRow.','.$page->listRows;
    	$list = M('metting')->where('status=1')->order('id')->limit($limit)->select();
    	$this->assign('list',$list);
    	$this->assign('page',$show);
    	$this->display();
		
	}	
	function getpage($count, $pagesize = 10) {
  $p = new \Think\Page($count, $pagesize);
  $p->setConfig('header', '<li class="rows">共<b>%TOTAL_ROW%</b>条记录 第<b>%NOW_PAGE%</b>页/共<b>%TOTAL_PAGE%</b>页</li>');
  $p->setConfig('prev', '上一页');
  $p->setConfig('next', '下一页');
  $p->setConfig('last', '末页');
  $p->setConfig('first', '首页');
  $p->setConfig('theme', '%FIRST%%UP_PAGE%%LINK_PAGE%%DOWN_PAGE%%END%%HEADER%');
  $p->lastSuffix = false;//最后一页不显示为总页数
  return $p;
}
	//添加会议信息
	public function addMetting() {
			$this->display();
	}
		
	public function addMettingHandle() {
			if(!IS_POST) halt('页面找不到了，请重新操作');
			$arr =$_POST;
			$data = array(
			'name' => $arr['name'],
			'firstdate' => time(),
			'enddate' => time(),
			'abstract' => $arr['abstract'],
			'address' => $arr['address'],
			'status' =>1
			);
		
			if(M('metting')->add($data)) 
			{
				$this->success('保存成功',U('Metting/metting'));
			}
			else
			{
				$this->error("保存失败");
			}
	}
	//编辑会议信息
	public function editMetting(){
		$id = $_GET['id'];
		$data = M('metting')->where(array('id'=>$id))->find();
		$this->metting=$data;
		$this->display();
	}
	
	public function editMettingHandle(){
		$data =$_POST;

		$result = M('metting')->save($data);
		if(false !== $result || 0 !== $result){
		$this->success('操作成功',U('metting/metting'));
		}else{
		$this->error('保存失败');
		}
	}
	
	//删除会议信息
	public function deleteMetting(){
		$data = $_GET['id'];
		$result = M('metting')->delete($data);
		$this->success('删除成功',U('metting/metting'));		
	}

}