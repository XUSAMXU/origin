<?php
namespace Home\Model;
use Think\Model\ViewModel;

class ContentViewModel extends ViewModel  {
	
	protected $viewFields = array(
		'Content' => array('id','title','time','summary','_type' => 'LEFT'),
		'cate' => array('name','_on'=>'Content.cid = cate.id')
	);
	
}
?>