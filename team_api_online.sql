/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.6.36 : Database - team_api_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `application_online_switch` */

DROP TABLE IF EXISTS `application_online_switch`;

CREATE TABLE `application_online_switch` (
  `application_name` varchar(50) NOT NULL COMMENT '系统名称',
  `is_online` int(11) NOT NULL DEFAULT '0' COMMENT '0未上线1上线',
  `create_date` varchar(45) DEFAULT NULL COMMENT '创建日期',
  `update_date` varchar(45) DEFAULT NULL COMMENT '更新日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`application_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `application_release_record` */

DROP TABLE IF EXISTS `application_release_record`;

CREATE TABLE `application_release_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_name` varchar(50) DEFAULT NULL COMMENT '系统名称',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件名称',
  `git_tag` varchar(45) DEFAULT NULL,
  `create_date` varchar(45) DEFAULT NULL COMMENT '插入时间',
  `update_date` varchar(45) DEFAULT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT '0' COMMENT '0未同步，1同步中，2同步成功，3同步失败',
  `env` varchar(20) DEFAULT NULL COMMENT '环境',
  `exec_user` varchar(50) DEFAULT NULL COMMENT '持续交付-部署人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `application_swagger_detail` */

DROP TABLE IF EXISTS `application_swagger_detail`;

CREATE TABLE `application_swagger_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件名称',
  `git_tag` varchar(45) DEFAULT NULL,
  `swagger_base_url` varchar(50) DEFAULT NULL COMMENT 'swagger路径',
  `swagger_detail_path` varchar(50) DEFAULT NULL COMMENT 'swagger二级路径',
  `swagger_detail_content` text COMMENT 'swagger内容',
  `create_date` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `api_version` varchar(20) DEFAULT NULL COMMENT 'api版本',
  `env` varchar(20) DEFAULT NULL COMMENT '环境',
  PRIMARY KEY (`id`),
  KEY `KEY` (`component_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `application_swagger_header` */

DROP TABLE IF EXISTS `application_swagger_header`;

CREATE TABLE `application_swagger_header` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用名称',
  `component_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '组件名称',
  `git_tag` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `swagger_url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'swagger路径',
  `swagger_header_content` text COLLATE utf8_bin COMMENT 'swagger概览内容',
  `create_date` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `api_version` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'api版本',
  `env` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '环境',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `application_swagger_url` */

DROP TABLE IF EXISTS `application_swagger_url`;

CREATE TABLE `application_swagger_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `application_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件名称',
  `swagger_url` varchar(50) DEFAULT NULL COMMENT 'swagger路径',
  `env` varchar(20) DEFAULT NULL COMMENT '环境',
  `create_date` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `at_report_feedback` */

DROP TABLE IF EXISTS `at_report_feedback`;

CREATE TABLE `at_report_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `exec_user` varchar(50) NOT NULL COMMENT '反馈人用户名',
  `feedback` varchar(500) NOT NULL COMMENT '反馈内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `at_report_focus` */

DROP TABLE IF EXISTS `at_report_focus`;

CREATE TABLE `at_report_focus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `application_name` varchar(50) NOT NULL COMMENT '应用名称',
  `component_name` varchar(200) NOT NULL COMMENT '组件名称',
  `exec_user` varchar(50) NOT NULL COMMENT '用户',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0关注1未关注',
  `create_date` varchar(45) NOT NULL COMMENT '创建日期',
  `update_date` varchar(45) DEFAULT NULL COMMENT '更新日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Table structure for table `at_report_single_result_detail` */

DROP TABLE IF EXISTS `at_report_single_result_detail`;

CREATE TABLE `at_report_single_result_detail` (
  `exec_uid` varchar(45) NOT NULL COMMENT '执行ID',
  `test_name` varchar(100) NOT NULL COMMENT '测试方法名称',
  `test_params` text COMMENT '参数',
  `test_description` varchar(100) DEFAULT NULL COMMENT '测试脚本描述',
  `result_status` varchar(5) NOT NULL COMMENT 'pass,fail,skip',
  `test_start_time` varchar(45) NOT NULL COMMENT '单个开始时间',
  `test_end_time` varchar(45) DEFAULT NULL COMMENT '单个结束时间',
  `api_id` varchar(100) DEFAULT NULL COMMENT '接口ID',
  `api_desc` varchar(300) DEFAULT NULL COMMENT '接口描述',
  `test_duration` bigint(11) DEFAULT NULL COMMENT '单个脚本耗时',
  `test_class_name` varchar(500) DEFAULT NULL COMMENT '测试类名',
  `result_throwable` text COMMENT '测试异常信息',
  `result_stack_trace` text COMMENT '异常堆栈信息',
  `suite_name` varchar(100) DEFAULT NULL COMMENT '测试套件名称',
  `url` varchar(500) DEFAULT NULL COMMENT '接口url',
  `method` varchar(100) DEFAULT NULL COMMENT '请求方法',
  `tests_env` varchar(20) DEFAULT NULL COMMENT '测试环境',
  `client_type` varchar(20) DEFAULT NULL COMMENT '客户端类型B、C、E',
  `user_name` varchar(50) DEFAULT NULL COMMENT '接口登录用户名',
  `parameter_type` varchar(100) DEFAULT NULL COMMENT '请求参数类型',
  `priority_level` varchar(50) DEFAULT NULL COMMENT '用例优先级',
  `response_body` mediumblob COMMENT '请求返回体',
  `logs` mediumtext COMMENT '服务器日志',
  `is_scene` varchar(10) DEFAULT '0' COMMENT '0非场景1场景',
  KEY `detail_report` (`exec_uid`,`result_status`,`test_start_time`,`api_id`,`suite_name`) COMMENT '查询详细报告'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口自动化测试报告detail';

/*Table structure for table `at_report_single_result_header` */

DROP TABLE IF EXISTS `at_report_single_result_header`;

CREATE TABLE `at_report_single_result_header` (
  `exec_uid` varchar(45) NOT NULL COMMENT '报表执行ID',
  `application_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件名称',
  `tests_start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `tests_end_time` varchar(45) DEFAULT NULL COMMENT '结束时间',
  `create_by` varchar(45) NOT NULL COMMENT '创建者',
  `create_date` varchar(45) NOT NULL COMMENT '创建时间',
  `is_show` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `tests_duration` bigint(11) DEFAULT NULL COMMENT '耗时',
  `build_tag` varchar(100) DEFAULT NULL COMMENT 'jenkins build tag',
  `exec_user` varchar(50) DEFAULT NULL COMMENT 'jenkins user',
  `api_count` int(11) DEFAULT NULL COMMENT '接口数量',
  `passed_tests_size` int(11) DEFAULT NULL COMMENT '测试通过的数量',
  `failed_tests_size` int(11) DEFAULT NULL COMMENT '测试失败的数量',
  `skipped_tests_size` int(11) DEFAULT NULL COMMENT '测试跳过的数量',
  `pass_percent` decimal(10,4) DEFAULT NULL COMMENT '测试通过率',
  `git_tag` varchar(45) DEFAULT NULL COMMENT '被测代码git tag',
  `tests_env` varchar(20) DEFAULT NULL COMMENT '测试环境',
  `tests_total` int(11) DEFAULT NULL COMMENT '测试用例数量',
  PRIMARY KEY (`exec_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口自动化测试报告header';

/*Table structure for table `at_report_update_log` */

DROP TABLE IF EXISTS `at_report_update_log`;

CREATE TABLE `at_report_update_log` (
  `id` int(11) NOT NULL COMMENT '主键Id',
  `update_version` varchar(20) NOT NULL COMMENT '版本',
  `update_id` int(11) NOT NULL,
  `update_log` varchar(500) NOT NULL COMMENT '接口自动化平台升级日志',
  `create_date` varchar(45) NOT NULL COMMENT '上线时间',
  `source` varchar(45) NOT NULL COMMENT '来源',
  PRIMARY KEY (`id`,`update_version`,`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口自动化平台升级日志';

/*Table structure for table `execute_buried_ponit` */

DROP TABLE IF EXISTS `execute_buried_ponit`;

CREATE TABLE `execute_buried_ponit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `application_name` varchar(50) NOT NULL COMMENT '应用名称',
  `component_name` varchar(200) NOT NULL COMMENT '组件名称',
  `exec_user` varchar(50) NOT NULL COMMENT '用户',
  `create_date` varchar(45) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Table structure for table `focus_buried_point` */

DROP TABLE IF EXISTS `focus_buried_point`;

CREATE TABLE `focus_buried_point` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `application_name` varchar(50) NOT NULL COMMENT '应用名称',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件名称',
  `exec_user` varchar(50) NOT NULL COMMENT '用户',
  `create_date` varchar(45) NOT NULL COMMENT '操作时间',
  `flag` int(11) NOT NULL COMMENT '0关注1未关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Table structure for table `jenkins_job_record` */

DROP TABLE IF EXISTS `jenkins_job_record`;

CREATE TABLE `jenkins_job_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `exec_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'jenkins执行id',
  `component_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组件名称，即jenkins job名称',
  `build_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'jenkins build tag',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建时间',
  `submit_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `assigned_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作者',
  `build_id` int(11) DEFAULT NULL COMMENT 'jenkins build id',
  `remark` varchar(1000) DEFAULT NULL COMMENT '手动备注问题',
  PRIMARY KEY (`id`),
  KEY `buildTag` (`build_tag`),
  KEY `execId` (`exec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2226 DEFAULT CHARSET=utf8;

/*Table structure for table `message_center_email_hist` */

DROP TABLE IF EXISTS `message_center_email_hist`;

CREATE TABLE `message_center_email_hist` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mail_from` varchar(300) NOT NULL COMMENT '发件人',
  `mail_tos` tinytext NOT NULL COMMENT ' 收件人 ',
  `mail_ccs` varchar(1000) DEFAULT NULL COMMENT ' 收件人 ',
  `mail_subject` varchar(255) NOT NULL COMMENT '邮件主题',
  `mail_content` longtext COMMENT '邮件内容',
  `mail_type` varchar(10) NOT NULL,
  `create_time` varchar(45) NOT NULL COMMENT '开始时间',
  `is_sent` int(11) NOT NULL DEFAULT '0' COMMENT '0初始 1待发 2发送成功 3 发送失败',
  `attache_path` varchar(200) DEFAULT NULL COMMENT '附件路径',
  `update_time` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7321 DEFAULT CHARSET=utf8 COMMENT='邮件发送结果';

/*Table structure for table `utility_small_function` */

DROP TABLE IF EXISTS `utility_small_function`;

CREATE TABLE `utility_small_function` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `function_name` varchar(100) NOT NULL COMMENT '描述',
  `sql_statement` varchar(500) NOT NULL COMMENT 'sql语句',
  `environment` varchar(20) NOT NULL COMMENT '环境',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `view_daily_report` */

DROP TABLE IF EXISTS `view_daily_report`;

/*!50001 DROP VIEW IF EXISTS `view_daily_report` */;
/*!50001 DROP TABLE IF EXISTS `view_daily_report` */;

/*!50001 CREATE TABLE  `view_daily_report`(
 `exec_uid` varchar(45) ,
 `application_name` varchar(50) ,
 `component_name` varchar(200) ,
 `tests_end_time` varchar(45) ,
 `create_by` varchar(45) ,
 `api_count` int(11) ,
 `test_script_total` int(11) ,
 `test_script_pass` int(11) ,
 `pass_percent` decimal(10,4) 
)*/;

/*Table structure for table `view_header_by_date_component` */

DROP TABLE IF EXISTS `view_header_by_date_component`;

/*!50001 DROP VIEW IF EXISTS `view_header_by_date_component` */;
/*!50001 DROP TABLE IF EXISTS `view_header_by_date_component` */;

/*!50001 CREATE TABLE  `view_header_by_date_component`(
 `application_name` varchar(50) ,
 `component_name` varchar(200) ,
 `max_tests_end_time` varchar(45) ,
 `exec_uid` varchar(45) ,
 `create_date` varchar(10) 
)*/;

/*View structure for view view_daily_report */

/*!50001 DROP TABLE IF EXISTS `view_daily_report` */;
/*!50001 DROP VIEW IF EXISTS `view_daily_report` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`team_api_user`@`%` SQL SECURITY DEFINER VIEW `view_daily_report` AS select `at_report_single_result_header`.`exec_uid` AS `exec_uid`,`at_report_single_result_header`.`application_name` AS `application_name`,`at_report_single_result_header`.`component_name` AS `component_name`,`at_report_single_result_header`.`tests_end_time` AS `tests_end_time`,`at_report_single_result_header`.`create_by` AS `create_by`,`at_report_single_result_header`.`api_count` AS `api_count`,`at_report_single_result_header`.`tests_total` AS `test_script_total`,`at_report_single_result_header`.`passed_tests_size` AS `test_script_pass`,`at_report_single_result_header`.`pass_percent` AS `pass_percent` from `at_report_single_result_header` where `at_report_single_result_header`.`exec_uid` in (select `view_header_by_date_component`.`exec_uid` from `view_header_by_date_component`) order by `at_report_single_result_header`.`create_date` desc */;

/*View structure for view view_header_by_date_component */

/*!50001 DROP TABLE IF EXISTS `view_header_by_date_component` */;
/*!50001 DROP VIEW IF EXISTS `view_header_by_date_component` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`team_api_user`@`%` SQL SECURITY DEFINER VIEW `view_header_by_date_component` AS select `at_report_single_result_header`.`application_name` AS `application_name`,`at_report_single_result_header`.`component_name` AS `component_name`,max(`at_report_single_result_header`.`tests_end_time`) AS `max_tests_end_time`,max(`at_report_single_result_header`.`exec_uid`) AS `exec_uid`,substr(`at_report_single_result_header`.`create_date`,1,10) AS `create_date` from `at_report_single_result_header` group by `at_report_single_result_header`.`application_name`,`at_report_single_result_header`.`component_name`,substr(`at_report_single_result_header`.`create_date`,1,10) order by `create_date` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
