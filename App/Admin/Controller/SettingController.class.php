<?php
namespace Admin\Controller;
use Think\Controller;
class SettingController extends CommonController{
    public function topic(){
    	$this->topic =M('topic')->select();
    	$this->display();
	}
	//添加会议主题
	public function addTopic (){
		
		$this->display();
	}
	//会议主题表单处理
	public function addTopicHandle(){
		
		if(!IS_POST)halt('页面不存在');
		
		$result = M('topic')->add($_POST);
		
		if($result){
		$this->success('添加会议成功',U('topic'));
		}else{
		$this->error('添加会议失败');
		}
	}
	//编辑对应的会议主题
	public function editTopic(){
		
		$topic_id = $_GET['topic_id'];
		
		$this->topic =M("topic")->where(array('id'=>$topic_id))->find();
		
		$this->display();
		
	}
	//
	public function editTopicHandle(){
		if(!IS_POST)halt('页面不存在');
		p($_POST);
		$id = $_POST['id'];
		$data = array(
		'name'=>$_POST['name'],
		'introduce'=>$_POST['introduce']
		);
		$where= array('id'=>$id);
		p($where);
		$result =M("topic")->where(array('id'=>$id))->save($data);
		
		if(0 !== $result || false !== $result){
		$this->success('修改成功',U('topic'));
		}
		else
		{
		$this->error('修改失败',U('topic'));
			
		}
	}
	//删除主题
	public function delete() {
		
		$topic_id =$_GET['topic_id'];
		$result = M('topic')->delete($topic_id);
		if($result){
		$this->success('删除成功',U('topic'));
		}
		else
		{
		$this->error('删除成功',U('topic'));
		}
		
	}
	//参会管理 
	public function registPeople(){
		$list = M("join")->select();
		$test = array();
		foreach($list as $v){
		$author = M('author')->where(array('id'=>$v['author_id']))->find();
		$paper = M('paper')->where(array('id'=>$v['paper_id']))->find();
		$v['author']=$author;
		$v['paper']=$paper;
		$test[]= $v;
		}
		$this->list=$test;
		$this->display();
	}
	
	
	public function confirm(){
		$id =$_GET['id'];
		
		$statsus = M('join')->where(array('id'=>$id))->save(array('status'=>2));
		
		p($statsus);
	}
}