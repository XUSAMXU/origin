<?php
namespace Admin\model;
use Think\Model;
use Think\Model\RelationModel;

class TopicRelationModel extends RelationModel{
	
   public $tableName ='topic';
   protected $_link=array(
  	'expert' => array(
 		'mapping_name'=>'expert',	
 		'mapping_type' => self::BELONGS_TO,
 		'foreign_key' => 'topic_id',
// 		'mapping_fields'=>'name',
// 		'as_fields' =>'name:cate'
	)
    );
   }
?>