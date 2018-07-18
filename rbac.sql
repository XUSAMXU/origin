# Host: localhost  (Version: 5.5.53)
# Date: 2018-07-18 10:50:47
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "rbac_access"
#

DROP TABLE IF EXISTS `rbac_access`;
CREATE TABLE `rbac_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "rbac_access"
#

/*!40000 ALTER TABLE `rbac_access` DISABLE KEYS */;
INSERT INTO `rbac_access` VALUES (2,21,3,NULL),(2,20,3,NULL),(1,21,3,NULL),(1,20,3,NULL),(2,19,3,NULL),(2,14,2,NULL),(2,16,3,NULL),(3,17,3,NULL),(3,18,3,NULL),(3,15,2,NULL),(3,2,1,NULL),(1,19,3,NULL),(1,14,2,NULL),(1,2,1,NULL),(3,16,3,NULL),(2,28,3,NULL),(2,27,3,NULL),(2,18,3,NULL),(2,17,3,NULL),(4,14,2,NULL),(4,28,3,NULL),(4,27,3,NULL),(4,18,3,NULL),(4,17,3,NULL),(4,16,3,NULL),(4,15,2,NULL),(4,2,1,NULL),(4,1,1,NULL),(4,19,3,NULL),(4,20,3,NULL),(4,21,3,NULL),(4,4,2,NULL),(4,29,3,NULL),(4,13,3,NULL),(4,30,3,NULL),(2,32,3,NULL),(2,33,3,NULL),(2,34,3,NULL),(2,15,2,NULL),(2,2,1,NULL);
/*!40000 ALTER TABLE `rbac_access` ENABLE KEYS */;

#
# Structure for table "rbac_article"
#

DROP TABLE IF EXISTS `rbac_article`;
CREATE TABLE `rbac_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `seotitle` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) unsigned NOT NULL COMMENT '时间',
  `n` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "rbac_article"
#

/*!40000 ALTER TABLE `rbac_article` DISABLE KEYS */;
INSERT INTO `rbac_article` VALUES (1,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442754,0),(2,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442798,0),(3,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442799,0),(4,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442799,0),(5,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442800,0),(6,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442800,0),(7,1,'测试','测试','测试','测试','','<span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span><span>大萨达多撒的撒的撒的 按时</span>',1525442822,0);
/*!40000 ALTER TABLE `rbac_article` ENABLE KEYS */;

#
# Structure for table "rbac_attr"
#

DROP TABLE IF EXISTS `rbac_attr`;
CREATE TABLE `rbac_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(10) NOT NULL DEFAULT '',
  `color` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "rbac_attr"
#

INSERT INTO `rbac_attr` VALUES (4,'精华','#ff0000'),(5,'订制','green'),(6,'推荐','yellow');

#
# Structure for table "rbac_author"
#

DROP TABLE IF EXISTS `rbac_author`;
CREATE TABLE `rbac_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作者id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '作者姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `workplace` varchar(255) NOT NULL DEFAULT '' COMMENT '所属机构',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `subcontact` varchar(255) DEFAULT '' COMMENT '备用联系',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `postcode` varchar(255) DEFAULT NULL COMMENT '邮编号码',
  `paper_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_author"
#

/*!40000 ALTER TABLE `rbac_author` DISABLE KEYS */;
INSERT INTO `rbac_author` VALUES (35,'son x','804600733@qq.com','没有','21 123','12321321321312','没有','21 3123 ',''),(38,'许森','804600733@qq.com','华软','18819616529','31313213312311323213','没有','525400','20'),(39,'许森','804600733@qq.com','广州大学华软软件学院','18819616529','18819616529','广从南路','510000','24'),(40,'4234','1733954140@qq.com','2342342','234','324234','23423','234324','23'),(41,'son x','804600733@qq.com','没有213','18819616529123','21312321','没有12312','525400213','21'),(42,'测试','1733954140@qq.com','123123','13123','231231','312312','1231','18');
/*!40000 ALTER TABLE `rbac_author` ENABLE KEYS */;

#
# Structure for table "rbac_author_paper"
#

DROP TABLE IF EXISTS `rbac_author_paper`;
CREATE TABLE `rbac_author_paper` (
  `author_id` int(11) unsigned NOT NULL DEFAULT '0',
  `paper_id` int(11) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `paper_id` (`paper_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "rbac_author_paper"
