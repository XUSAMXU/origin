<?php
namespace Admin\model;
use Think\Model\RelationModel;

class ContentRelationModel extends RelationModel{
	
   protected $tableName = 'content';	
   protected $_link=array(
    'attr' => array(
   		'mapping_name'=>'attr',	
		'mapping_type'=>self::MANY_TO_MANY,
    	'foreign_key'=>'bid',
    	'relation_foreign_key'=>'aid',
    	'relation_table'=>'rbac_content_attr'
   		),
   	'cate'=> array(
   		'mapping_name'=>'cate',	
   		'mapping_type' => self::BELONGS_TO,
   		'foreign_key' => 'cid',
   		'mapping_fields'=>'name',
   		'as_fields' =>'name:cate'
   	)
    );
    
    public function getBlogs($type = 0){
    	$field =array('del');
		$where = array('del'=>$type);
return $this->field($field,true)->where($where)->relation(true)->select();
		
    }
   
}

?>