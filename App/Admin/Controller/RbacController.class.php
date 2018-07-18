<?php
namespace Admin\Controller;
use \Think\Controller;

class RbacController extends CommonController {
	//用户列表	
	public function index () {
	$count = M('user')->count();
	$pagesize=2;
	$page = new \Think\Page($count, $pagesize);
    $page = $page->show();
    $limit =$page->firstRow.','.$page->listRows;
	$test=D('UserRelation')->order('id')->field('password',true)->limit($limit)->relation('role')->select();	
	$this->test = $test;
    $this->assign('page', $page);
	$this->role = M('role')->select();
	$this->display();
	}
	
	//角色列表
	
	public function role () 
	{
		$this->role = M('role')->select();
		$this->display();
	}
	
	//用户添加
	
	public function addUser(){
		$this->role = M('role') -> select();
		$this->display();
	}	
	// 用户添加处理表单 
	public function addUserHandle() {
		if(!IS_POST) halt('页面找不到');
		$email = $_POST['email'];
		$username = $_POST['username'];
		$email = M('user')->where(array('email'=>$email))->find();	
		$username = M('user')->where(array('username'=>$username))->find();
		if($email){
			$this->error('邮箱已经存在',U('rbac/addUser'));
		}
		if($username){
			$this->error('用户名已存在 ',U('rbac/addUser'));
		}
		
		$post = $_POST;
		$data=array(
		'username' => $post['username'],
		'password' => md5($post['password']),
		'email' => $post['email'],
		'phone' => $post['phone'],
		'name' => $post['name'],
		'creattime' => time(),
		'ip'=>get_client_ip(),
		);
		
		$user = M('user');
		$data = $user->create();
		$result = $user->add($data);
		$role_id =$_POST['role_id'];;
		
		//把数据插入中间表
		if($result){
			$role = array('role_id'=>$role_id,'user_id'=>$result);
			if(M('role_user')->add($role)){
			$this->success('添加成功',U('Admin/Rbac/index'));
			};

		}
		
	}
	
	//编辑用户列表
	public function editUser(){
		$uid = $_GET['uid'];
		$this->user = D('UserRelation')->where(array('id'=>$uid))->relation(true)->find();
		$this->role = M('role')->select();
		$this->display();
	}
	
	//编辑用户上传表单处理
	public function editUserHandle(){
		
		$user = M('user')->where(array('id'=>$_POST['id']))->find();
		M('role_user')->where(array('id'=>$POST['id']))->delete();
		
		$role = array(
		'role_id' => $_POST['role_id'],
		'user_id'=>$_POST['id']
		);
		
		$role = M('role_user')->add($role);
			if($_POST['email']==$user['email']){
			
				$data = array(
				'name'=>$_POST['name'],
				'phone'=>$_POST['phone'],
				'sex'=>$_POST['sex'],
				'birthday'=>$_POST['birthday'],
				);
				
				if($_POST['password']!=''){
					$data['password']=I('password','','md5');
				}
				
			 $result = M('user')->where(array('id'=>$_POST['id']))->save($data);
			 if( 0!==$result || false !== $result){
					$this->success('修改成功');
				}
			}else{
				$data = array(
				'name'=>$_POST['name'],
				'email'=>$_POST['email'],
				'phone'=>$_POST['phone'],
				'sex'=>$_POST['sex'],
				'birthday'=>$_POST['birthday'],
				);
				if($_POST['password']!=''){
					$data['password']=I('password','','md5');
				}
				$email = M('user')->where(array('email'=>$_POST['email']))->find();
				
				if(!$email){
						$result = M('user')->where(array('id'=>$_POST['id']))->save();
				if(0 !== $result || false !== $result){
					$this->success("修改成功",U('rbac/index'));
				}
				}else{
					$this->error('邮箱已存在');
				}
		}
	}
	
	//addrole
	
	public function addRole () {
		$this -> display();
	}
	
