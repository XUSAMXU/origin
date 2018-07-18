<?php
return array(
	//'配置项'=>'配置值'
	'TMPL_PARSE_STRING' => array(
	'__PUBLIC__' => __ROOT__.'/Public/'.MODULE_NAME,

	),
	'URL_ROUTER_ON' => true,
	'URL_ROUTE_RULES' => array(
	'/^c_(\d+)$/' => 'List/index?id=:1',
	':id\d' => 'Show/index'
	)
);