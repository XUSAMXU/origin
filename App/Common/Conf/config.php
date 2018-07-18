<?php
return array(

	//加载系统配置项
	'LOAD_EXT_CONFIG'=>'verify,webinfo',
	//'配置项'=>'配置值'
	'SHOW_PAGE_TRACE' => true,
	'APP_GROUP_LIST' => array('Home,Admin'),
	'DEFAULT_GROUP' =>'Home',
	'URL_MODEL' => 2,
	'MODULE_ALLOW_LIST' => array('Home','Admin'),
	'MULTI_MODULE'=>true,
	'APP_GROUP_MODE' => 1,
	'APP_GROUP_PATH' =>'Modules',
 	'DB_TYPE'    => 'mysql',  // 数据库类型
    'DB_HOST'    => '127.0.0.1', // 服务器地址
    'DB_NAME'    => 'rbac',  // 数据库名
    'DB_USER'    => 'root',  // 用户名
    'DB_PWD'    => 'root', // 密码
    'DB_PORT'    => '3306',  // 端口
    'DB_PREFIX'    => 'rbac_', // 数据库表前缀
    'DB_FIELDTYPE_CHECK' => false,  // 是否进行字段类型检查
    'DB_FIELDS_CACHE'  => true,  // 启用字段缓存
    'DB_CHARSET'   => 'utf8',  // 数据库编码默认采用utf8
    //smtp 配置
    'THINK_EMAIL' => array(
	
	'SMTP_HOST' => 'smtp.qq.com', //SMTP服务器
	
	'SMTP_PORT' => '465', //SMTP服务器端口
	
	'SMTP_USER' => '804600733@qq.com', //SMTP服务器用户名
	
	'SMTP_PASS' => 'gafoxngerivxbfgi', //SMTP服务器密码
	
	'FROM_EMAIL' => '804600733@qq.com',
	
	'FROM_NAME' => '会议管理员', //发件人名称
	
	'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
	
	'REPLY_NAME' => '', //回复名称（留空则为发件人名称）
	
	'SESSION_EXPIRE'=>'72',
	), 
    
);