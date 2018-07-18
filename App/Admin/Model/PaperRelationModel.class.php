<?php
namespace Admin\model;
use Think\Model;
use Think\Model\RelationModel;

class PaperRelationModel extends RelationModel{
	
   public $tableName ='paper';
	
   protected $_link=array(
  
    'author' => array(
		'mapping_name'=>'author',	
		'mapping_type'=>self::MANY_TO_MANY,
    	'foreign_key'=>'paper_id',
    	'relation_foreign_key'=>'author_id',
    	'relation_table' => 'rbac_author_paper'
 		),
 	'expert' => array(
		'mapping_name'=>'expert',	
		'mapping_type'=>self::MANY_TO_MANY,
    	'foreign_key'=>'paper_id',
    	'relation_foreign_key'=>'expert_id',
    	'relation_table' => 'rbac_expert_paper'
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
  }
?>