<?php
return array(
    'RBAC_SUPERADMIN' =>'admin', //超级管理员指定
    'ADMIN_AUTH_KEY' =>	'admin',// 超级管理员识别
    'USER_AUTH_ON' => true,  //'是否开启验证'
	'USER_AUTH_TYPE' => 1,  //1 登录验证 ， 2 实时认证 ！  登陆后修改
	'USER_AUTH_KEY' =>'user_id', //用户认证识别号。
	'NOT_AUTH_MODULES' => 'Index', //无需认证的模块（控制器）：
	'NOT_AUTH_ACTION' => 'addRoleHandle,addNodeHandle,addUserHandle,setAccess,expertInfoHandle,reviewPaperHandle,joinHandle', //无需认证的方法；

	'RBAC_ROLE_TABLE' => 'rbac_role' , //角色表名称
	'RBAC_USER_TABLE' => 'rbac_role_user' , //角色中间表
	'RBAC_ACCESS_TABLE' => 'rbac_access', //权限表
	'RBAC_NODE_TABLE' => 'rbac_node' ,//节点权限
	//'配置项'=>'配置值'
	'TMPL_PARSE_STRING' => array(
			'__PUBLIC__' => __ROOT__.'/Public'
	)
);