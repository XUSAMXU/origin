<?php
namespace Admin\Controller;
use Think\Controller;
class ManageController extends CommonController{
	
	public function index (){}
	
		//评审结果
	public function endProject(){
		$paper = D('PaperRelation')->relation('expert')->select();
		$this->paper=$paper;
		$this->display();
	}
	
	//分配专家页面
	public function asignExpert(){
		
		$this->paper_id = $_GET['paper_id'];
		$this->title =$_GET['title'];
		$topic = M('topic')->select();
		
		//组合数据
		$arr = array();
		$final=array();
		
		foreach($topic as $v){
			$arr = M('expert')->where(array('topic_id'=>$v['id']))->find();
			$v['child'][]=$arr;
			$final[]=$v;
		}
		$this->final = $final;
		$this->display();
		
	}
	public function asignExpertHandle(){
		$paper_id =I('id',0,'intval');
		$data = array();
		$db= M('expert_paper');
		//根据论文的id 清空原来的评审作者
		$result=$db->where(array('paper_id'=>$paper_id))->delete();
		//循环组合数据
		foreach($_POST['expert'] as $v) {
			$tmp = explode('_',$v);
			$data[] = array(
				'expert_id' =>$tmp[0],
				'paper_id' =>$tmp[1]
			);
		}
		
		//组合新权限
		
		if($db->addAll($data)) {
			$this->success('修改成功',U('manage/paperlist'));
		}else{
			$this->error('修改失败');
		}
		
		
	}
	//评审项目列表
	public function expertProject(){
		
		$this->project = M('project')->order('sort DESC')->select();
		
		$this->display();
	}
	public function sort() {
		$db = M('project');
		foreach($_POST as $id => $sort) {
			$db->where(array('id'=> $id))->setField('sort',$sort);
		}
		$this -> redirect(MODULE_NAME.'/Manage/expertProject');
	}
	//论文最终状态设置
	public function test(){
		$paper_id =$_GET['paper_id'];
		$status= $_GET['status'];
		p($paper_id);

		$result = M('paper')->where(array('id'=>$paper_id))->data(array('status'=>$status))->save();
		$this->success('更改论文状态成功',U('manage/paperlist'));
	}
	
	//添加评审项目
	public function addExpertProject(){
		$this->display();
	}
	//添加评审项目处理
	public function addExpertProjectHandle(){
		$post = $_POST;
		$data = M('project')->add($post);
		if($data){
			$this->success("添加成功",U('Manage/expertProject'));
		}else{
			$this->error('添加失败，请重新填写');
		}
	}
	
	//编辑评审项目
	public function editExpertProject(){
		$id= $_GET['id'];
		$data = M('project')->where(array('id'=>$id))->find();
		$this->data =$data;
		$this->display();
	}
	public function editExpertProjectHandle(){
		$post = $_POST;
		$result = M('project')->save($post);
		if(false !== $result || 0 !== $result){
		$this->success('操作成功',U('manage/expertProject'));
		}else{
		$this->error('保存失败');
		}
	}
	
	//删除评审项目
	public function deleteExpertProject(){
		$id= $_GET['id'];
		$result1 = M('project')->where(array('id'=>$id))->delete();
		$result2 = M('expert_project')->where(array('project_id'=>$id))->delete();
		if($result1 || $result2){
		$this->success('操作成功',U('Manage/expertProject'));
		}else{
		$this->error('保存失败',U('Manage/expertProject'));
		}
	}
	//论文列表
	public function paperList(){
		
		$result=array();
		$paper = D('PaperRelation')->relation('expert')->select();
		foreach($paper as $v){
			$author = M('author')->where(array('paper_id'=>$v['id']))->select();
			$v['author']=$author;
			$result[]=$v;
		}
		$this->paper =$result;
		
		$this->display();
		
	}
	
