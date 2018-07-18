<?php
namespace Admin\model;
use Think\Model;
use Think\Model\RelationModel;

class UserRelationModel extends RelationModel{
	
   public $tableName ='user';
	
   protected $_link=array(
  
    'role' => array(
		'mapping_name'=>'role',	
		'mapping_type'=>self::MANY_TO_MANY,
    	'foreign_key'=>'user_id',
    	'relation_foreign_key'=>'role_id',
    	'relation_table' => 'rbac_role_user',
    	'mapping_fields'=>'id,name,remark'
 		)
// 	,	
// 	'cate' => array(
// 		'mapping_name'=>'cate',	
// 		'mapping_type' => self::BELONGS_TO,
// 		'foreign_key' => 'cid',
// 		'mapping_fields'=>'name',
// 		'as_fields' =>'name:cate'
// 	)
// 	
    );
    
    public function getBlogs($type = 0){
    	
    	$field =array('del');
		$where = array('del'=>$type);
		return	$this->field($field,true)->where($where)->relation(true)->select();
    	
    }
   
}

?>