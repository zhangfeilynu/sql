/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.6.37 : Database - pqp_mgmt_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `about_us` */

DROP TABLE IF EXISTS `about_us`;

CREATE TABLE `about_us` (
  `year` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `month` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`year`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `apm_applications_list` */

DROP TABLE IF EXISTS `apm_applications_list`;

CREATE TABLE `apm_applications_list` (
  `application_name` varchar(255) NOT NULL COMMENT 'pinpiont applicationName',
  `service_type` varchar(255) DEFAULT NULL COMMENT 'pinpiont service type',
  `application_code` int(11) DEFAULT NULL COMMENT 'pinpiont application code',
  `create_time` varchar(45) NOT NULL,
  `component_id` varchar(45) DEFAULT NULL COMMENT '组件id',
  `remarks` varchar(45) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`application_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint_组件列表';

/*Table structure for table `apm_server_map_link_data` */

DROP TABLE IF EXISTS `apm_server_map_link_data`;

CREATE TABLE `apm_server_map_link_data` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `current_application_name` varchar(200) NOT NULL COMMENT '当前applicationname,基于这个applicationname查询数据',
  `link_key` varchar(500) NOT NULL COMMENT 'link key',
  `filter_application_name` varchar(200) NOT NULL COMMENT 'filterApplicationName',
  `from_key` varchar(200) NOT NULL COMMENT 'node key (applicationName+service_type)',
  `from_application_name` varchar(200) NOT NULL COMMENT 'application_name',
  `to_key` varchar(200) NOT NULL COMMENT 'node key (applicationName+service_type)',
  `to_application_name` varchar(200) NOT NULL COMMENT 'application_name',
  `to_agents` varchar(200) DEFAULT NULL COMMENT '机器列表',
  `to_agents_count` int(11) NOT NULL COMMENT '节点总数',
  `total_count` int(11) NOT NULL COMMENT '总数',
  `error_count` int(11) NOT NULL COMMENT '错误数量',
  `slow_count` int(11) NOT NULL COMMENT '慢的总数',
  `application_1s_count` int(11) NOT NULL COMMENT '1秒数量',
  `application_3s_count` int(11) NOT NULL COMMENT '3秒数量',
  `application_5s_count` int(11) NOT NULL COMMENT '5秒数量',
  `application_error_count` int(11) NOT NULL COMMENT 'error数量',
  `application_slow_count` int(11) NOT NULL COMMENT 'slow数量',
  `is_provider` int(11) NOT NULL DEFAULT '1',
  `create_time` varchar(45) NOT NULL COMMENT '创建时间',
  `from_date` varchar(45) DEFAULT NULL,
  `to_date` varchar(45) DEFAULT NULL,
  `has_alert` varchar(45) NOT NULL COMMENT 'hasAlert',
  `sync_month` int(11) DEFAULT NULL,
  `sync_week` int(11) DEFAULT NULL,
  `sync_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint getServerMapData link data';

/*Table structure for table `apm_server_map_node_data` */

DROP TABLE IF EXISTS `apm_server_map_node_data`;

CREATE TABLE `apm_server_map_node_data` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `current_application_name` varchar(200) DEFAULT NULL COMMENT '当前applicationname,基于这个applicationname查询数据',
  `node_key` varchar(500) NOT NULL COMMENT 'node key',
  `application_name` varchar(200) NOT NULL COMMENT 'applicationName',
  `service_type` varchar(45) NOT NULL COMMENT 'serviceType',
  `service_type_code` int(11) NOT NULL COMMENT 'serviceTypeCode',
  `total_count` int(11) NOT NULL COMMENT '总数',
  `instance_count` int(11) NOT NULL COMMENT 'instanceCount',
  `error_count` int(11) NOT NULL COMMENT '错误数量',
  `slow_count` int(11) NOT NULL COMMENT '慢的总数',
  `application_1s_count` int(11) NOT NULL COMMENT '1秒数量',
  `application_3s_count` int(11) NOT NULL COMMENT '3秒数量',
  `application_5s_count` int(11) NOT NULL COMMENT '5秒数量',
  `application_error_count` int(11) NOT NULL COMMENT 'error数量',
  `application_slow_count` int(11) NOT NULL COMMENT 'slow数量',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `from_date` varchar(45) DEFAULT NULL,
  `to_date` varchar(45) DEFAULT NULL,
  `is_authorized` varchar(45) NOT NULL COMMENT 'isAuthorized',
  `is_queue` varchar(45) NOT NULL COMMENT 'isQueue',
  `server_list` varchar(5000) NOT NULL COMMENT 'serverList list',
  `has_alert` varchar(45) NOT NULL COMMENT 'hasAlert',
  `agent_histogram` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint getServerMapData node data';

/*Table structure for table `apm_transaction_metadata_del_log` */

DROP TABLE IF EXISTS `apm_transaction_metadata_del_log`;

CREATE TABLE `apm_transaction_metadata_del_log` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `is_ok` varchar(45) NOT NULL COMMENT '是否可以',
  `dele_count` int(11) NOT NULL COMMENT '删除总数',
  `trans_message` varchar(200) DEFAULT NULL COMMENT '结果',
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`sync_date`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口耗时删除记录';

/*Table structure for table `apm_transaction_metadata_summary` */

DROP TABLE IF EXISTS `apm_transaction_metadata_summary`;

CREATE TABLE `apm_transaction_metadata_summary` (
  `start_date` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '接口开始时间',
  `application_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'pinpoint组件名称',
  `api_path` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'api路径',
  `total_request` int(20) DEFAULT NULL COMMENT '请求次数',
  `min_elapsed` int(20) DEFAULT NULL COMMENT '最小耗时',
  `max_elapsed` int(20) DEFAULT NULL COMMENT '最大耗时',
  `avg_elapsed` double(16,2) DEFAULT NULL COMMENT '平均耗时',
  `elapsed_80_pencent` int(20) DEFAULT NULL COMMENT '80%的耗时（从小到大）',
  `elapsed_85_pencent` int(20) DEFAULT NULL COMMENT '85%的耗时（从小到大）',
  `elapsed_90_pencent` int(20) DEFAULT NULL COMMENT '90%的耗时（从小到大）',
  `elapsed_95_pencent` int(20) DEFAULT NULL COMMENT '95%的耗时（从小到大）',
  `elapsed_99_pencent` int(20) DEFAULT NULL COMMENT '99%的耗时（从小到大）',
  `elapsed_lessthan_1` int(20) DEFAULT NULL COMMENT '小于&等于1秒个数',
  `elapsed_1_between_3` int(20) DEFAULT NULL COMMENT '1-3秒个数',
  `elapsed_3_between_5` int(20) DEFAULT NULL COMMENT '3-5秒个数',
  `elapsed_morethan_5` int(20) DEFAULT NULL COMMENT '>5秒个数',
  `exception_total_count` int(20) DEFAULT NULL COMMENT '异常总数',
  `exception_avg_elapsed` double(16,2) DEFAULT NULL COMMENT '异常 平均耗时',
  `exception_max_elapsed` int(20) DEFAULT NULL COMMENT '异常 max耗时',
  `exception_min_elapsed` int(20) DEFAULT NULL COMMENT '异常 min耗时',
  `create_time` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '插入时间',
  `remark` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`start_date`,`application_name`,`api_path`),
  KEY `index` (`start_date`,`api_path`,`application_name`,`total_request`,`elapsed_95_pencent`),
  KEY `95` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90` (`start_date`,`api_path`,`elapsed_90_pencent`),
  KEY `95desc` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90desc` (`api_path`,`start_date`,`elapsed_90_pencent`),
  KEY `elapsedrank` (`api_path`,`min_elapsed`,`max_elapsed`,`avg_elapsed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='汇总apm_transaction_metadata_v2的数据  ';

/*Table structure for table `apm_transaction_metadata_summary_2017` */

DROP TABLE IF EXISTS `apm_transaction_metadata_summary_2017`;

CREATE TABLE `apm_transaction_metadata_summary_2017` (
  `start_date` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '接口开始时间',
  `application_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'pinpoint组件名称',
  `api_path` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'api路径',
  `total_request` int(20) DEFAULT NULL COMMENT '请求次数',
  `min_elapsed` int(20) DEFAULT NULL COMMENT '最小耗时',
  `max_elapsed` int(20) DEFAULT NULL COMMENT '最大耗时',
  `avg_elapsed` double(16,2) DEFAULT NULL COMMENT '平均耗时',
  `elapsed_80_pencent` int(20) DEFAULT NULL COMMENT '80%的耗时（从小到大）',
  `elapsed_85_pencent` int(20) DEFAULT NULL COMMENT '85%的耗时（从小到大）',
  `elapsed_90_pencent` int(20) DEFAULT NULL COMMENT '90%的耗时（从小到大）',
  `elapsed_95_pencent` int(20) DEFAULT NULL COMMENT '95%的耗时（从小到大）',
  `elapsed_99_pencent` int(20) DEFAULT NULL COMMENT '99%的耗时（从小到大）',
  `elapsed_lessthan_1` int(20) DEFAULT NULL COMMENT '小于&等于1秒个数',
  `elapsed_1_between_3` int(20) DEFAULT NULL COMMENT '1-3秒个数',
  `elapsed_3_between_5` int(20) DEFAULT NULL COMMENT '3-5秒个数',
  `elapsed_morethan_5` int(20) DEFAULT NULL COMMENT '>5秒个数',
  `exception_total_count` int(20) DEFAULT NULL COMMENT '异常总数',
  `exception_avg_elapsed` double(16,2) DEFAULT NULL COMMENT '异常 平均耗时',
  `exception_max_elapsed` int(20) DEFAULT NULL COMMENT '异常 max耗时',
  `exception_min_elapsed` int(20) DEFAULT NULL COMMENT '异常 min耗时',
  `create_time` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '插入时间',
  `remark` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`start_date`,`application_name`,`api_path`),
  KEY `index` (`start_date`,`api_path`,`application_name`,`total_request`,`elapsed_95_pencent`),
  KEY `95` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90` (`start_date`,`api_path`,`elapsed_90_pencent`),
  KEY `95desc` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90desc` (`api_path`,`start_date`,`elapsed_90_pencent`),
  KEY `elapsedrank` (`api_path`,`min_elapsed`,`max_elapsed`,`avg_elapsed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='汇总apm_transaction_metadata_v2的数据  ';

/*Table structure for table `apm_transaction_metadata_summary_2018` */

DROP TABLE IF EXISTS `apm_transaction_metadata_summary_2018`;

CREATE TABLE `apm_transaction_metadata_summary_2018` (
  `start_date` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '接口开始时间',
  `application_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'pinpoint组件名称',
  `api_path` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT 'api路径',
  `total_request` int(20) DEFAULT NULL COMMENT '请求次数',
  `min_elapsed` int(20) DEFAULT NULL COMMENT '最小耗时',
  `max_elapsed` int(20) DEFAULT NULL COMMENT '最大耗时',
  `avg_elapsed` double(16,2) DEFAULT NULL COMMENT '平均耗时',
  `elapsed_80_pencent` int(20) DEFAULT NULL COMMENT '80%的耗时（从小到大）',
  `elapsed_85_pencent` int(20) DEFAULT NULL COMMENT '85%的耗时（从小到大）',
  `elapsed_90_pencent` int(20) DEFAULT NULL COMMENT '90%的耗时（从小到大）',
  `elapsed_95_pencent` int(20) DEFAULT NULL COMMENT '95%的耗时（从小到大）',
  `elapsed_99_pencent` int(20) DEFAULT NULL COMMENT '99%的耗时（从小到大）',
  `elapsed_lessthan_1` int(20) DEFAULT NULL COMMENT '小于&等于1秒个数',
  `elapsed_1_between_3` int(20) DEFAULT NULL COMMENT '1-3秒个数',
  `elapsed_3_between_5` int(20) DEFAULT NULL COMMENT '3-5秒个数',
  `elapsed_morethan_5` int(20) DEFAULT NULL COMMENT '>5秒个数',
  `exception_total_count` int(20) DEFAULT NULL COMMENT '异常总数',
  `exception_avg_elapsed` double(16,2) DEFAULT NULL COMMENT '异常 平均耗时',
  `exception_max_elapsed` int(20) DEFAULT NULL COMMENT '异常 max耗时',
  `exception_min_elapsed` int(20) DEFAULT NULL COMMENT '异常 min耗时',
  `create_time` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '插入时间',
  `remark` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`start_date`,`application_name`,`api_path`),
  KEY `index` (`start_date`,`api_path`,`application_name`,`total_request`,`elapsed_95_pencent`),
  KEY `95` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90` (`start_date`,`api_path`,`elapsed_90_pencent`),
  KEY `95desc` (`start_date`,`api_path`,`elapsed_95_pencent`),
  KEY `90desc` (`api_path`,`start_date`,`elapsed_90_pencent`),
  KEY `elapsedrank` (`api_path`,`min_elapsed`,`max_elapsed`,`avg_elapsed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='汇总apm_transaction_metadata_v2的数据  ';

/*Table structure for table `apm_transaction_metadata_sync_log` */

DROP TABLE IF EXISTS `apm_transaction_metadata_sync_log`;

CREATE TABLE `apm_transaction_metadata_sync_log` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(255) NOT NULL COMMENT 'pinpiont applicationName',
  `is_ok` varchar(45) NOT NULL COMMENT '是否可以',
  `insert_count` int(11) NOT NULL COMMENT '插入总数',
  `total_count` int(11) NOT NULL COMMENT '获取总数',
  `trans_message` varchar(200) DEFAULT NULL COMMENT '结果',
  `start_time` varchar(45) DEFAULT NULL COMMENT '执行开始时间',
  `end_time` varchar(45) DEFAULT NULL COMMENT '执行结束时间',
  `time_diff` int(45) DEFAULT '0' COMMENT '时间间隔',
  `trans_offset` int(11) DEFAULT NULL,
  `trans_limit` int(11) DEFAULT NULL,
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`sync_date`,`application_name`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint_接口耗时同步记录';

/*Table structure for table `apm_transaction_metadata_sync_log_2017` */

DROP TABLE IF EXISTS `apm_transaction_metadata_sync_log_2017`;

CREATE TABLE `apm_transaction_metadata_sync_log_2017` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(255) NOT NULL COMMENT 'pinpiont applicationName',
  `is_ok` varchar(45) NOT NULL COMMENT '是否可以',
  `insert_count` int(11) NOT NULL COMMENT '插入总数',
  `total_count` int(11) NOT NULL COMMENT '获取总数',
  `trans_message` varchar(200) DEFAULT NULL COMMENT '结果',
  `start_time` varchar(45) DEFAULT NULL COMMENT '执行开始时间',
  `end_time` varchar(45) DEFAULT NULL COMMENT '执行结束时间',
  `time_diff` int(45) DEFAULT '0' COMMENT '时间间隔',
  `trans_offset` int(11) DEFAULT NULL,
  `trans_limit` int(11) DEFAULT NULL,
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`sync_date`,`application_name`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint_接口耗时同步记录';

/*Table structure for table `apm_transaction_metadata_sync_log_2018` */

DROP TABLE IF EXISTS `apm_transaction_metadata_sync_log_2018`;

CREATE TABLE `apm_transaction_metadata_sync_log_2018` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(255) NOT NULL COMMENT 'pinpiont applicationName',
  `is_ok` varchar(45) NOT NULL COMMENT '是否可以',
  `insert_count` int(11) NOT NULL COMMENT '插入总数',
  `total_count` int(11) NOT NULL COMMENT '获取总数',
  `trans_message` varchar(200) DEFAULT NULL COMMENT '结果',
  `start_time` varchar(45) DEFAULT NULL COMMENT '执行开始时间',
  `end_time` varchar(45) DEFAULT NULL COMMENT '执行结束时间',
  `time_diff` int(45) DEFAULT '0' COMMENT '时间间隔',
  `trans_offset` int(11) DEFAULT NULL,
  `trans_limit` int(11) DEFAULT NULL,
  `create_time` varchar(45) NOT NULL,
  PRIMARY KEY (`sync_date`,`application_name`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint_接口耗时同步记录';

/*Table structure for table `apm_transaction_metadata_v2` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2`;

CREATE TABLE `apm_transaction_metadata_v2` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_0` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_0`;

CREATE TABLE `apm_transaction_metadata_v2_0` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_1` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_1`;

CREATE TABLE `apm_transaction_metadata_v2_1` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_2` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_2`;

CREATE TABLE `apm_transaction_metadata_v2_2` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_3` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_3`;

CREATE TABLE `apm_transaction_metadata_v2_3` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_4` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_4`;

CREATE TABLE `apm_transaction_metadata_v2_4` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_5` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_5`;

CREATE TABLE `apm_transaction_metadata_v2_5` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_6` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_6`;

CREATE TABLE `apm_transaction_metadata_v2_6` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_7` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_7`;

CREATE TABLE `apm_transaction_metadata_v2_7` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_8` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_8`;

CREATE TABLE `apm_transaction_metadata_v2_8` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `apm_transaction_metadata_v2_9` */

DROP TABLE IF EXISTS `apm_transaction_metadata_v2_9`;

CREATE TABLE `apm_transaction_metadata_v2_9` (
  `sync_date` varchar(45) NOT NULL COMMENT '同步时间',
  `application_name` varchar(45) NOT NULL COMMENT 'pinpiont applicationName',
  `api_path` varchar(250) NOT NULL COMMENT 'api 路径',
  `elapsed` int(11) NOT NULL COMMENT '耗时（毫秒）',
  `start_time` varchar(45) NOT NULL COMMENT '开始时间',
  `exception` int(11) DEFAULT NULL COMMENT 'exception',
  `created_time` varchar(45) NOT NULL COMMENT '同步时间',
  `agent_id` varchar(100) DEFAULT NULL COMMENT 'agent id',
  `collector_accept_time` varchar(45) DEFAULT NULL COMMENT '收集时间',
  `trace_id` varchar(200) DEFAULT NULL COMMENT '跟踪id(Transaction)',
  KEY `elapsed_asc` (`elapsed`),
  KEY `elapsed_desc` (`elapsed`),
  KEY `sync_date` (`sync_date`),
  KEY `pk` (`application_name`,`sync_date`,`api_path`),
  KEY `start_date` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pinpoint 接口耗时V2';

/*Table structure for table `component_info` */

DROP TABLE IF EXISTS `component_info`;

CREATE TABLE `component_info` (
  `component_id` varchar(200) NOT NULL COMMENT '组件id',
  `application_name` varchar(255) DEFAULT NULL COMMENT '应用Name',
  `application_id` varchar(255) DEFAULT NULL COMMENT '应用id',
  `pinpoint_application_name` varchar(255) DEFAULT NULL COMMENT 'pinpiont applicationName',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(45) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `team_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件列表';

/*Table structure for table `component_info_20180118` */

DROP TABLE IF EXISTS `component_info_20180118`;

CREATE TABLE `component_info_20180118` (
  `component_id` varchar(200) NOT NULL COMMENT '组件id',
  `application_name` varchar(255) DEFAULT NULL COMMENT '应用Name',
  `application_id` varchar(255) DEFAULT NULL COMMENT '应用id',
  `pinpoint_application_name` varchar(255) DEFAULT NULL COMMENT 'pinpiont applicationName',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(45) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `team_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件列表';

/*Table structure for table `component_info_old` */

DROP TABLE IF EXISTS `component_info_old`;

CREATE TABLE `component_info_old` (
  `component_id` varchar(200) NOT NULL COMMENT '组件id',
  `application_name` varchar(255) DEFAULT NULL COMMENT '应用Name',
  `application_id` varchar(255) DEFAULT NULL COMMENT '应用id',
  `pinpoint_application_name` varchar(255) DEFAULT NULL COMMENT 'pinpiont applicationName',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(45) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `team_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组件列表';

/*Table structure for table `load_aggregate_result` */

DROP TABLE IF EXISTS `load_aggregate_result`;

CREATE TABLE `load_aggregate_result` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `request_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sample_total_number` int(50) DEFAULT NULL,
  `error_count` int(50) DEFAULT NULL,
  `error_pct` float(50,2) DEFAULT NULL,
  `min` float(50,2) DEFAULT NULL,
  `max` float(50,2) DEFAULT NULL,
  `average` float(50,2) DEFAULT NULL,
  `pct_90th` float(50,2) DEFAULT NULL,
  `pct_95th` float(50,2) DEFAULT NULL,
  `pct_99th` float(50,2) DEFAULT NULL,
  `throughput` float(50,2) DEFAULT NULL,
  `bandwidth` float(50,2) DEFAULT NULL,
  `node_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3316 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_application` */

DROP TABLE IF EXISTS `load_application`;

CREATE TABLE `load_application` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `node_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `application_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `application_env` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `component_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tag_number` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `request_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6745 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_data_pull_history` */

DROP TABLE IF EXISTS `load_data_pull_history`;

CREATE TABLE `load_data_pull_history` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `influx_database_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `influx_measurement_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `influx_server` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `influx_env` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pull_data_start_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `pull_data_end_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3315 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_download` */

DROP TABLE IF EXISTS `load_download`;

CREATE TABLE `load_download` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `software` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `software_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_help` */

DROP TABLE IF EXISTS `load_help`;

CREATE TABLE `load_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_jenkins` */

DROP TABLE IF EXISTS `load_jenkins`;

CREATE TABLE `load_jenkins` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `build_number` int(200) DEFAULT NULL,
  `build_id` int(200) DEFAULT NULL,
  `build_url` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `job_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `executor_number` int(100) DEFAULT NULL,
  `node_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `node_lables` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `jenkins_url` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_remark` */

DROP TABLE IF EXISTS `load_remark`;

CREATE TABLE `load_remark` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark_user` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `remark_role` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `remark_content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark_approve` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `create_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `update_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_report` */

DROP TABLE IF EXISTS `load_report`;

CREATE TABLE `load_report` (
  `id` int(230) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '测试名',
  `create_date` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT ' 生成日期',
  `report_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'PDF报告结果',
  `report_path` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `report_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `report_create` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `report_download` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_result_file` */

DROP TABLE IF EXISTS `load_result_file`;

CREATE TABLE `load_result_file` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_dashboard` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_csv_result` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_aggregate_result` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_error_html` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_error_xml` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `response_timesOverTime_png` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `throughputVs_threads_png` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `transactions_perSecond_png` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_result_focus` */

DROP TABLE IF EXISTS `load_result_focus`;

CREATE TABLE `load_result_focus` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `exec_user` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `attention` int(5) DEFAULT NULL,
  `create_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `application_env` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `focus_message` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_run` */

DROP TABLE IF EXISTS `load_run`;

CREATE TABLE `load_run` (
  `test_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `project_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `department_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属部门',
  `perf_github_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '性能Github项目',
  `jmeter_plan` varchar(50) COLLATE utf8_bin DEFAULT 'JMeter测试计划',
  `test_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '测试类型',
  `test_env` varchar(20) COLLATE utf8_bin DEFAULT '测试环境',
  `available_machine` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `test_objective` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `test_status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `test_result` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `bug_id` int(20) DEFAULT NULL,
  `create_date` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `update_date` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `result_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_test_client` */

DROP TABLE IF EXISTS `load_test_client`;

CREATE TABLE `load_test_client` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `node_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `client_tool` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `client_response_timeout` int(100) DEFAULT NULL,
  `client_network_timeout` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_test_start_end` */

DROP TABLE IF EXISTS `load_test_start_end`;

CREATE TABLE `load_test_start_end` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `start_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `start_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `node_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `end_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `end_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_virtual_users` */

DROP TABLE IF EXISTS `load_virtual_users`;

CREATE TABLE `load_virtual_users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `node_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `test_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `finished_threads` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_zabbix_ip` */

DROP TABLE IF EXISTS `load_zabbix_ip`;

CREATE TABLE `load_zabbix_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_ipaddress` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `app_env` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_zabbix_result` */

DROP TABLE IF EXISTS `load_zabbix_result`;

CREATE TABLE `load_zabbix_result` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `application_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `component_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `server_ip` varchar(100) COLLATE utf8_bin NOT NULL,
  `cpu_utilization_png` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `cpu_load_png` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `memory_usage_png` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `disk_space_usage_png` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `network_traffic_png` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sync_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sync_time` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `load_zabbix_server` */

DROP TABLE IF EXISTS `load_zabbix_server`;

CREATE TABLE `load_zabbix_server` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `application_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `component_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `server_ipaddress` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `service_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `host_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `app_env` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `server_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `jmeter_plan` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `create_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `project_department_mapping` */

DROP TABLE IF EXISTS `project_department_mapping`;

CREATE TABLE `project_department_mapping` (
  `id` int(11) NOT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