#

/*!40000 ALTER TABLE `rbac_author_paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_author_paper` ENABLE KEYS */;

#
# Structure for table "rbac_cate"
#

DROP TABLE IF EXISTS `rbac_cate`;
CREATE TABLE `rbac_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "rbac_cate"
#

INSERT INTO `rbac_cate` VALUES (27,'关于我们',0,200),(28,'新闻通知',0,400),(29,'联系我们',0,500),(30,'会议主题',0,300);

#
# Structure for table "rbac_category"
#

DROP TABLE IF EXISTS `rbac_category`;
CREATE TABLE `rbac_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

#
# Data for table "rbac_category"
#

/*!40000 ALTER TABLE `rbac_category` DISABLE KEYS */;
INSERT INTO `rbac_category` VALUES (1,'blog','博客',0,0,10,'','','','','','','','2','2,1',0,0,1,0,0,'1','',1379474947,1382701539,1,0),(2,'default_blog','默认分类',1,1,10,'','','','','','','','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,31);
/*!40000 ALTER TABLE `rbac_category` ENABLE KEYS */;

#
# Structure for table "rbac_content"
#

DROP TABLE IF EXISTS `rbac_content`;
CREATE TABLE `rbac_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) unsigned NOT NULL,
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `summary` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "rbac_content"
#

INSERT INTO `rbac_content` VALUES (4,'开始征文','<p>1231231231</p>',1524738490,0,27,0,'12313'),(5,'开始征文','<p>1231231231</p>',1524738490,0,28,0,'12313'),(6,'开始征文','<p>1231231231</p>',1524738490,0,29,0,'12313'),(7,'开始征文','<p>1231231231</p>',1524738490,0,29,0,'12313'),(8,'开始征文','<p>1231231231</p>',1524738490,0,28,1,'12313'),(9,'开始征文','<p>1231231231</p>',1524738490,0,27,1,'12313'),(10,'add','<p>阿萨德撒撒的<img src=\"/blog/Uploads/image/20180508/1525722813121418.jpg\" title=\"1525722813121418.jpg\" alt=\"Hydrangeas.jpg\"/></p>',1525722816,0,28,0,'                            \t\r\n       阿萨德                     ');

#
# Structure for table "rbac_content_attr"
#

DROP TABLE IF EXISTS `rbac_content_attr`;
CREATE TABLE `rbac_content_attr` (
  `bid` int(10) unsigned NOT NULL,
  `aid` int(10) unsigned NOT NULL,
  KEY `aid` (`aid`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "rbac_content_attr"
#

INSERT INTO `rbac_content_attr` VALUES (3,4),(3,5),(3,6);

#
# Structure for table "rbac_expert"
#

DROP TABLE IF EXISTS `rbac_expert`;
CREATE TABLE `rbac_expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `phone` int(11) NOT NULL DEFAULT '0',
  `websit` varchar(255) DEFAULT '',
  `topic_id` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `registercode` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_expert"
#

/*!40000 ALTER TABLE `rbac_expert` DISABLE KEYS */;
INSERT INTO `rbac_expert` VALUES (1,'专家1','213131',2132131,'31231232','4','3213213213','1231231',5),(7,'专家2','23123',3123123,'','2','2131231231','',28);
/*!40000 ALTER TABLE `rbac_expert` ENABLE KEYS */;

#
# Structure for table "rbac_expert_paper"
#

DROP TABLE IF EXISTS `rbac_expert_paper`;
CREATE TABLE `rbac_expert_paper` (
  `expert_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色为专家的用户id',
  `paper_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '论文id',
  `finsh` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "rbac_expert_paper"
#

/*!40000 ALTER TABLE `rbac_expert_paper` DISABLE KEYS */;
INSERT INTO `rbac_expert_paper` VALUES (1,26,2),(7,26,1),(7,24,2),(7,23,1),(7,21,1),(7,20,1),(1,18,1);
/*!40000 ALTER TABLE `rbac_expert_paper` ENABLE KEYS */;

#
# Structure for table "rbac_expert_project"
#

DROP TABLE IF EXISTS `rbac_expert_project`;
CREATE TABLE `rbac_expert_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `expert_id` int(11) NOT NULL DEFAULT '0',
  `paper_id` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_expert_project"
#

/*!40000 ALTER TABLE `rbac_expert_project` DISABLE KEYS */;
INSERT INTO `rbac_expert_project` VALUES (1,2,'优秀',1525243737,1,'21'),(2,3,'一般',1525194179,1,'21'),(3,4,'一般',1525243737,1,'21'),(4,5,'一般',1525243737,1,'21'),(5,6,'一般',1525243737,1,'21'),(6,7,'一般',1525243737,1,'21'),(7,8,'良好',1525243737,1,'21'),(9,10,'100',1525243737,1,'21'),(11,13,'123',1525243737,1,'21'),(13,18,'优秀',1525243737,1,'21'),(14,18,'一般',1525581785,1,'24'),(15,2,'良好',1525581785,1,'24'),(16,3,'良好',1525581785,1,'24'),(17,4,'良好',1525581785,1,'24'),(18,5,'良好',1525581785,1,'24'),(19,6,'良好',1525581785,1,'24'),(20,7,'良好',1525581785,1,'24'),(21,8,'良好',1525581785,1,'24'),(22,10,'55',1525581785,1,'24'),(23,13,'的聚集地哦啊是降低OS囧架架山东is案件京东按实际do骄傲你觉得稍等撒的撒的撒的ad啊',1525581785,1,'24'),(24,18,'优秀',1525599787,7,'21'),(25,2,'优秀',1525599787,7,'21'),(26,4,'一般',1525599787,7,'21'),(27,5,'一般',1525599787,7,'21'),(28,6,'一般',1525599787,7,'21'),(29,7,'一般',1525599787,7,'21'),(30,8,'良好',1525599787,7,'21'),(31,10,'',1525599787,7,'21'),(32,13,'123',1525599787,7,'21'),(33,18,'优秀',1525604964,7,'24'),(34,2,'优秀',1525604964,7,'24'),(35,3,'优秀',1525604964,7,'24'),(36,4,'优秀',1525604964,7,'24'),(37,5,'优秀',1525604964,7,'24'),(38,6,'优秀',1525604964,7,'24'),(39,7,'优秀',1525604964,7,'24'),(40,8,'优秀',1525604964,7,'24'),(41,10,'111',1525604964,7,'24'),(42,13,'100',1525604964,7,'24'),(43,18,'一般',1525767301,1,'26'),(44,2,'优秀',1525767301,1,'26'),(45,3,'优秀',1525767301,1,'26'),(46,4,'良好',1525767301,1,'26'),(47,5,'优秀',1525767301,1,'26'),(48,6,'优秀',1525767301,1,'26'),(49,7,'优秀',1525767301,1,'26'),(50,8,'优秀',1525767301,1,'26'),(51,10,'11',1525767301,1,'26'),(52,13,'11',1525767301,1,'26');
/*!40000 ALTER TABLE `rbac_expert_project` ENABLE KEYS */;

#
# Structure for table "rbac_file"
#

DROP TABLE IF EXISTS `rbac_file`;
CREATE TABLE `rbac_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

#
# Data for table "rbac_file"
#

/*!40000 ALTER TABLE `rbac_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `rbac_file` ENABLE KEYS */;

#
# Structure for table "rbac_join"
#

DROP TABLE IF EXISTS `rbac_join`;
CREATE TABLE `rbac_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(255) DEFAULT NULL,
  `paper_id` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_join"
#

/*!40000 ALTER TABLE `rbac_join` DISABLE KEYS */;
INSERT INTO `rbac_join` VALUES (9,'39','24',1525601683,'sadasd asd sadsad sad sad sa',1,2);
/*!40000 ALTER TABLE `rbac_join` ENABLE KEYS */;

#
# Structure for table "rbac_member"
#

DROP TABLE IF EXISTS `rbac_member`;
CREATE TABLE `rbac_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

#
# Data for table "rbac_member"
#

/*!40000 ALTER TABLE `rbac_member` DISABLE KEYS */;
INSERT INTO `rbac_member` VALUES (1,'Administrator',0,'0000-00-00','',10,2,0,1524989177,2130706433,1524989212,1);
/*!40000 ALTER TABLE `rbac_member` ENABLE KEYS */;

#
# Structure for table "rbac_menu"
#

DROP TABLE IF EXISTS `rbac_menu`;
CREATE TABLE `rbac_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_menu"
#

/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (1,'首页',0,1,'Index/index',0,'','',0),(2,'内容',0,2,'Article/mydocument',0,'','',0),(3,'文档列表',2,0,'article/index',1,'','内容',0),(4,'新增',3,0,'article/add',0,'','',0),(5,'编辑',3,0,'article/edit',0,'','',0),(6,'改变状态',3,0,'article/setStatus',0,'','',0),(7,'保存',3,0,'article/update',0,'','',0),(8,'保存草稿',3,0,'article/autoSave',0,'','',0),(9,'移动',3,0,'article/move',0,'','',0),(10,'复制',3,0,'article/copy',0,'','',0),(11,'粘贴',3,0,'article/paste',0,'','',0),(12,'导入',3,0,'article/batchOperate',0,'','',0),(13,'回收站',2,0,'article/recycle',1,'','内容',0),(14,'还原',13,0,'article/permit',0,'','',0),(15,'清空',13,0,'article/clear',0,'','',0),(16,'用户',0,3,'User/index',0,'','',0),(17,'用户信息',16,0,'User/index',0,'','用户管理',0),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0),(19,'用户行为',16,0,'User/action',0,'','行为管理',0),(20,'新增用户行为',19,0,'User/addaction',0,'','',0),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0),(43,'扩展',0,7,'Addons/index',0,'','',0),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0),(52,'安装',44,0,'Addons/install',0,'安装插件','',0),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0),(59,'新增',58,0,'model/add',0,'','',0),(60,'编辑',58,0,'model/edit',0,'','',0),(61,'改变状态',58,0,'model/setStatus',0,'','',0),(62,'保存数据',58,0,'model/update',0,'','',0),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0),(64,'新增',63,0,'Attribute/add',0,'','',0),(65,'编辑',63,0,'Attribute/edit',0,'','',0),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0),(67,'保存数据',63,0,'Attribute/update',0,'','',0),(68,'系统',0,4,'Config/group',0,'','',0),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0),(72,'删除',70,0,'Config/del',0,'删除配置','',0),(73,'新增',70,0,'Config/add',0,'新增配置','',0),(74,'保存',70,0,'Config/save',0,'保存配置','',0),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0),(77,'新增',76,0,'Channel/add',0,'','',0),(78,'编辑',76,0,'Channel/edit',0,'','',0),(79,'删除',76,0,'Channel/del',0,'','',0),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0),(87,'备份',86,0,'Database/export',0,'备份数据库','',0),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0),(93,'其他',0,5,'other',1,'','',0),(96,'新增',75,0,'Menu/add',0,'','系统设置',0),(98,'编辑',75,0,'Menu/edit',0,'','',0),(104,'下载管理',102,0,'Think/lists?model=download',0,'','',0),(105,'配置管理',102,0,'Think/lists?model=config',0,'','',0),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0),(108,'修改密码',16,0,'User/updatePassword',1,'','',0),(109,'修改昵称',16,0,'User/updateNickname',1,'','',0),(110,'查看行为日志',106,0,'action/edit',1,'','',0),(112,'新增数据',58,0,'think/add',1,'','',0),(113,'编辑数据',58,0,'think/edit',1,'','',0),(114,'导入',75,0,'Menu/import',0,'','',0),(115,'生成',58,0,'Model/generate',0,'','',0),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0),(118,'文档排序',3,0,'Article/sort',1,'','',0),(119,'排序',70,0,'Config/sort',1,'','',0),(120,'排序',75,0,'Menu/sort',1,'','',0),(121,'排序',76,0,'Channel/sort',1,'','',0);
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;

#
# Structure for table "rbac_metting"
#

DROP TABLE IF EXISTS `rbac_metting`;
CREATE TABLE `rbac_metting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `firstdate` int(11) NOT NULL DEFAULT '0',
  `enddate` int(11) NOT NULL DEFAULT '0',
  `abstract` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1 为开放，2为结束',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_metting"
#

/*!40000 ALTER TABLE `rbac_metting` DISABLE KEYS */;
INSERT INTO `rbac_metting` VALUES (5,'1231231',213123,312321312,'21313112322','1232131231',1),(7,'qwewiqewqo',1525091463,1525091463,'qieiqwe','123123123',1),(9,'123213123',1525091482,1525091482,'3213123','131231231',1),(11,'233123',1525091493,1525091493,'13123','123123',1),(12,'233123',1525091493,1525091493,'13123','123123',1),(13,'233123',1525091493,1525091493,'13123','123123',1),(14,'233123',1525091493,1525091493,'13123','123123',1),(15,'233123',1525091493,1525091493,'13123','123123',1);
/*!40000 ALTER TABLE `rbac_metting` ENABLE KEYS */;

#
# Structure for table "rbac_node"
#

DROP TABLE IF EXISTS `rbac_node`;
CREATE TABLE `rbac_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_node"
#

/*!40000 ALTER TABLE `rbac_node` DISABLE KEYS */;
INSERT INTO `rbac_node` VALUES (1,'Home','前端应用',1,NULL,1,0,1),(2,'Admin','后台应用',1,NULL,1,0,1),(3,'Rbac','用户管理',1,NULL,1,2,2),(4,'Setting','系统设置',1,NULL,1,2,2),(5,'addNode','添加节点',1,NULL,1,3,3),(6,'Index','后台首页',1,NULL,1,2,2),(8,'addRole','添加角色',1,NULL,1,3,3),(9,'addUser','添加用户',1,NULL,1,3,3),(10,'node','节点列表',1,NULL,1,3,3),(11,'role','角色列表',1,NULL,1,3,3),(12,'user','用户列表',1,NULL,1,3,3),(13,'topic','会议主题',1,NULL,1,4,3),(14,'Expert','评审专家模块',1,NULL,1,2,2),(15,'Paper','普通用户模块',1,NULL,1,2,2),(16,'addPaper','提交论文',1,NULL,1,15,3),(17,'paper','管理论文',1,NULL,1,15,3),(18,'uploadPaper','上传论文',1,NULL,1,15,3),(19,'checkPaper','审稿论文',1,NULL,1,14,3),(20,'expertInfo','评审专家信息',1,NULL,1,14,3),(21,'reviewPaper','评审项目',1,NULL,1,14,3),(27,'join','参会注册',1,NULL,1,15,3),(28,'joinList','参会管理',1,NULL,1,15,3),(29,'addTopic','添加会议方向',1,NULL,1,4,3),(30,'editTopic','编辑会议方向',1,NULL,1,4,3),(32,'joinAjax','会议注册交互',1,NULL,NULL,15,3),(33,'joinDelete','参会注册删除',1,NULL,NULL,15,3),(34,'withdraw','论文撤稿',1,NULL,NULL,15,3);
/*!40000 ALTER TABLE `rbac_node` ENABLE KEYS */;

#
# Structure for table "rbac_paper"
#

DROP TABLE IF EXISTS `rbac_paper`;
CREATE TABLE `rbac_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '论文编号',
  `status` varchar(100) NOT NULL DEFAULT '0' COMMENT '论文状态',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '论文题目',
  `firstdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '首次提交日期',
  `lastdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近修改日期',
  `editdate` int(11) unsigned DEFAULT '0' COMMENT '编辑论文日期',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `message` varchar(400) NOT NULL DEFAULT '' COMMENT '留言',
  `abstract` varchar(2000) NOT NULL DEFAULT '' COMMENT '摘要',
  `firstlink` varchar(255) DEFAULT '' COMMENT '初稿下载链接',
  `finalpaper` varchar(255) DEFAULT NULL COMMENT '终稿下载链接',
  `right` varchar(255) DEFAULT NULL COMMENT '版权信息下载链接',
  `secret` varchar(255) DEFAULT NULL COMMENT '保密审查表链接',
  `display` varchar(10) DEFAULT NULL COMMENT '展示方式',
  `topic_id` varchar(100) NOT NULL DEFAULT '' COMMENT '论文主题方向',
  `user_id` int(10) DEFAULT '0' COMMENT '提交人用户id',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_paper"
#

/*!40000 ALTER TABLE `rbac_paper` DISABLE KEYS */;
INSERT INTO `rbac_paper` VALUES (18,'4','撒的a',0,0,0,'阿萨德','的按时','阿萨德as','',NULL,NULL,NULL,NULL,'1',0),(20,'1','1321321',0,1525757523,0,'520','123 21','12 3123 12das3 ','1440217154 许森-基于php的学术会议一站式服务平台的实现.docx@/Data/Paper/admin_1_20/2018-05-03/5af136538e9e3.docx','Koala.jpg@/Data/Paper/admin_1_20/2018-04-29-06/5ae4d8661ffd3.jpg','Lighthouse.jpg@/Data/Paper/admin_1_20/2018-04-29-06/5ae4d86620f74.jpg','Tulips.jpg@/Data/Paper/admin_1_20/2018-04-29-06/5ae4d86621f14.jpg',NULL,'2',0),(21,'4','基于PHP的一站式服务平台',0,1525507409,1525507619,'PHP，学术会议，会议系统','传统的办公方式、旧的作业方式，已经不能满足当今企业对信息的管理、扩展的需求。信息时代的发展在企业运营上变革了管理方式、提高了运作效率，增加了企业价值。信息技术的应用开拓了市场，带来了新的需求和动态，促进科技成果的现实生产力转化。为此，信息产业带来的巨大利益，成为了企业间的核心竞争力。','互联网的时代中，人们生活越来越离不开网络，计算机发展成为人们工作必不可少的工具。为了让学术领域能过方便召开会议，使用互联网来提供为有需要的人们参与会议，需要一个网站来实现相关功能。本网站是一个学术会议一站式服务平台，主要面向学术会议的整个流程，将复杂的信息进行分类并集中管理，系统化、标准的会议流程发布实现在网站上的一中网站应用程序。\r\n本网站采用php + mysql + apache 集成系统作为开发环境，主要功能包括通知征文、注册开放、论文提交、审稿安排、评审结果、会议注册、现在报道、会议完成等，实现了一个学术会议动态流程系统的所有功能。系统结合了实际的需求可以实现良好的兼容性，并且具有较好的容错性。 \r\n','基于PHP的学术会议一站式服务平台.doc@/Data/Paper/admin_1_21/2018-05-29/5aed65514a565.doc',NULL,NULL,NULL,NULL,'4',0),(23,'4','学术会议平台',0,0,0,'php,javascript,html,css','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci consequuntur accusamus quae iste voluptate quis neque officia voluptas quo reprehenderit aliquam mollitia ab aliquid quam dignissimos quos cupiditate provident consectetur.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci consequuntur accusamus quae iste voluptate quis neque officia voluptas quo reprehenderit aliquam mollitia ab aliquid quam dignissimos quos cupiditate provident consectetur.','',NULL,NULL,NULL,NULL,'4',0),(24,'3','商城系统',1525374945,0,1525375319,'购物，网上购物，购买，金融','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci consequuntur accusamus quae iste voluptate quis neque officia voluptas quo reprehenderit aliquam mollitia ab aliquid quam dignissimos quos cupiditate provident consectetur.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci consequuntur accusamus quae iste voluptate quis neque officia voluptas quo reprehenderit aliquam mollitia ab aliquid quam dignissimos quos cupiditate provident consectetur.','',NULL,NULL,NULL,NULL,'6',0),(25,'0','一站式服务平台',1525653239,0,0,'PHP，学术会议，会议系统','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis rem totam inventore consectetur cumque molestiae distinctio saepe deserunt quidem adipisci sed esse porro neque similique ut aliquam aliquid labore. Porro?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis rem totam inventore consectetur cumque molestiae distinctio saepe deserunt quidem adipisci sed esse porro neque similique ut aliquam aliquid labore. Porro?','',NULL,NULL,NULL,NULL,'4',0),(26,'2','test',1525767138,1525767158,0,'test','test','test','1440217154 许森-基于php的学术会议一站式服务平台的实现.docx@/Data/Paper/admin_1_26/2018-05-38/5af15bf6901ae.docx',NULL,NULL,NULL,NULL,'3',0);
/*!40000 ALTER TABLE `rbac_paper` ENABLE KEYS */;

#
# Structure for table "rbac_picture"
#

DROP TABLE IF EXISTS `rbac_picture`;
CREATE TABLE `rbac_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_picture"
#

/*!40000 ALTER TABLE `rbac_picture` DISABLE KEYS */;
INSERT INTO `rbac_picture` VALUES (6,'','','','',0,0);
/*!40000 ALTER TABLE `rbac_picture` ENABLE KEYS */;

#
# Structure for table "rbac_project"
#

DROP TABLE IF EXISTS `rbac_project`;
CREATE TABLE `rbac_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '评审项目标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '评审项目名称',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '评审输入类型',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评审项目排序',
  `default` varchar(255) DEFAULT '优秀/良好/一般/较差',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_project"
#

/*!40000 ALTER TABLE `rbac_project` DISABLE KEYS */;
INSERT INTO `rbac_project` VALUES (2,'创新性','innovation','1',10,'优秀/良好/较差'),(3,'学术水平','learning','1',9,'优秀/良好/较差'),(4,'应用价值','apply','1',8,'优秀/良好/一般/较差'),(5,'写作水平','essay','1',7,'优秀/良好/一般/较差'),(6,'结论可信度','trust','1',6,'优秀/良好/一般/较差'),(7,'总体评价','overall','1',5,'优秀/良好/一般/较差'),(8,'审稿结论','conclusion','1',4,'优秀/良好/一般/较差'),(10,'如果推荐优秀论文，请给论文评分，输入0-100数值','mark','2',2,''),(13,'评语或者修改意见','comment','3',1,''),(18,'选题意义','sense','1',11,'优秀/一般/较差');
/*!40000 ALTER TABLE `rbac_project` ENABLE KEYS */;

#
# Structure for table "rbac_role"
#

DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_role"
#

/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'expert',NULL,1,'专家'),(2,'user',NULL,1,'普通用户'),(3,'author',NULL,1,'作者'),(4,'test',NULL,1,'测试人员');
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;

#
# Structure for table "rbac_role_user"
#

DROP TABLE IF EXISTS `rbac_role_user`;
CREATE TABLE `rbac_role_user` (
  `role_id` mediumint(8) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "rbac_role_user"
#

/*!40000 ALTER TABLE `rbac_role_user` DISABLE KEYS */;
INSERT INTO `rbac_role_user` VALUES (1,5),(3,3),(1,4),(2,4),(3,4),(4,28),(1,9),(2,28),(2,2),(NULL,33),(1,34),(1,35),(2,36),(3,40),(2,40),(2,40),(1,41);
/*!40000 ALTER TABLE `rbac_role_user` ENABLE KEYS */;

#
# Structure for table "rbac_topic"
#

DROP TABLE IF EXISTS `rbac_topic`;
CREATE TABLE `rbac_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '主题方向名称',
  `introduce` varchar(255) NOT NULL DEFAULT '' COMMENT '主题介绍',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_topic"
#

/*!40000 ALTER TABLE `rbac_topic` DISABLE KEYS */;
INSERT INTO `rbac_topic` VALUES (2,'雷达系统','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ipsa eaque rerum ea asperiores veniam cum praesentium accusantium inventore repellat quo harum autem sit provident ipsam aliquam neque numquam magni!'),(3,'商城','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ipsa eaque rerum ea asperiores veniam cum praesentium accusantium inventore repellat quo harum autem sit provident ipsam aliquam neque numquam magni!'),(4,'环境','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ipsa eaque rerum ea asperiores veniam cum praesentium accusantium inventore repellat quo harum autem sit provident ipsam aliquam neque numquam magni!'),(6,'技术','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ipsa eaque rerum ea asperiores veniam cum praesentium accusantium inventore repellat quo harum autem sit provident ipsam aliquam neque numquam magni!'),(7,'测试','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro ipsa eaque rerum ea asperiores veniam cum praesentium accusantium inventore repellat quo harum autem sit provident ipsam aliquam neque numquam magni!');
/*!40000 ALTER TABLE `rbac_topic` ENABLE KEYS */;

#
# Structure for table "rbac_user"
#

DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `createtime` varchar(255) NOT NULL DEFAULT '' COMMENT '加入时间',
  `lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `openid` varchar(50) NOT NULL DEFAULT '',
  `retime` varchar(255) DEFAULT NULL,
  `accessexpires` int(1) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `accesstoken` varchar(255) DEFAULT NULL,
  `birthday` int(11) unsigned DEFAULT '0',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '1,男，2女，3，保密',
  `phone` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

#
# Data for table "rbac_user"
#

/*!40000 ALTER TABLE `rbac_user` DISABLE KEYS */;
INSERT INTO `rbac_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','127.0.0.1','1524921724',0,'804600733@qq.com',0,'',NULL,NULL,NULL,NULL,1524338288,3,1639747345),(2,'user','ee11cbb19052e40b07aac0ca060c23ee','127.0.0.1','1525004704',0,'804600733@qq.com2',0,'',NULL,NULL,NULL,NULL,1524338288,3,1639747345),(3,'author','02bd92faa38aaa6cc0ea75e59937a1ef','127.0.0.1','1524635855',0,'804600733@qq.com3',0,'',NULL,NULL,NULL,NULL,1524338288,3,1639747345),(4,'manage','70682896e24287b0476eff2a14c148f0','127.0.0.1','1524338288',0,'804600733@qq.com4',0,'',NULL,NULL,NULL,NULL,1524338288,3,1639747345),(5,'expert','e10adc3949ba59abbe56e057f20f883e','127.0.0.1','1524657467',0,'1733954140@qq.com',1,'','1525660809',1525661109,NULL,'3327',1524338288,3,1639747345),(28,'test','e10adc3949ba59abbe56e057f20f883e','127.0.0.1','1524657467',0,'845923033@qq.com',0,'',NULL,NULL,'1232131231231',NULL,1970,1,2147483647),(32,'register','register','127.0.0.1','1525626313',0,'register@qq.com',1,'',NULL,NULL,NULL,NULL,0,3,NULL),(33,'tony','741718db1033d6b918c4480a8a443fc2','127.0.0.1','1525626877',0,'78546456@qq.com',1,'',NULL,NULL,NULL,NULL,0,3,NULL),(34,'testname','afe107acd2e1b816b5da87f79c90fdc7','127.0.0.1','1525626965',0,'testname@testname.co',1,'',NULL,NULL,NULL,NULL,0,3,NULL),(35,'1231','f7e0ef389ac6133c88aedbd66b44a4e1','127.0.0.1','1525628657',0,'12312',1,'',NULL,NULL,NULL,NULL,0,3,NULL),(36,'test1','5a105e8b9d40e1329780d62ea2265d8a','127.0.0.1','1525629007',0,'test1@qq.com',1,'',NULL,NULL,NULL,NULL,0,3,NULL),(40,'123123','13123','','',0,'123123123123@qq.com',1,'',NULL,NULL,'123123213',NULL,1970,1,1312312),(41,'000','b4b147bc522828731f1a016bfa72c073','127.0.0.1','1525752633',0,'000',1,'',NULL,NULL,NULL,NULL,0,3,NULL);
/*!40000 ALTER TABLE `rbac_user` ENABLE KEYS */;
