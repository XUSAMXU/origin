<?php
namespace Admin\Controller;
use Think\Controller;
class ContentController extends CommonController {
	//博文列表视图
	Public function content() {
		$content = D('ContentRelation')->getBlogs(0);
		$this->content=$content;
		$this -> display();
	}
	//回收站
	public function toTrach () {
		$type = (int) $_GET['type'];
		$msg = $type ? '删除':'还原';
		$update = array('id' =>(int) $_GET['id'],'del'=>$type);
		if(M('content')-> save($update)){
			$this->success($msg.'成功');
		}else{
              $this->error($msg.'失败');
		}
	}
	
	public function delete(){
		
		$id = (int) $_GET['id'];
		
		if(M('content')->delete($id)){
			
			M('content_attr')->where(array('bid'=>$id))->delete();
			$this->success('成功');
		}else{
			
			    $this->error($msg.'失败');
			
		}
		
	}
	
	
	public function trach() {
		$this->content = D("ContentRelation")->getBlogs(1);
		$this -> display('content');
		
	}
	
	
	//添加博文视图
	
	public function addContent() {
		$cate = M('cate')->order('sort')->select();
		import('Common.Class.Xunhuan');
		$this -> cate = \Xunhuan::unlimitedForLevel($cate);
		
		$this -> attr =M('attr') -> select();
		$this-> display();
	}
	
	//添加管理
	
	public function addContentHandle() {
		$data = array(
		 'title' => $_POST['title'],
		 'content' => $_POST['content'],
		 'summary' => $_POST['summary'],
		 'time' => time(),
		 'cid' => (int) $_POST['cid'],
		);
		
			
//			if(isset($_POST['aid'])){
//				
//				foreach($_POST['aid'] as $v) {
//					
//					$data['aid'][] = $v;
//					
//					}
//			}	

//foreach( $_POST['aid'] as $v) {
//		$res = M('blog_a                                                                                                                                                                         ttr')->add(array($bid => $v));
//}
		$Blog = D("ContentRelation");
		$result = $Blog->relation(true)->add($data);

 		if($result) {
              if(isset($_POST['aid'])) {
                  $sql = 'INSERT INTO `'.C('DB_PREFIX').'content_attr` (bid,aid) VALUES ';
                  foreach($_POST['aid'] as $v) {
                      $sql .= '('.$result.','.$v.'),';
                  }
                  $sql = rtrim($sql,',');
                  M()->execute($sql);
             }
              $this->success('添加成功', U('Admin/Content/content'));
         } else {
              $this->error('添加失败');
         }



	}
	
	//编辑器图片上传处理；
	
	Public function uploadimage() {
		 $config = array(
		'savePath'=> './',
        'autoSub'  =>  true, //自动子目录保存文件
        'subName'  =>  array('date', 'Y-m-d')//子目录创建方式，[0]-函数名，[1]-参
    );
    
		$upload = new \Think\Upload($config);
		
		$info = $upload->upload();
		
		if(!$info){
			
			$this -> error($upload->getError());
			
		}else {
			
			$this -> success('上传成功!');
			
		}
}
/**
 * 得到上传文件所对应的各个参数,数组结构
 * array(
 *     "state" => "",          //上传状态，上传成功时必须返回"SUCCESS"
 *     "url" => "",            //返回的地址
 *     "title" => "",          //新文件名
 *     "original" => "",       //原始文件名
 *     "type" => ""            //文件类型
 *     "size" => "",           //文件大小
 * )
    {
        return array(
            "state" => $this->stateInfo,
            "url" => $this->fullName,
            "title" => $this->fileName,
            "original" => $this->oriName,
            "type" => $this->fileType,
            "size" => $this->fileSize
        );
    }
		

 **/	
	}
?>