	public function paperExcel (){
	
		//获取论文字段信息；
		$paper =M()->query("SELECT COLUMN_NAME,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'rbac_paper' AND TABLE_SCHEMA = 'rbac'");
		$arr1= array();
		
		foreach($paper as $v){
			$arr1[$v['column_name']] = $v['column_comment'];
		}
		//获取作者字段信息；
		$author =M()->query("SELECT COLUMN_NAME,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'rbac_author' AND TABLE_SCHEMA = 'rbac'");
		$arr2= array();
		foreach($author as $v){
			if($v['column_name']!='paper_id' && $v['column_name']!='id'){
				
				$arr2[$v['column_name']] = $v['column_comment'];
				
			}
		}
		
		$arr3= array_merge($arr1,$arr2);
		$this->paper=$arr1;
		$this->author=$arr2;
		$this->display();
	}
	
	
	//处理表单数据

	public function paperExcelHandle(){
		$paper =M()->query("SELECT COLUMN_NAME,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'rbac_paper' AND TABLE_SCHEMA = 'rbac'");
		$arr1= array();
		foreach($paper as $v){
			$arr1[$v['column_name']] = $v['column_comment'];
		}
		//获取作者字段信息；
		$author =M()->query("SELECT COLUMN_NAME,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'rbac_author' AND TABLE_SCHEMA = 'rbac'");
		$arr2= array();
		foreach($author as $v){
			if($v['column_name']!='paper_id' && $v['column_name']!='id'){
				
				$arr2[$v['column_name']] = $v['column_comment'];
				
			}
		}
		//合并两个数组
		$arr3= array_merge($arr1,$arr2);
		//自定义函数 ，多维数组转一维数组
		$str =arrayToString($_POST);

	//组合mysql 数据 ；
	$sql ="select ".$str." from rbac_author left join rbac_paper on (rbac_author.paper_id = rbac_paper.id) order by rbac_paper.id";
	
	//post 传入的数组就是 英文标题
	//$titlname = $_POST;
	$arr=M()->query($sql);
	
	//$title=array();
	$list = array();
	$final =array();
	$titlename = array();
	$count = 0;
	// 英文转中文  组合数组
	foreach($arr as $k){
		$count++;
		foreach($k as $j=>$v){
		if(in_array($j,array_keys($arr3))){
			$title[]= $arr3[$j];
			$list[$arr3[$j]]= $v;	
		}
		}
		if($count<2){
			$titlename =$title;
		}
		
		$final[] = $list;
	}
	// 最后
	$exceltitle =multiarray($titlename);
	$excelcontent=$final;
	p($excelcontent);
	die;
	$result =$this->exportExcel($exceltitle,$excelcontent,'Sheet1','paper');
	}
	
	
	
	//导出excel 表函数
	
	 function exportExcel($columName, $list, $setTitle='Sheet1', $fileName='demo')
{
    if ( empty($columName) || empty($list) ) {
        return '列名或者内容不能为空';
    }
    
    if ( count($list[0]) != count($columName) ) {
        return '列名跟数据的列不一致';
    }
    
    vendor('PHPExcel.PHPExcel');
    //实例化PHPExcel类
    $PHPExcel    =    new \PHPExcel();
    //获得当前sheet对象
    $PHPSheet    =    $PHPExcel    ->    getActiveSheet();
    //定义sheet名称
    $PHPSheet    ->    setTitle($setTitle);
    
    //excel的列 这么多够用了吧？不够自个加 AA AB AC ……
    $letter        =    [
        'A','B','C','D','E','F','G','H','I','J','K','L','M',
        'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    ];
    //把列名写入第1行 A1 B1 C1 ...
    for ($i=0; $i < count($list[0]); $i++) {
        //$letter[$i]1 = A1 B1 C1  $letter[$i] = 列1 列2 列3
        $PHPSheet->setCellValue("$letter[$i]1","$columName[$i]");
    }
    //内容第2行开始
    foreach ($list as $key => $val) {
        //array_values 把一维数组的键转为0 1 2 3 ..
        foreach (array_values($val) as $key2 => $val2) {
            //$letter[$key2].($key+2) = A2 B2 C2 ……
            $PHPSheet->setCellValue($letter[$key2].($key+2),$val2);
        }
    }
    ob_end_clean();  
    //生成2007版本的xlsx
    $PHPWriter = \PHPExcel_IOFactory::createWriter($PHPExcel,'Excel2007');
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename='.$fileName.'.xlsx');
    header('Cache-Control: max-age=0');
    $PHPWriter->save("php://output");
}

}
?>