	// 角色权限配置信息
	public function access () {
		//获取传入的角色id
		$rid = I('rid','','intval');
		//获取节点信息
		$node = M('node') -> order('sort') -> select();

		$field = array('id','name','title','pid');
		//查询角色id 返回
		$access =M('access')->where(array('role_id'=>$rid))->field($field)->getField('node_id',true);
		//节点数组
		//权限数组
		// 无限极分类
		$this->node = node_merge($node,$access);
		
		$this->rid=$rid;

		
		$this->display();
		
	}
	
	
	public function setAccess() {
		
		$rid =I('rid',0,'intval');
		$data = array();
		$db= M('access');
		//根据角色的id 清空原来的权限
		$db->where(array('role_id'=>$rid))->delete();
		
		foreach($_POST['access'] as $v) {
			$tmp = explode('_',$v);
			$data[] = array(
				'role_id' =>$rid,
				'node_id' =>$tmp[0],
				'level' => $tmp[1]
			);
		}
		
		//组合新权限
		
		if($db->addAll($data)) {
			
			$this->success('修改成功',U('Admin/Rbac/role'));
			
		}else{
			$this->error('修改失败');
		}
		
		
	}
	
	public function	 addRoleHandle() {
	$post = $_POST;
	$post['status']=$post['status']=='on'? 1 : 0;
		if(M("role")->add($post)){
			$this->success('添加成功',U('Admin/Rbac/role'));
		}
		
	}	
	
	public function node(){
		$field = array('id','name','title','pid');
		
		$node = M('node')->field($field)->order('sort')->select();
		$this->node = node_merge($node);
		$this->display();
	}
	//add 添加节点 
	
	public function addNode () {
		
		$this->pid =I('pid',0,'intval');
		$this->level = I('level',1,'intval');
		$this->type='';
		switch ($this->level) {
			case 1:
				$this->type='应用';
				break;
			case 2:
					$this->type='控制器';
				break;
			case 3: 
					$this->type='方法';
				break;
		}
		
		$node_id =$_GET['node_id'];
		if($node_id){
			$node = M('node')->where(array('id'=>$node_id))->find();
			$this->node=$node;
		}else{
			$this->node= array('id'=>'','title'=>'','status'=>'');
		}
		
		$this->display();
		
	}

	// 添加节点表单处理
	public function addNodeHandle() {
	$post = $_POST;

	$post['status']=$post['status']=='on'? 1 : 0; 
	if($_GET['node_id']){
		$result = M('node')->where(array('id'=>$_GET['node_id']))->save($post);
		if(0!==$result || false!== $result){
			$this->success('数据保存成功',U('node'));
		}else{
			$this->success('数据没有变化',U('node'));
		}
	}else{
	
		$result = M('node')->add($post);
		
		$this->success('数据添加成功',U('node'));
	}
	}
	
	//状态处理
	public function status(){
		$role_id = $_GET['id'];
		$status = $_GET['status'];
		echo 1;
		if($role_id){

			$data = array('id'=>$role_id,'status'=>$status);
			$result = M('role')->where(array('id'=>$role_id))->save($data);
			
		if(0!== $result && false !== $result){
			
			$this->success('修改状态成功',U('rbac/role'));
			
		}else{
			$this->error('状态错误');
		}
		}
	}
	
	//删除勾选的角色
	//传入id 数组  循环删除 
	// ---- 删除中间表 对应的 数据
	// ---- 删除角色表对应的数据
	public function delete () {
		$id = $_GET['uid'];
		$ids = $_POST['uids'];
		if($id) {
			$result1 = M('user')->where(array('id'=>$id))->delete();
			$result2 = M('role_user')->where(array('user_id'=>$id))->delete();
		}
		if($ids){
			foreach($ids as $v){
				$result3 = M('user')-> where(array('id'=>$v))->delete();
				$result4 =M('role_user')->where(array('user_id'=>$v))->delete();
			}
			
		}
		
		$this->success('删除成功',U('rbac/index'));
	}
	
	//删除节点 
	public function deleteNode(){
		$node_id= $_GET['node_id'];
		M('node')->where(array('id'=>$node_id))->delete();
		M('access')->Where(array('id'=>$node_id))->delete();
		
		$this->success('删除成功',U('node'));
 		
	}
	
}



?>