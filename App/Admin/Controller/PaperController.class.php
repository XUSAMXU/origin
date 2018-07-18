<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Upload;

header("content-type:text/html;charset=utf8;");
class PaperController extends CommonController{
    public function index(){
	}
	//论文列表
	public function paper(){
		$db=M('paper');
		$this->paper = $db->order('id')->select();
		$this->author =M('author')->select();
		$this->display();
	}
	

	
	//提交论文信息页面
		
	public function addPaper(){
		$this->topic = M('topic')->select();
		$this->display();
	}
	//提交论文呢处理
	public function addPaperHandle(){
		$arr= $_POST;
		$arr['firstdate']=time();
		$result = M('paper')->add($arr);
		if($result){	
		$this -> success('添加信息成功',U('Paper/paper'));	
		}else {
			$this->error('操作失败');
		}
	}
	
	
	//点击编辑论文
	public function editPaper(){
		$paper_id = $_GET['paper_id'];
		$this->paper = M('paper')->where(array('id'=>$paper_id))->find();
		$this->topic = M('topic')->select();
		$this->display();
	}
	
	//编辑论文提交信息处理
	public function editPaperHandle(){
		$arr =$_POST;
		$arr['editdate']=time();
		$result = M('paper')->save($arr);
		if(0 !== $result && false !== $result){
			$this->success('编辑成功',U('paper'));
		}else{
			$this->error('编辑失败');
		}
	}
	

	//添加作者
	public function addAuthor(){
		$paper_id=$_GET['paper_id'];
		$author =M('author')->where(array('paper_id'=>$paper_id))->find();

	if($author){
		$this->author =$author;		
		$this->paper_id=$author['paper_id'];
	}else{
		$this->author ='';
		$this->paper_id=$paper_id;
	}
		$this->display();
	}
	
	public function addAuthorHandle(){
		$arr =$_POST;
		if($arr['id']){
			$result = M('author')->save($arr);
			if(0 !== $result && false !== $result){
				$this->success('编辑成功',U('paper'));
			}else{
				$this->error('数据没有变化');
			}
			}else{
				$result = M('author')->add($arr);
				$this->success('添加成功',U('paper'));
				
			}
	}
	
	
	//撤稿
	public function withdraw(){
		$post = $_POST;
		$data = array();
		$paper = array();
		p($post);
 		foreach($post['paper'] as $v){
			$data['id']=$v;
			$data['status']=4;
			$paper[]= $data;
			M('paper')->save($data);
		}
	}
	
	
	
	//添加参会作者注册信息
	public function join(){
		$this->join = $_GET['join_id'];
		$this->paper_id = $_GET['paper_id'];
		$field = array('id','title');
		$paper = M('paper')->field($field)->where(array('status'=>2))->select();
		
		if($paper){
			$this->paper=$paper;
		}else{
			$this->error="需要有被录用的论文才能参加会议";
		}
		$this->display();
	}
	//ajax 作者选取 
	public function joinAjax(){
		if($_GET){
			$paper_id = $_GET['paper_id'];
			$data = M('author')->where(array('paper_id'=>$paper_id))->find();
			$this->ajaxReturn($data);
		}
	}
	//参会管理页面
	public function joinList(){

		$join = M("join")->select();
		$arr= array();
		$result =array();
		foreach($join as $v){
			$arr = M('author')->where(array('id'=>$v['author_id']))->find();
			$v['author']=$arr['name'];
			$result[] = $v;
		}
		$this->join = $result;
		$this->display();
	}
	
	//惨呼表单处理
	public function joinHandle(){
		$post = $_POST;
		$data =array(
		'paper_id'=>$post['paper_id'],
		'author_id'=>$post['author_id'],
		'user_id'=>$_SESSION['user_id'],
		'time'=>time(),
		'message'=>$post['message']
		);
		if($_GET['join_id']){
			$result = M('join')->where(array('id'=>$_GET['join_id']))->save($data);
			
			if(0!==$result || false !== $result){
				$this->success('修改成功');
			}else{
				$this->success('页面没有变化');
				
			}
			
		}else{
			$result = M('join')->add($data);
			$this->success('注册成功',U('joinList'));
		}
		
		
	}
	
	public function joinDelete(){

		$join_id = $_GET['join_id'];
		
		M('join')->delete($join_id);
		
		$this->success('删除成功');
		
	}
}