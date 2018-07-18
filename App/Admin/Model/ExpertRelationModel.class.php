<?php
namespace Admin\model;
use Think\Model;
use Think\Model\RelationModel;

class ExpertRelationModel extends RelationModel{
	
   public $tableName ='expert';
   protected $_link=array(
 	'paper' => array(
		'mapping_name'=>'paper',	
		'mapping_type'=>self::MANY_TO_MANY,
    	'foreign_key'=>'expert_id',
    	'relation_foreign_key'=>'paper_id',
    	'relation_table' => 'rbac_expert_paper'
 	)
    );
  }
?>