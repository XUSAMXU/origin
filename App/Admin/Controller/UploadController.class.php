<?php
namespace Admin\Controller;
use Think\Controller;
use Org\Net\Http;
use Think\Upload;

class UploadController extends CommonController{
	
	
	public function download(){
		if(IS_GET){
			
			$paper_id= $_GET['paper_id'];
			$type = $_GET['file'];

			$res= M('paper')->where(array('id'=>$paper_id))->find();
			p($type);
			//组合文件名和上传路劲
			$path = explode('@',$res[$type])[1];
			$showname = explode('@',$res[$type])[0];
			$url='C:/phpStudy/WWW'.__ROOT__.$path;
			Http::download($url,$showname);
		}else{
			$this->error('非法请求');
		}
			
		
	}
	//论文上传页面
	public function uploadPaper(){
	if(IS_GET){
		
		$paper_id= $_GET['paper_id'];
		$this->paperInfo = $_GET;
		
		$result = M('paper')->where(array('id'=>$paper_id))->find();
		
		$file['paper_id']=$result['id'];
		$file['title'] = $result['title'];
		$file['firstlink'] = explode('@',$result['firstlink'])[0];
		$file['finalpaper'] = explode('@',$result['finalpaper'])[0];
		$file['right'] = explode('@',$result['right'])[0];
		$file['secret'] = explode('@',$result['secret'])[0];

		$this->file = $file;
	}
	
	$this->display();
	}
	//上传文件处理
	public function uploadPaperHandle() {
	
	if(!IS_POST) halt('页面找不到了，请重新操作');
			$arr =$_POST;
			
			//实例化 上传文件功能
			$user_id =$_SESSION['user_id'];
			$username=$_SESSION['username'];
			$paper_id=$arr['paper_id'];
			$title =$arr['title'];
			
			$config =array(
			'maxSize' => 3145728,
			'exts' => 'doc,docx,pdf',
			'rootPath' => './Data/',
			'savePath' => 'Paper/'.$username.'_'.$user_id.'_'.$paper_id.'/',
			'subName' => date('Y-m-s')
			);
			$upload = new \Think\Upload($config);
			$info = $upload->upload();
			$fileinfo=array();
			if($info) {
			foreach ($info as $file){
								$fileinfo[$file['key']] =$file['name']."@/Data/".$file['savepath'].$file['savename'];
			}
			if(intval($user_id) !== 1){
				$fileinfo['user_id']=$user_id;
			}
			$fileinfo['status'] = 1;
			$fileinfo['lastdate'] = time();
			$result=M('paper')->where(array('id'=>$paper_id,'title'=>$title))->save($fileinfo);
			if($result){
				$this->success("上传成功");
			}
		}
		
	}
	
}
?>