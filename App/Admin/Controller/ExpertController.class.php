<?php
namespace Admin\Controller;
use Think\Controller;
use \Org\Util\Rbac;
header('content-type:text/html;charset=utf8');
class ExpertController extends CommonController {
	
	public function reviewPaper(){	
			
		$paper_id = $_GET['paper_id'];
		$user_id= $_SESSION['user_id'];
		
		
		//获取论文相关信息
		$status = M('paper')->where(array('id'=>$paper_id))->find();
		$this->data = $status;
		//获取专家ID

		$expert_id = M('expert')->where(array('user_id'=>$user_id))->field(array('id'))->find();
		$where=array('expert_id'=>$expert_id['id'],'paper_id'=>$paper_id);
		$finsh = M('expert_paper')->where($where)->select();
		//作者已经评审项目信息；
		
		$expert_project = M('expert_project')->where(array('expert_id'=>$expert_id['id'],'paper_id'=>$paper_id))->select();
		
		//获取评审项目信息
		$project = M('project')->order('sort DESC') -> select();
		$arr=array();
		if($expert_project){

		}
		//重组数据
		foreach($project as $v) {
			
			if($v['type'] == 1 ){
				$v['value']=explode('/',$v['default']);
			}else{
				$v['value']='';
			}
			
			if($expert_project){
				foreach($expert_project as $b){
					if($b['project_id']== $v['id'])
					{
						$v['test']=$b['value'];	
					}
				}
			}
			
			$arr[]=$v;
		}
		
		$this->finsh = $finsh;
		$this->project=$arr;
 		$this->display();
	}
	
	public function reviewPaperHandle(){
		$post =$_POST;
		$user_id =$_SESSION['user_id'];
		$paper_id = $_GET['paper_id'];
		$expert_id = M('expert')->where(array('user_id'=>$user_id))->field(array('id'))->find();
	
		p($_POST);
		// 循环表单信息，然后插入 或者 更新数据表
		foreach($post as $k=>$v){
			if($k =='finsh') break;
			$data=array(
			'project_id' => explode('_',$k)[1],
			'value' => $v,
			'time' => time(),
			'expert_id'=>$expert_id['id'],
			'paper_id' =>$paper_id
			);
			// 更新评审项目数据操作
			$result=M('expert_project')->where(array('paper_id'=>$paper_id,'expert_id'=>$expert_id['id'],'project_id'=>explode('_',$k)[1]))->save($data);
			
			//如果 返回 0 或者 false 
			//说明该作者之前没有评审该论文， 那么就执行数据插入
			if(0 == $result || false == $result){	
			$result=M('expert_project')->where(array('paper_id'=>$paper_id,'expert_id'=>$expert_id['id'],'project_id'=>explode('_',$k)[1]))->add($data);
			}
		}

		// 评审状态 ==== 完成
		if($_POST['finsh']){
		$finsh = 2 ;
		M('expert_paper')->where(array('expert_id'=>$expert_id['id'],'paper_id'=>$paper_id))->save(array('finsh'=>$finsh));
		
		//结束，返回专家论文页面 	
		$this->success('提交成功',U('Expert/checkPaper'));
		 	
	}
}
    public function checkPaper(){

	$user_id = $_SESSION['user_id'];
	//判断不是管理猿， 按么就D 模型  输出数据
	if($id = 1){
		$expert=M('expert')->where(array('user_id'=>$user_id))->find();
	
		if($expert){
			$data[] = D('ExpertRelation')->where(array('id'=>$expert['id']))->relation('paper')->find();
		}else{
			// 如果专家没有完善信息，  那么不能评审论文 
			
			$this->error('你没完善评审专家信息，等您完善信息后才能审稿',U('expert/expertInfo'));

		}
	}else{
	
		// 如果是管理员， 那么就输出所有的论文与作者关系 数据
			$data = D('ExpertRelation')->relation('paper')->select();
	}

	$this->data = $data;
	$this->display();

	
	}
	
	public function expertInfo(){
	$id = $_SESSION['user_id'];
	if($id == 1) {echo "您是网站管理员，不需要填写此块信息";
	die;}
	$expert =M('expert')->where(array('user_id'=>$id))->find();
	$this->topic = M('topic')->select();
	if($expert){
		$this->expert =$expert;
	}else{
		$this->expert ='';
	}
	
	$this->display();
	}
	
	public function expertInfoHandle(){
		$post = $_POST;
		$user_id  =$_SESSION['user_id'];
		$expert_id =$_GET['expert_id'];
		$data = array(
			'name'=>$post['name'],
			'organization'=>$post['organization'],
			'phone'=>$post['phone'],
			'expert'=>$post['expert'],
			'message'=>$post['message'],
			'user_id'=>$user_id
		);

		if($expert_id){
			$result = M('expert')->where(array('id'=>$expert_id,'user_id'=>$user_id))->save($data);
		}else if(!$expert_id)
		{
			$post[$user_id] =$user_id; 
			$result = M('expert')->add($data);
		}
			
		$this->success('保存信息成功',U('expert/checkPaper'));
		
	}
}
?>