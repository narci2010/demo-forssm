/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : supervisor

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-08-09 22:58:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '资源', 'menu', '', '0', '0/', '', '1');
INSERT INTO `sys_resource` VALUES ('11', '组织机构管理', 'menu', '/organization', '1', '0/1/', 'organization:*', '1');
INSERT INTO `sys_resource` VALUES ('12', '组织机构新增', 'button', '', '11', '0/1/11/', 'organization:create', '1');
INSERT INTO `sys_resource` VALUES ('13', '组织机构修改', 'button', '', '11', '0/1/11/', 'organization:update', '1');
INSERT INTO `sys_resource` VALUES ('14', '组织机构删除', 'button', '', '11', '0/1/11/', 'organization:delete', '1');
INSERT INTO `sys_resource` VALUES ('15', '组织机构查看', 'button', '', '11', '0/1/11/', 'organization:view', '1');
INSERT INTO `sys_resource` VALUES ('21', '用户管理', 'menu', '/user', '1', '0/1/', 'user:*', '1');
INSERT INTO `sys_resource` VALUES ('22', '用户新增', 'button', '', '21', '0/1/21/', 'user:create', '1');
INSERT INTO `sys_resource` VALUES ('23', '用户修改', 'button', '', '21', '0/1/21/', 'user:update', '1');
INSERT INTO `sys_resource` VALUES ('24', '用户删除', 'button', '', '21', '0/1/21/', 'user:delete', '1');
INSERT INTO `sys_resource` VALUES ('25', '用户查看', 'button', '', '21', '0/1/21/', 'user:view', '1');
INSERT INTO `sys_resource` VALUES ('31', '资源管理', 'menu', '/resource', '1', '0/1/', 'resource:*', '1');
INSERT INTO `sys_resource` VALUES ('32', '资源新增', 'button', '', '31', '0/1/31/', 'resource:create', '1');
INSERT INTO `sys_resource` VALUES ('33', '资源修改', 'button', '', '31', '0/1/31/', 'resource:update', '1');
INSERT INTO `sys_resource` VALUES ('34', '资源删除', 'button', '', '31', '0/1/31/', 'resource:delete', '1');
INSERT INTO `sys_resource` VALUES ('35', '资源查看', 'button', '', '31', '0/1/31/', 'resource:view', '1');
INSERT INTO `sys_resource` VALUES ('41', '角色管理', 'menu', '/role', '1', '0/1/', 'role:*', '1');
INSERT INTO `sys_resource` VALUES ('42', '角色新增', 'button', '', '41', '0/1/41/', 'role:create', '1');
INSERT INTO `sys_resource` VALUES ('43', '角色修改', 'button', '', '41', '0/1/41/', 'role:update', '1');
INSERT INTO `sys_resource` VALUES ('44', '角色删除', 'button', '', '41', '0/1/41/', 'role:delete', '1');
INSERT INTO `sys_resource` VALUES ('45', '角色查看', 'button', '', '41', '0/1/41/', 'role:view', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '超级管理员', '11,21,31,41', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'd3c59d25033dbf980d29554025c23a75', '8d78869f470951332959580424d4bf4f', '1', '0');

-- ----------------------------
-- Table structure for t_allowance_info
-- ----------------------------
DROP TABLE IF EXISTS `t_allowance_info`;
CREATE TABLE `t_allowance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listen_allowance` decimal(11,0) DEFAULT NULL COMMENT '听课津贴',
  `remote_city_allowance` decimal(11,0) DEFAULT NULL COMMENT '异城市津贴',
  `remote_campus_allowance` decimal(11,0) DEFAULT NULL COMMENT '异校园津贴',
  `supervisor_allowance` decimal(11,0) DEFAULT NULL COMMENT '督导津贴',
  `groupLeader_allowance` decimal(11,0) DEFAULT NULL COMMENT '督导组长津贴',
  `other_allowance` decimal(11,0) DEFAULT NULL COMMENT '其他津贴',
  `deleted` int(8) DEFAULT '0' COMMENT '删除1 存在 0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_allowance_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `option_id` int(11) DEFAULT NULL COMMENT '选项id',
  `temp_id` int(11) DEFAULT NULL COMMENT '模板id',
  `deleted` int(8) DEFAULT '0',
  `question_group_id` int(11) DEFAULT NULL COMMENT '题目组id',
  `question_id` int(11) DEFAULT NULL COMMENT '题目id',
  `answer` varchar(255) DEFAULT NULL COMMENT '答案 填空题直接是答案(文字) 选择题选中是1 选择题没有选中是0',
  `record_id` int(11) DEFAULT NULL COMMENT '记录表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_answer
-- ----------------------------
INSERT INTO `t_answer` VALUES ('1', '1', '2', null, '0', null, null, '0', null);
INSERT INTO `t_answer` VALUES ('2', '1', '248', null, '0', null, null, '0', null);
INSERT INTO `t_answer` VALUES ('3', '1', '249', null, '0', null, null, '0', null);
INSERT INTO `t_answer` VALUES ('4', '1', '250', null, '0', null, null, '0', null);
INSERT INTO `t_answer` VALUES ('5', '1', '251', null, '0', null, null, '0', null);
INSERT INTO `t_answer` VALUES ('6', '1', '252', null, '0', null, null, '1', null);

-- ----------------------------
-- Table structure for t_course_group
-- ----------------------------
DROP TABLE IF EXISTS `t_course_group`;
CREATE TABLE `t_course_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学科分组',
  `name` varchar(4000) DEFAULT NULL COMMENT '学科分组名称',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_group
-- ----------------------------
INSERT INTO `t_course_group` VALUES ('1', '音乐', '0');
INSERT INTO `t_course_group` VALUES ('2', '文学', '0');
INSERT INTO `t_course_group` VALUES ('3', '哲学', '0');
INSERT INTO `t_course_group` VALUES ('4', '经济学', '0');
INSERT INTO `t_course_group` VALUES ('5', '法学', '0');
INSERT INTO `t_course_group` VALUES ('6', '教育学', '0');
INSERT INTO `t_course_group` VALUES ('7', '历史学', '0');
INSERT INTO `t_course_group` VALUES ('8', '理学', '0');
INSERT INTO `t_course_group` VALUES ('9', '工学', '0');
INSERT INTO `t_course_group` VALUES ('10', '农学', '0');
INSERT INTO `t_course_group` VALUES ('11', '医学', '0');

-- ----------------------------
-- Table structure for t_course_info
-- ----------------------------
DROP TABLE IF EXISTS `t_course_info`;
CREATE TABLE `t_course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_unit` varchar(400) DEFAULT NULL COMMENT '开课单位(学院名称)',
  `year` varchar(400) DEFAULT NULL COMMENT '学年',
  `term` int(4) DEFAULT NULL COMMENT '学期',
  `teacher_rank` varchar(400) DEFAULT NULL COMMENT '教师职称',
  `class_no` varchar(400) DEFAULT NULL COMMENT '教学班号',
  `techer_name` varchar(400) DEFAULT NULL COMMENT '教师名称',
  `techer_no` varchar(400) DEFAULT NULL COMMENT '教师职工号',
  `course_no` varchar(400) DEFAULT NULL COMMENT '课程号',
  `course_name` varchar(400) DEFAULT NULL COMMENT '课程名称',
  `region` varchar(400) DEFAULT NULL COMMENT '所在校区',
  `class_info` varchar(400) DEFAULT NULL COMMENT '上课时间地点',
  `couse_type` varchar(400) DEFAULT NULL COMMENT '课程类别',
  `credit` varchar(400) DEFAULT NULL COMMENT '学分',
  `period` varchar(400) DEFAULT NULL COMMENT '学时',
  `reading_object` varchar(400) DEFAULT NULL COMMENT '修读对象',
  `couse_person_num` int(4) DEFAULT NULL COMMENT '选课人数',
  `max_listen_num_teacher` int(4) DEFAULT NULL COMMENT '最大听课数(教师)',
  `listened_num_teacher` int(4) DEFAULT NULL COMMENT '已被听课数(教师)',
  `selected_num_teacher` int(4) DEFAULT NULL COMMENT '已被选次数(教师)',
  `max_list_num_course` int(4) DEFAULT NULL COMMENT '最大听课数(课程)',
  `listened_num_course` int(4) DEFAULT NULL COMMENT '已被听课数(课程)',
  `selected_num_course` int(4) DEFAULT NULL COMMENT '已被选次数(课程)',
  `is_prior_listen_teacher` varchar(4) DEFAULT NULL COMMENT '是否优先听课（老师）',
  `is_prior_listen_course` varchar(4) DEFAULT NULL COMMENT '是否优先听课(课程   判断:督导次数过少,设置优先,排序到前面)',
  `deleted` int(8) DEFAULT '0',
  `template_id` int(11) DEFAULT NULL COMMENT '模板id',
  `region_id` int(4) DEFAULT NULL COMMENT '校园id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_info
-- ----------------------------
INSERT INTO `t_course_info` VALUES ('1', '环境科学与工程学院', '2016-2017', '1', '副教授', '38103825162002', '曾星舟', '000108', '38103825', 'GIS与环境信息系统', '东校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', null, '1', '12', '0', '0', '12', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('2', '环境科学与工程学院', '2016-2017', '1', '副教授', '38103825162011', '曾星舟', '000107', '38103834', 'GIS与环境信息系统', '西校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专必', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('3', '环境科学与工程学院', '2016-2017', '1', '副教授', '38103825162003', '杨星舟', '000109', '38103826', 'GIS与环境信息系统', '南校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('4', '环境科学与工程学院', '2016-2017', '1', '副教授', '38103825162004', '周星舟', '000110', '38103827', 'GIS与环境信息系统', '北校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '公必', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('5', '环境科学与工程学院', '2016-2017', '1', '副教授', '38103825162005', '陈星舟', '000111', '38103828', 'GIS与环境信息系统', '东校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('6', '文学院', '2016-2017', '1', '副教授', '38103825162006', '谢星舟', '000112', '38103829', '中国古代文学', '西校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专必', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('7', '文学院', '2016-2017', '1', '副教授', '38103825162007', '李星舟', '000113', '38103830', '中国古代文学', '南校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '公必', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('8', '文学院', '2016-2017', '1', '副教授', '38103825162008', '白星舟', '000114', '38103831', '中国古代文学', '北校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('9', '文学院', '2016-2017', '1', '副教授', '38103825162009', '杜星舟', '000115', '38103832', '中国古代文学', '东校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);
INSERT INTO `t_course_info` VALUES ('10', '文学院', '2016-2017', '1', '副教授', '38103825162010', '黄星舟', '000116', '38103833', '中国古代文学', '东校区', '星期一 8-10 节/实验中心A401（1-9 周）,星期一 8-10 节/实验中心A401（10-18 周）', '专选', '3', '3', '', '1', '33', '0', '0', '33', '0', '0', '0', '0', '0', null, null);

-- ----------------------------
-- Table structure for t_course_item
-- ----------------------------
DROP TABLE IF EXISTS `t_course_item`;
CREATE TABLE `t_course_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_group_id` int(11) DEFAULT NULL COMMENT '学科分组id',
  `name` varchar(255) DEFAULT NULL COMMENT '组别名称',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_item
-- ----------------------------
INSERT INTO `t_course_item` VALUES ('1', '2', '文学1组', '0');
INSERT INTO `t_course_item` VALUES ('2', '1', '文学1组', '0');
INSERT INTO `t_course_item` VALUES ('3', '3', '哲学1组', '0');
INSERT INTO `t_course_item` VALUES ('4', '3', '哲学2组', '0');
INSERT INTO `t_course_item` VALUES ('5', '3', '哲学3组', '0');
INSERT INTO `t_course_item` VALUES ('6', '4', '经济学1组', '0');
INSERT INTO `t_course_item` VALUES ('7', '4', '经济学2组', '0');
INSERT INTO `t_course_item` VALUES ('8', '4', '经济学3组', '0');
INSERT INTO `t_course_item` VALUES ('9', '5', '法学1组', '0');
INSERT INTO `t_course_item` VALUES ('10', '5', '法学2组', '0');
INSERT INTO `t_course_item` VALUES ('11', '5', '法学3组', '0');
INSERT INTO `t_course_item` VALUES ('12', '6', '教育学1组', '0');
INSERT INTO `t_course_item` VALUES ('13', '6', '教育学2组', '0');
INSERT INTO `t_course_item` VALUES ('14', '6', '教育学3组', '0');
INSERT INTO `t_course_item` VALUES ('15', '7', '历史学1组', '0');
INSERT INTO `t_course_item` VALUES ('16', '7', '历史学2组', '0');
INSERT INTO `t_course_item` VALUES ('17', '7', '历史学3组', '0');
INSERT INTO `t_course_item` VALUES ('18', '8', '理学1组', '0');
INSERT INTO `t_course_item` VALUES ('19', '8', '理学2组', '0');
INSERT INTO `t_course_item` VALUES ('20', '8', '理学3组', '0');
INSERT INTO `t_course_item` VALUES ('21', '9', '工学1组', '0');
INSERT INTO `t_course_item` VALUES ('22', '9', '工学2组', '0');
INSERT INTO `t_course_item` VALUES ('23', '9', '工学3组', '0');
INSERT INTO `t_course_item` VALUES ('24', '10', '农学1组', '0');
INSERT INTO `t_course_item` VALUES ('25', '10', '农学2组', '0');
INSERT INTO `t_course_item` VALUES ('26', '10', '农学3组', '0');
INSERT INTO `t_course_item` VALUES ('27', '11', '医学1组', '0');
INSERT INTO `t_course_item` VALUES ('28', '11', '医学2组', '0');
INSERT INTO `t_course_item` VALUES ('29', '11', '医学3组', '0');

-- ----------------------------
-- Table structure for t_course_plan_zsu
-- ----------------------------
DROP TABLE IF EXISTS `t_course_plan_zsu`;
CREATE TABLE `t_course_plan_zsu` (
  `SKXX_ID` varchar(200) NOT NULL COMMENT '逻辑ID',
  `JXBH` varchar(400) DEFAULT NULL COMMENT '教学班号',
  `QSZ` int(10) DEFAULT NULL COMMENT '起始周',
  `JSZ` int(10) DEFAULT NULL COMMENT '结束周',
  `DSZ` int(10) DEFAULT NULL COMMENT '单双周',
  `XQDM` int(10) DEFAULT NULL COMMENT '星期几',
  `KSJ` int(10) DEFAULT NULL COMMENT '开始节',
  `JSJ` int(10) DEFAULT NULL COMMENT '结束节',
  `XIAOQUM` int(10) DEFAULT NULL COMMENT '校区码',
  `XIAOQU` varchar(400) DEFAULT NULL COMMENT '校区',
  `JXLMC` varchar(400) DEFAULT NULL COMMENT '教学楼名称',
  `JSBH` varchar(400) DEFAULT NULL COMMENT '教室编号',
  `ZGH` varchar(255) DEFAULT NULL COMMENT '职工号',
  `SFJXJD` int(4) DEFAULT NULL COMMENT '是否教学进度',
  `DELETEFLAG` int(4) DEFAULT NULL COMMENT '删除标记',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`SKXX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_plan_zsu
-- ----------------------------
INSERT INTO `t_course_plan_zsu` VALUES ('004E6DF9F24DC618FD189FED8652F93B', '33109157162001', '17', '18', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '004875', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0055AE31CE082789123FE3E07BA4B8D0', 'MAR101162022', '1', '20', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B201', '130142', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('00C8A13E90160B9D31DFA78DB8AAA3BC', 'MA190162009', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C203', '9160186', '0', '0', '2017-07-25 11:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('00E03F30CB17AF0E042B355A80A2CBEF', '18000000162001', '1', '18', '3', '5', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海E302', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0107AAE653A893EC63F208474A2D2C3C', '14000588171001', '1', '9', '1', '4', '5', '6', '4', '东校区', '东校区南学院楼D栋', '南学院楼D304', '060002', '0', '0', '2017-07-23 22:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('01A45CEB0CEA447DFD2670E351D21BD1', 'DCS110162009', '1', '18', '1', '1', '1', '2', '4', '东校区', 'D楼', '东D301', '005427', '0', '0', '2017-07-24 11:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('02043B2B5AFBA12BA5E4417C374A338D', 'MAR102162023', '1', '20', '1', '4', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海C405', '070125', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('023E3BFB07093D38CCDDCD77A077273E', '52000077162002', '12', '12', '1', '4', '1', '4', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('0252CD6FBE0F024C503964E727C341EA', 'MA190162009', '1', '20', '1', '3', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C203', '9160186', '0', '0', '2017-07-25 11:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('02620EA2F720C0C9794B5FF1707616F5', 'PE102162211', '1', '18', '1', '4', '4', '5', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('0300D9FE3D14EB2C059C842691BB4A11', '33000072162001', '8', '8', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0314132532AE6587FD6749F5A5849726', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '050117', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('037BF534E8B22C51E095E41B82D48BF2', '33102616162003', '6', '6', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '004875', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0440CC0244AE1BC3A55D0AD754F65DFC', 'MAR101162008', '1', '20', '1', '2', '9', '11', '4', '东校区', 'B楼', '东B201', '130144', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('044ABF120DDCFD765F1BFCE8BB51ACEB', '12009061162001', '1', '12', '1', '4', '8', '11', '4', '东校区', 'C楼', '东C305', '050162', '0', '0', '2017-07-24 07:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('0536D1F1BC174DDD6A59925FE89A9683', '31000364162003', '1', '16', '1', '6', '1', '2', null, null, null, null, '006634', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('055EC2283E7F7E98740BD528048B9B40', 'LS1006162001', '10', '18', '1', '3', '8', '9', '1', '南校区', '逸夫楼', '艺401', '120023', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('06050A2B17947CA1B6314AC720A425C1', '38112083162001', '1', '18', '1', '4', '1', '2', '4', '东校区', 'B楼', '东B202', '003984', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('069D590F1FE82B40C8DB96FF781B0831', '24200337162001', '1', '18', '1', '1', '4', '5', '1', '南校区', '逸夫楼', '艺504', '110143', '0', '0', '2017-07-25 14:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0729905694CD920D50AAE8A3B75306CB', '12006555162001', '1', '18', '1', '4', '4', '5', '4', '东校区', 'B楼', '东B402', '004058', '0', '0', '2017-07-21 16:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('07CE5F1F581041B073F1255754AC0134', '33000072162001', '4', '5', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('08168512394134B40BDA257DB0F6D91A', '33102616162001', '11', '11', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '006654', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('08B64F3D6C8AAA774BA6041303A7F0AF', '31000358162015', '2', '10', '3', '3', '1', '8', '1', '南校区', '丰盛堂', null, '130011', '0', '0', '2017-07-24 22:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('099A3F516CA7EFC07FE3A42C40188D1E', '16129032162233', '1', '18', '1', '5', '8', '9', null, null, null, null, '109127', '0', '0', '2017-07-24 15:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('09A6E56E19F152DD85C01F6D08EE9B9F', '11209524162002', '2', '13', '1', '2', '13', '15', '4', '东校区', 'B楼', '东B201', '090114', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('0A51E78BC18208A222F06D6748ABDA74', '10152104162001', '1', '18', '1', '1', '2', '4', null, null, null, null, '040028', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0AC89F2543B36664589FA8CD67DAD1E8', '17000168162001', '1', '18', '1', '2', '9', '11', '4', '东校区', 'C楼', '东C303', '120136', '0', '0', '2017-07-24 22:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0AFC85BE62B8C1A2380D443F0B02E104', 'DCS112162009', '1', '18', '1', '1', '7', '8', '4', '东校区', '东校实验中心大楼B栋', '实验中心B201', '005427', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0C26630EA5BE674419A9291241925B8B', '46000069162002', '1', '18', '1', '1', '9', '11', '4', '东校区', 'D楼', '东D304', '040010', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0CBDC337FD5892536E319E759AE34E81', '34122584162004', '2', '18', '3', '3', '8', '10', null, null, null, null, '006779', '0', '0', '2017-07-21 18:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('0CDB381C70B782815CA2B373F5D3E9F7', 'LN203171001', '11', '19', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('0D13D48F4D557FC607F5BECC53419E0D', 'LS1004162005', '1', '6', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院417', '005402', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0D2F2BAF0328F5A1219076E475931EAE', '33101031162001', '1', '18', '1', '3', '8', '10', '1', '南校区', '曾宪梓堂南院', '南院517', '120256', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0D6D069F9B38194FF4E51DF8BA99E5B5', '15020006162001', '1', '18', '1', '1', '1', '2', '1', '南校区', '外国语学院大楼', '外406', '006294', '0', '0', '2017-07-22 12:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0E1075503B64E1C147F7A22E8EB8468B', '33000234162001', '13', '18', '1', '3', '10', '11', null, null, null, null, '120048', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0E84B0E2115022B47BACE90E9A7CC803', 'PHY129162001', '1', '18', '1', '3', '7', '8', '3', '珠海校区', '珠海教学楼', '珠海C505', '110158', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('0EE94FB48770941744073DF5B2DCC51F', '52000087162002', '1', '6', '1', '2', '8', '9', '2', '北校区', '新教学楼', '新教202', '820335', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('0F02580B23ED6A8116127B6487BB3EF3', '16210034162003', '1', '20', '1', '2', '3', '6', '1', '南校区', '逸夫楼', '艺302', '006497', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('0F1F18C6F74084026925FCB967F20196', '46000024162002', '1', '18', '1', '4', '7', '8', '4', '东校区', 'D楼', '东D203', '140254', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('0F3E92AC8A2FC8392428D0295D8F93BC', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '120023', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('0F615BB5A2798A08FDD7A35D8020F706', '52000006162001', '16', '17', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教403', '880035', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('0FE75016D65F4C7464A033BA3C6EAED0', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '050117', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('108289F9429DD9DE57E2D87B76967C6A', '15000512162271', '1', '18', '1', '1', '4', '5', '4', '东校区', 'E楼', '东E203', '004404', '0', '0', '2017-07-25 09:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('11B1229BA1A9172CBDD401A24814D8A7', 'MAR101162019', '1', '20', '1', '2', '3', '5', '4', '东校区', 'B楼', '东B104', '120190', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('121239EF31CC47B2B916D525BD3F4DA5', '52000006162003', '8', '8', '1', '1', '10', '11', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('127905908F929E906E9944687AEAA441', '18000106162002', '1', '18', '1', '5', '4', '5', '1', '南校区', '第三教学楼', '三教410', '006225', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('131A909207A618A560FA2123EC216F76', 'LN201171001', '11', '19', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('137D95D4F37805EE55EA0AABFB144F27', '33000072162002', '1', '1', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('13D557D69F76DF8B515F06631E121E7B', 'LN201171006', '1', '9', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('13F5DED79D3E02922D6785D3052D3786', '33102546162001', '1', '3', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B503', '100161', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('145083E79D2C71E50CA6E7D9051CAE34', 'PHY120162008', '1', '18', '1', '4', '1', '2', '1', '南校区', '逸夫楼', '艺304', '006362', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('149CD10879E36CDFFA575F6AAF45D77A', '41000104162001', '1', '18', '1', '7', '13', '15', null, null, null, null, '005411', '0', '0', '2017-07-24 15:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('14C23BB467C1EBBBBEBEF63B0A3215C2', 'MAR102162027', '1', '20', '1', '4', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C203', '006921', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('14CCFE28A08C0C7C8AF1AB3267CFB58B', 'LN201171003', '11', '19', '1', '5', '5', '6', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('14CE473434989A49A696DAA1B297E39C', '46000015162001', '5', '16', '1', '3', '1', '3', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('154259484A68C51489918111F926290A', 'LN201171006', '11', '19', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('155190F1279630340A09118842A869F0', '52000006162001', '8', '10', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教403', '880132', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('15748CEB2D8DC64E359FFA91E7C75911', '46000056162002', '1', '18', '1', '4', '4', '5', '4', '东校区', 'D楼', '东D402', '140150', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1608F29A7AC20A4D253F2135D2CED929', 'MAR101162005', '1', '20', '1', '2', '3', '5', '4', '东校区', 'B楼', '东B101', '006604', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('16C146FB636F9CEBD27C78DEF7B4F2F6', '31000358162011', '2', '10', '2', '3', '1', '8', '1', '南校区', '丰盛堂', null, '130011', '0', '0', '2017-07-24 22:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('16ED561D5C020C3330B1DA4DEC1B0A33', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004516', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('170D2977E881A02DEC9293F36CA08B99', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '005554', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('175C938CF5E9C2E34CFB4E48E8BDF235', '33102616162003', '14', '14', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '005762', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('18502A17D231CA350CD93A6ED2B11F17', '35117629162001', '1', '18', '1', '5', '10', '12', '4', '东校区', '东校实验中心大楼B栋', '实验中心B401', '006100', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1932722C4558C9E8F3ABE19CA6BCADD4', '50000203162001', '1', '18', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教205', null, '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('196D3062DFA1DD71E84F87C07E0CA3BE', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004965', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('198AA836825850E2B551BD91BE26883C', '52000068162002', '12', '12', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教203', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('19B37A927F2216254E2FE3DFA5162ECC', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '006736', '0', '0', '2017-07-22 06:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('19BEB80218A824BF2BFDB0E94855C78F', 'LS1004162005', '7', '12', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院417', '130213', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1A3BDE2E0359A11E6F7F4A4D20800B00', '52000068162001', '15', '15', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教504', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('1A68D43DDDCB9CBF965F739C787D6409', '33000072162002', '3', '3', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1AB65F06E2EF609760E9080ECC567EAF', 'FL2092162273', '1', '18', '1', '6', '2', '4', '1', '南校区', '文科楼', '文106', '006417', '0', '0', '2017-07-24 21:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('1ABBC383040050F58BCB7C2DC8905BF4', 'LS1006162004', '10', '18', '1', '3', '8', '9', '1', '南校区', '逸夫楼', '艺405', '004516', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1B03D07908815C4CD614261EA4B8128F', '23000223162001', '10', '20', '1', '3', '8', '10', '1', '南校区', '第一教学楼', '1401', '150019', '0', '0', '2017-07-21 16:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1B8E678A23045BE715EBB628D4FEA60C', '33000072162001', '10', '10', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1B9E7613BF9B876C62A19D0AEFA9C297', '38000029162001', '1', '9', '1', '4', '3', '5', '4', '东校区', 'C楼', '东C205', '000110', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1C1B22EBA14E4FAE64EBB9B0E47A0045', '16000068162002', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F303', '006696', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1C23C283824E3569BF5074F37656C10B', '18000000162001', '1', '18', '3', '1', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C510', '129228', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1C27A2D035A5325C6C9673D812B9CC06', '33102616162001', '6', '6', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '004875', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1C6706C418A42F6C6D7F3F5451BF029B', '76120009162001', '13', '18', '1', '1', '4', '5', '4', '东校区', 'A楼', '东A102', '120001', '0', '0', '2017-07-24 15:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1C9B57C0FEB207E1E631C89B656C1226', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '050036', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1CB2800D40EB527B91E1AF59E2AC0CA7', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '006208', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1CEF76CE9E735C7A4B84314C3F928302', 'LS1002162001', '13', '18', '1', '2', '1', '2', '1', '南校区', '逸夫楼', '艺303', '120212', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1D127ECDE487440257C20C519DCBA7A7', '16000068162018', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海F305', '130221', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1D412C5BEAF0CE79170E30A5B4EFEDBD', 'DCS110162010', '1', '18', '1', '1', '4', '5', '4', '东校区', 'D楼', '东D102', '005427', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1D4E1D7FAE0DE842EB25D069FF7B9827', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '004965', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1DA6EDAB3A2B6AA10473A93D36C13931', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '130303', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1E0C6EB5C63861FEFBD9D0A0B5E2E87E', 'MAR102162005', '1', '20', '1', '2', '8', '9', '1', '南校区', '逸夫楼', '艺408', '006266', '0', '0', '2017-07-23 18:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('1E28E2DF470B8781802FBDF6FFE0EDFC', '62000101162001', '1', '18', '1', '2', '7', '8', '4', '东校区', 'D楼', '东D304', '004190', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1E3C6A04229E9A0B3CA74BF098D30060', '02243897162002', '1', '18', '1', '1', '1', '3', '1', '南校区', '逸夫楼', '艺308', '050156', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1E7339041AD8742DF1A7AC1167EBA2AF', 'LS2044162001', '2', '4', '1', '5', '3', '5', '1', '南校区', '逸夫楼', '艺401', '120006', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('1EC613D5D3F20730D27E44FDE62A269F', '46000070162001', '1', '18', '1', '3', '4', '5', '4', '东校区', 'C楼', '东C504', '130248', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('1EFB1BC2C78CE9D814C4033968293456', '33000072162001', '17', '18', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('1F910F50B774C43B468AD43E87739D08', '16000068162019', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海F405', '110127', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2041F060FBBAB6667DAAEA1E1206B594', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '120006', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('209781ADC4BB58F120CD8B69ACCA892C', 'LS2044162002', '1', '1', '1', '2', '3', '5', '1', '南校区', '逸夫楼', '艺504', '150030', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('21295AD39E1F1157E3A2A21BE8A150D9', '31000358162005', '2', '10', '2', '4', '8', '13', '1', '南校区', '丰盛堂', null, '070109', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('21711A0CAF5245E487E88532A13C13F0', '52000006162001', '3', '5', '1', '5', '8', '9', '2', '北校区', '新教学楼', '新教602', '880050', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('224B0F78999605B4B302E0945B6773A1', 'LS1006162004', '1', '9', '1', '3', '8', '9', '1', '南校区', '逸夫楼', '艺405', '050117', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('225D9C5BB9F147FE395BCF525D756C0E', '33102616162001', '14', '14', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '005762', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('236613C0B4094D7394EBE6761DFB08C2', '21000493162006', '1', '18', '1', '1', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海E303', '9160212', '0', '0', '2017-07-24 00:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('23FC109F26A6D964F7669664B8CB5B5C', '16000068162015', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C503', '004036', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('24CB15DFDAA86621903E3428D6D63C60', '33101031162002', '1', '18', '1', '3', '2', '4', '1', '南校区', '曾宪梓堂南院', '南院517', '030108', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('25349078E40B576FF27F009BDF364EA2', 'LS2044162001', '1', '1', '1', '5', '3', '5', '1', '南校区', '逸夫楼', '艺401', '150030', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('25ACFD4DDA423385B3632E237E8492AA', 'CHM102162003', '1', '15', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺406', '006703', '0', '0', '2017-07-23 12:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2626F52135D8FC1B9CB359975111AED1', '33000216162001', '8', '13', '1', '2', '3', '5', '4', '东校区', 'C楼', '东C101', '020187', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('26523793A106D2FD7A6CF6CEFCC0D23F', '52000006162001', '13', '14', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教403', '880035', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('267AF6F21B3DED18BDC581E026008F20', 'MAR101162021', '1', '20', '1', '2', '3', '5', '4', '东校区', 'B楼', '东B201', '130144', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('26DA2F08A8FAD3FC48A4E9100BBA0996', '18000141162001', '1', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教405', '109170', '0', '0', '2017-07-21 16:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('26EA26C01F487F766C6941164CB00AC7', '52000006162001', '13', '14', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教403', '880035', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2712ACC1EBEF25FC5A0B6A9430C14DA1', '15000287162002', '1', '18', '1', '1', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海E305', '001333', '0', '0', '2017-07-22 13:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('278D6717B87C29F6A89544EA4AAC39D6', '33000072162002', '16', '16', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('27DCA9671AD94E121973A6898BF4F8B8', '10000343162001', '1', '12', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C508', '167162', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('283BB1DFF9293391E592F733408B8086', '16000068162004', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C503', '004036', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2862A1C8B37E4E2F54D3DA1C39E35806', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '130303', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('290A224A4867A6728714BDFF78AC9F72', '46000024162001', '1', '18', '1', '4', '4', '5', '4', '东校区', 'D楼', '东D203', '140254', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('297E8AB4F1A197AF334A865E31651751', '33000072162002', '7', '7', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('29DC7CE6A8D90014BD60847E1445EE2A', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '020084', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('2A434CB44CFAF03FB22F41C17D11D53F', '33111014162004', '1', '9', '1', '1', '1', '3', '1', '南校区', '逸夫楼', '艺203', '100158', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2ADABAA46F94D6EFDB78BD49D97F6F04', 'MAR101162014', '1', '20', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B201', '130142', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2B0B28FD816807CB782F1C7655E412B3', '18000094162003', '5', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教412', '006225', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2B9B708A2CB1D1F62A39197D7A1A4BD1', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '004581', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('2C9312882F31BE854FC4009AD2EBC40D', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '120023', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2D1E6D26D8B86075596D06D52C782AF2', '62000072162002', '1', '18', '1', '4', '12', '13', '4', '东校区', '东校实验中心大楼B栋', '实验中心B203', '080066', '0', '0', '2017-07-23 19:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('2D2A37B4CC683CBD46F194548F822107', 'EN126162001', '1', '18', '1', '1', '3', '5', '4', '东校区', 'A楼', '东A502', '040077', '0', '0', '2017-07-24 15:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2D7972CA817F6CFA9EBA9CA2AF2CA372', '20000053162001', '1', '18', '1', '1', '4', '5', '4', '东校区', 'B楼', '东B402', '006100', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2DECDE201157A3F9EB132C62E06A50DD', '16129032162179', '1', '18', '1', '3', '8', '9', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('2E613A4647DD5EEE46079E7424BDA66A', '62000146162001', '21', '21', '1', '4', '2', '5', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2E69D1492FB4DE46F97C75F31B5F4FDA', 'MAR102162004', '1', '20', '1', '3', '3', '4', '1', '南校区', '逸夫楼', '艺302', '005655', '0', '0', '2017-07-23 18:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('2EB77A4BBBBDC9BCC4458E4BEBEC6B67', 'MAR101162011', '1', '20', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B204', '005637', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('2EDC8AD5831179178FB07D8E7763B34C', '62000100162004', '5', '17', '1', '4', '3', '5', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('2F294E72A34C2F08394789D2E38A79D2', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '006208', '0', '0', '2017-07-22 06:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('2F2BB735F0E721E42299EA7000C89CF8', 'LN203171003', '1', '9', '1', '5', '9', '10', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('2F8087019E0C9FC733FE4CDEDBA01728', 'PHY104162001', '1', '18', '1', '2', '1', '2', '1', '南校区', '逸夫楼', '艺406', '110161', '0', '0', '2017-07-23 17:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('30A6EDAD69DB938EC57EE70491FD563A', '40007083162001', '1', '12', '1', '2', '3', '5', '1', '南校区', '第一教学楼', '1506', '120270', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('30B5B26C7447547C1F4887212370AA59', '11206001162001', '11', '20', '1', '5', '2', '3', '1', '南校区', '第一教学楼', '1102', '020151', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('32600D12A877488EAF5EC085E5C189C8', 'LN201171008', '11', '19', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('32BD150B81C387A320A2BDA242D13684', '76120009162001', '1', '12', '1', '1', '4', '5', '4', '东校区', 'A楼', '东A102', '140006', '0', '0', '2017-07-24 15:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('32EAF4B9AA1B0584C38108AF64254023', '16210034162024', '1', '20', '1', '3', '3', '6', '4', '东校区', 'B楼', '东B303', '012135', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('33089E5C44BE5B94C34AF2CCCA53CE36', '50000363162001', '1', '18', '1', '3', '1', '2', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('33B13475B1A20C5F09C4E4E1B6BCE816', '17000198162001', '13', '18', '1', '3', '3', '5', '4', '东校区', 'A楼', '东A207', '120241', '0', '0', '2017-07-21 21:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('3438C16D0E28D6AE507D68C9BC1420E2', '33000234162001', '7', '12', '1', '3', '10', '11', null, null, null, null, '140048', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3464F70D9F2BE5D6C121A582835DADC3', 'LS1006162001', '10', '18', '1', '2', '4', '5', '1', '南校区', '逸夫楼', '艺401', '120023', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('3474F68C2704FC78DFF640BCD48E84E6', '10000210162002', '1', '9', '1', '3', '1', '3', '3', '珠海校区', '珠海教学楼', '珠海D201', '002053', '0', '0', '2017-07-24 19:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('34DA6E5DB3A5167FBEE9E84F8451C56D', 'DCS106162006', '1', '18', '1', '3', '4', '5', '4', '东校区', 'C楼', '东C401', '140267', '0', '0', '2017-07-22 12:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('34EB04E5FC786B82C6A7B82C88EB24CA', '50000363162001', '1', '18', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('3593E6FDE42B1D26C3BCD075FDAC6592', 'MAR101162004', '1', '20', '1', '1', '9', '11', '4', '东校区', 'B楼', '东B201', '140147', '0', '0', '2017-07-24 12:03:44');
INSERT INTO `t_course_plan_zsu` VALUES ('359DC797829FF85434E75721C0904473', 'LS2044162002', '5', '9', '1', '2', '3', '5', '1', '南校区', '逸夫楼', '艺504', '130213', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('361B5CA346AC67C454B3239C78BE662C', '62000054162002', '1', '18', '1', '1', '3', '5', '4', '东校区', 'D楼', '东D205', '070142', '0', '0', '2017-07-24 10:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('37271FCA0447BFA424122329D0DCB640', 'FL1046162002', '1', '18', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教406', '129229', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('37F7F0DB76151F0291A1D7FB74CB6AE5', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '004965', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('38C74CD95C28AFFAD3A206ED6A387678', 'PE102162157', '1', '18', '1', '2', '4', '5', null, null, null, null, '006582', '0', '0', '2017-07-25 10:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('39D53CBF743D0B3D802C1BA5FC80917A', '16000068162025', '1', '20', '1', '3', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C405', '006048', '0', '0', '2017-07-24 12:03:44');
INSERT INTO `t_course_plan_zsu` VALUES ('3A1B390CFB14DF73CFBDDE3585C0D261', '17000120162002', '1', '18', '1', '3', '3', '5', '4', '东校区', 'A楼', '东A103', '150156', '0', '0', '2017-07-24 23:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('3A20EFA5D31B9042120B5E4D26DD6F2C', 'LN201171007', '11', '19', '1', '5', '7', '8', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('3A4AB2E27248072A8FC110221AE7F781', '33109157162001', '12', '14', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '040104', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3B1173683DC4AD55873781CB80C96589', '52000087162002', '11', '13', '1', '5', '10', '11', '2', '北校区', '新教学楼', '新教204', '820335', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('3BD4BE01D245443EB67EF64C3089B4F7', '46000101162003', '1', '18', '1', '2', '10', '11', '4', '东校区', 'C楼', '东C404', '040021', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3D616726863AAEE003D8CBA89B2B2218', '21000930171001', '11', '19', '1', '2', '5', '6', '3', '珠海校区', '旅游学院大楼', '翻译学院同传室', '149091', null, '0', '2017-07-25 12:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('3D751F28E2394FC1A9789252B5888158', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004965', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('3D9AADBB15E30639B714E002B52F7AF2', '38112065162001', '1', '18', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B401', '140054', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('3DF014AEED0A74A2FE8A9A4FF9B07A71', 'MAR101162012', '1', '20', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B104', '005750', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('3DF0DCB3B7BD3FDB70DDABF353DC010A', '14000150162002', '9', '20', '1', '5', '3', '5', '4', '东校区', 'A楼', '东A504', '040026', '0', '0', '2017-07-21 22:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3E59EB9CF9C0E498DEAB790C19E0E60D', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '130213', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('3E5B5974AD49029D65770404263F024A', '11206001162001', '1', '10', '1', '5', '2', '3', '1', '南校区', '第一教学楼', '1102', '005598', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('3EE2322FD2264BD9712F3904E593DFEF', '38000030162001', '1', '9', '1', '4', '8', '9', '4', '东校区', 'C楼', '东C202', '000110', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3EFC0419D5F97AD30A6BE6851E7108D0', '52000006162001', '8', '8', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教403', '880050', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('3F00A7558056BD5C2EDA8DA89DAED285', '33000122162002', '1', '18', '1', '2', '4', '5', '1', '南校区', '逸夫楼', '艺308', '090013', '0', '0', '2017-07-22 18:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('3FE6A8C642956EA50661936B24F161C2', '16000068162021', '1', '20', '1', '2', '9', '11', '3', '珠海校区', '珠海教学楼', '珠海F303', '006696', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('402888F72A160FA29F14B1FC017A7BFF', '33109157162001', '7', '9', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '004875', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4061EED269CF2E1A5E79C4131DA5E00D', 'MAR101162002', '1', '20', '1', '1', '9', '11', '4', '东校区', 'B楼', '东B101', '005730', '0', '0', '2017-07-24 12:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('41078B9CA2799C1473CB2FC0F3357D3F', 'HS206162001', '1', '10', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海F303', '090026', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('4119BE233C4EBD45B305A70EA8AD3D32', '16000068162017', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C507', '012021', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('41BC7D22F6DC79B2E1ADD448D38B61DC', 'MAR102162025', '1', '20', '1', '4', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海C303', '005060', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('41D91E054C72DACBC4F18A4757793EC9', '42000136162001', '1', '18', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C408', '060085', '0', '0', '2017-07-23 10:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('422068E0AA1804413E392216B6E45D17', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '130213', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('4222B73A99A02661829D81FDEEA164D1', '15000512162252', '1', '18', '1', '4', '1', '2', '4', '东校区', 'E楼', '东E404', '004404', '0', '0', '2017-07-25 09:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('422EBEC8F80D56DC5DBD1183124A11B4', 'LS1002162002', '1', '6', '1', '3', '10', '11', '1', '南校区', '逸夫楼', '艺306', '030104', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4271AC097487B22972885617936485F7', '52000006162001', '6', '6', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教403', '880050', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('42936A4ACAF7D96DD0BC177354861A77', '38112083162001', '1', '18', '1', '2', '1', '2', '4', '东校区', 'B楼', '东B202', '003984', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('42B54401C165546AFC06F26AFC1DC452', '33000072162001', '7', '7', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('42C30C4F58086E583208321CE2615142', '18000094162003', '1', '18', '1', '5', '2', '3', '1', '南校区', '第三教学楼', '三教412', '006225', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('42D185E58B0809ABE08B0FE07CBF3E05', '62000146162001', '21', '21', '1', '2', '2', '5', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('42F4364EEEC886C7A69D754182E807D4', '33000086162001', '7', '12', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B203', '060124', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('4424818D81270CF67CEF3B7380551ED2', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '070024', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('44353F6A2A951D3E4DE9BB4191AA0CAF', '18000094162003', '1', '4', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教412', '149183', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('447AC74CDB2B99418DB754C9593186C6', 'FL1006162002', '1', '18', '1', '3', '2', '3', '3', '珠海校区', '珠海教学楼', '珠海E309', '080103', '0', '0', '2017-07-21 22:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('4573C718AB32F7D16D02CC75D289F304', '37000180162001', '1', '18', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C310', '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4588DAEAB56802A21CA6C9964614366D', '12009061162001', '1', '12', '1', '4', '8', '11', '4', '东校区', 'C楼', '东C305', '005801', '0', '0', '2017-07-24 07:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('4601F6FFC9DDDFFCA65EE23C2835DD4A', '33102616162001', '10', '10', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '004331', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('46091938A7CBF2D737A5FE68B7B73E5F', '40000239162002', '1', '18', '1', '4', '13', '15', '3', '珠海校区', '珠海教学楼', null, '150152', '0', '0', '2017-07-22 20:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4672AEA1F22DB433E6BCE7A53F46A9FA', '15000512162272', '1', '18', '1', '1', '1', '2', '4', '东校区', 'E楼', '东E203', '004404', '0', '0', '2017-07-25 09:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('46A33FB77BF97BA366C14EF68DAF0358', '33000072162001', '16', '16', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4766AA3AA9D0919A12491DCF30706885', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '120006', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('47A1A077149B9B124451BCACD89DB4C3', '33101031162005', '1', '18', '1', '4', '2', '4', '1', '南校区', '曾宪梓堂南院', '南院517', '006549', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('47EF7FFFCD2CF737B2FDFBFED65F7669', '33000072162002', '13', '14', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '090104', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('491B795BDB0182A28023E2A917380217', '46000015162004', '5', '16', '1', '5', '1', '3', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '040019', '0', '0', '2017-07-21 16:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('49C73EC1646D6C6AD3FFCE4E12212369', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '020084', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('49E2CA566EED1177F06E3045C7C7B411', '52000006162003', '8', '11', '1', '2', '8', '9', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4A89A041C3598D27E5488518A53A687F', '16210034162020', '1', '20', '1', '2', '7', '10', '4', '东校区', 'B楼', '东B403', '020030', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4A8FFC8723EEBD9E1F07EBCF76F11CE1', 'MAZ106162002', '1', '18', '1', '3', '7', '8', '3', '珠海校区', '珠海教学楼', '珠海C510', '9160184', '0', '0', '2017-07-24 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4AD30350D5F386B156AF907D95CC711A', '18000111162003', '1', '18', '1', '2', '4', '5', '1', '南校区', '第三教学楼', '三教409', '079020', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4BD5F0142291CE907CE2E4A0D9F95CC0', 'LS1004162005', '7', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院417', '030104', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4C2760618EB43614AB8C687259F0B3FF', '38000030162001', '10', '18', '1', '4', '8', '9', '4', '东校区', 'C楼', '东C202', '005812', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4C3379CC592C394A02F2DFA5EADAF7EC', '11209524162001', '2', '13', '1', '4', '13', '15', '3', '珠海校区', '珠海教学楼', '珠海E201', '090114', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('4C59F3FBBCE62288C61FF5F0501FD9E3', 'PHZ104162001', '1', '18', '1', '1', '2', '3', '3', '珠海校区', '珠海教学楼', '珠海C210', '150057', '0', '0', '2017-07-24 13:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4C98DAD2D56D23A23CF1A4D69EFB1213', 'LN203171003', '11', '19', '1', '5', '9', '10', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4CD7E61B0ADCE2D451B2E18243E9F1E6', '16129032162011', '1', '18', '1', '5', '8', '9', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('4CE3309DD3BC1A3ADD1CA7A7B4F7D99A', 'LS1006162001', '1', '9', '1', '3', '8', '9', '1', '南校区', '逸夫楼', '艺401', '006613', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('4D0411A63935FC1C7006C7F3801F150A', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '020125', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4D2ED0836F48AA201D3E4F7F960F0492', '33102546162001', '7', '9', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B503', '005819', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('4DC2FD836B08D6F6A2ACC29660988F8B', '35118083162002', '1', '18', '1', '2', '4', '5', '4', '东校区', 'C楼', '东C203', '110170', '0', '0', '2017-07-21 18:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('4E6DECE6062B8A90AA182A30CBB07778', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '050036', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4F0FB4D2E8259DABAAB8C2D659DD5825', 'PHY104162001', '1', '18', '1', '5', '4', '5', '1', '南校区', '逸夫楼', '艺406', '110161', '0', '0', '2017-07-23 17:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('4F2F46D4F01964B4EB58B731428AE5C3', '40000039162002', '6', '16', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C303', '030133', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4FB0410CDA092BFAAD062D9F122092B9', '11300237162001', '1', '18', '1', '3', '8', '10', '1', '南校区', '文科楼', '文109', '110089', '0', '0', '2017-07-25 08:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('4FB06D73C6EA90ACA14E347B9EA98D3B', '33000072162002', '4', '5', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('4FE9A0F9888E52BC0F3D50622C9DF3DB', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '160004', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('501DE221CF85CCA9CB3C6F1A4CC9309E', '15000291162001', '1', '18', '1', '3', '2', '3', '3', '珠海校区', '珠海教学楼', '珠海E307', '006725', '0', '0', '2017-07-25 11:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('507BA2A855AA437A430232DA062CF74C', '16210034162011', '1', '20', '1', '1', '7', '10', '4', '东校区', 'B楼', '东B204', '006255', '0', '0', '2017-07-24 10:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('514B8E3C997AC8182290295A7E10EC1B', 'PHI126162001', '1', '18', '1', '1', '3', '5', '1', '南校区', '文科楼', '文112', '110089', '0', '0', '2017-07-25 08:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5155C7E43269014A29A38CF76A15EB5A', '35129741162001', '1', '18', '1', '2', '3', '5', '4', '东校区', 'D楼', '东D205', '040117', '0', '0', '2017-07-24 18:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('51C59DDEDA232FF072242238A053612B', '15020006162001', '1', '18', '1', '5', '3', '4', '1', '南校区', '外国语学院大楼', '外406', '006294', '0', '0', '2017-07-22 12:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('51CEAC2EC990FD1391F70E6B4CBE0D2D', '11206105162001', '11', '20', '1', '4', '3', '5', '1', '南校区', '逸夫楼', '艺306', '130163', '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('51E6CA71679BD42B7304FB0F17B55BF6', '16000068162009', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F405', '110127', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('51E800C5FA0FE6356F8AAEADF89F4148', '52000006162003', '6', '6', '1', '2', '10', '11', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5218A1180E5A9EFFB7934121ED2B2FD7', '52000006162003', '3', '5', '1', '4', '10', '11', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('524AC607813AF290E397C12B89B33606', '39000239162001', '1', '18', '1', '3', '4', '5', '4', '东校区', 'B楼', '东B203', '070071', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('52A4A8284EB70487195688FCA06D28E2', '18000094162003', '5', '18', '1', '1', '8', '9', '1', '南校区', '第三教学楼', '三教412', '006225', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('52E1CA03AB7E945254DA32BE31F323DE', 'IM106162001', '1', '18', '1', '5', '3', '5', '4', '东校区', 'C楼', '东C303', '130334', '0', '0', '2017-07-23 09:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('530A182FB5C0CA05DC623310ED92BA59', 'LN102162003', '1', '12', '1', '5', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F303', '006150', '0', '0', '2017-07-22 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('53858ACD5D3E595FC08284751E8E3ED6', '33109157162001', '10', '10', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '040104', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5403A18E545EDA1D024F022DA7AE1901', '19000374162048', '1', '18', '1', '1', '10', '11', '1', '南校区', '逸夫楼', '艺305', '006417', '0', '0', '2017-07-24 21:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('54149B3B34E19F5994ED760E9BBAD181', '52000006162003', '3', '5', '1', '5', '10', '11', '2', '北校区', '新教学楼', '新教102', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('54A8A44447FBFDDC4840161EB9794F24', '39000239162001', '1', '18', '1', '1', '10', '11', '4', '东校区', 'B楼', '东B203', '070071', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('54CDD016BB23B12F5544BCD94DD64AE3', '62000146162001', '21', '21', '1', '1', '8', '11', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('54DB6CA0DA764F8F088862F794DCE3AD', '16129032162202', '1', '18', '1', '3', '10', '11', null, null, null, null, '109127', '0', '0', '2017-07-24 15:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('561CC9EF5201C2FC85C0DA1CA1F4665B', '16210034162009', '1', '20', '1', '1', '3', '6', '4', '东校区', 'B楼', '东B204', '006255', '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('562C8662DBCBEF6462C892A66975596B', '02243890162001', '7', '12', '1', '5', '9', '11', '4', '东校区', 'C楼', '东C301', '130301', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5651FB306994557860D74895425648FE', 'MAR101162018', '1', '20', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B201', '140147', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('56ED580E9DD246E9FB3C9D91C144F1D7', 'MAR102162019', '1', '20', '1', '3', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海C203', '070124', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5775727E99785A9DAD9F76499A89F758', '33000234162001', '1', '6', '1', '3', '10', '11', '4', '东校区', 'A楼', null, '100021', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('584E8738E82957DF1CBE6F21B5701460', '02240052162001', '3', '14', '1', '5', '8', '10', '1', '南校区', '逸夫楼', '艺207', '005762', '0', '0', '2017-07-24 17:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('587AA28D6918144C95D7C40B5F3C87B3', '38000029162001', '10', '18', '1', '4', '3', '5', '4', '东校区', 'C楼', '东C205', '005812', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('594A309AD5909EE8B4B00A5321E38060', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '050117', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5964941D7315642CE671ABAB355703E3', 'LN102162001', '1', '12', '1', '4', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C403', '006150', '0', '0', '2017-07-22 17:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('59748D332F53D7912D22A12D0F7999D1', '17000127162001', '10', '18', '1', '1', '3', '5', '4', '东校区', 'A楼', '东A306', '130147', '0', '0', '2017-07-25 09:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('59DF20ACAA9D2587683D3B234544EA6B', '35110011162001', '1', '18', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B102', '004791', '0', '0', '2017-07-24 05:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('59FC257FDCDAB6D0C0A11DA4DF6DCC52', 'MAR102162016', '1', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C207', '006426', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5A9DE4B7483D4C672BD6A0D0B83D9F22', '17000198162001', '13', '18', '1', '6', '3', '5', '4', '东校区', 'A楼', '东A207', '120241', '0', '0', '2017-07-21 21:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5AA77533BD140FDD34DBFB1BA90776A2', '33109157162001', '11', '12', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '004875', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5B0C36D6D1A4BB0B26B6D11B70C1EE54', '16110025162001', '1', '20', '1', '1', '3', '5', '4', '东校区', 'C楼', '东C202', '110125', '0', '0', '2017-07-23 10:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5B26A43206869F49946F6515E808B49A', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '160058', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5B35CCBE4341DD5176BBE873BB99271B', '20000053162001', '1', '18', '1', '5', '8', '9', '4', '东校区', 'A楼', '东A505', '006100', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5B47FC5DAAB2C722BC12DD4B9C87145F', '33102616162001', '4', '4', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '140030', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5B7962C3E316153885D91680792FBF46', '52000006162003', '16', '16', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5BF168CAA38524FA0CE30F543DC2BB54', '33000086162001', '1', '6', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B203', '060183', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('5C35E205402D60D5BF1A48D51FC44E82', '52000077162002', '2', '2', '1', '4', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5CE521B03410A12DDD52AC8DB45D0F17', 'MAR102162002', '1', '20', '1', '3', '1', '2', '1', '南校区', '逸夫楼', '艺401', '005150', '0', '0', '2017-07-23 17:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5D124B8D609A14271ED49FA7BB6A33D5', 'EGE102162001', '1', '15', '1', '1', '1', '3', '3', '珠海校区', '珠海教学楼', '珠海C203', '005853', '0', '0', '2017-07-22 16:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('5D99C05C3A7B09DD4EAAE918B545D11F', 'DCS106162006', '1', '18', '1', '1', '3', '5', '4', '东校区', 'C楼', '东C401', '140267', '0', '0', '2017-07-22 12:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('5DC96189B280C32002173229F4A349AF', '33102616162003', '6', '6', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '140002', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5E4EC70AA81C15739B6DBFDD5A0186EF', 'MAR102162018', '1', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C303', '070125', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('5F51A516ACF385F45539F819E5DA9F0D', '33102566162001', '7', '12', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B503', '006443', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('5F9BC96CEFCF277111A05FD55671EF5B', '18000096162003', '1', '18', '1', '2', '2', '3', '1', '南校区', '第三教学楼', '三教412', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6004113C8E8D1648992A151C470A1FF8', '37009525162002', '5', '7', '1', '5', '8', '11', '3', '珠海校区', '珠海教学楼', '珠海C302', '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('603E4425DBFC9A9CC97E56918FE9C5E0', '18000189162001', '1', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教404', '079020', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('60814C3F2B35BF820069DF7561C2CA33', '24200180162001', '1', '13', '1', '1', '8', '10', '1', '南校区', '文科楼', '文101', '120246', '0', '0', '2017-07-24 05:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('6174BF995E4A4AD64768101E62CB2398', '19000374162051', '1', '18', '1', '1', '1', '2', '1', '南校区', '逸夫楼', '艺206', '079031', '0', '0', '2017-07-24 21:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('61A445642B51921FE4D3B5C8EC23DC64', '33101031162001', '1', '18', '1', '3', '8', '10', '1', '南校区', '曾宪梓堂南院', '南院517', '120210', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('61C4CC4FC67062C8854ABC0676103941', '16000068162012', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C403', '130153', '0', '0', '2017-07-24 11:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('61FAC0D1F061EA690C31947FE6CEA99D', '33102616162001', '13', '13', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '005302', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('629176FABFD4FF615D876DBDF9577C21', '45000175162001', '20', '20', '1', '1', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海A309', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('62BD8437295A46131FBE67DC259929AD', '52000077162003', '2', '2', '1', '4', '3', '4', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('62C0542BAA1B418D82108AADC53B92D5', '52000077162002', '8', '8', '1', '4', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('630E3C7B46B3BE2A588D99FEE1352F29', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '005554', '0', '0', '2017-07-22 06:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('63689B43AFAEE293F724AE96262ACB0B', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '090055', '0', '0', '2017-07-22 06:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('636A68FABE618DC7D1DDB7F5F6C918FA', '33101108162001', '2', '18', '1', '1', '8', '11', '4', '东校区', '东校实验中心大楼F栋', null, '140014', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('6469DC72A99805C79B04F0BBE797BF43', '33109157162001', '15', '16', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '140002', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('647C9AC9D083A1F795D6D3DD8BABC341', '33000072162001', '3', '3', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('65207B443569C4B77022112836003381', '33101108162001', '2', '18', '1', '1', '8', '11', '4', '东校区', '东校实验中心大楼F栋', null, '030102', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('6527EF9F7CB806A42B3B5223DE75E82C', '33000057162001', '9', '17', '1', '2', '8', '11', '4', '东校区', '东校实验中心大楼F栋', '实验中心F301', '020187', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('652AC398DC02FC9D6E8048F6DBFF1BFF', '33102566162001', '1', '2', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B503', '006443', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('6544B33B24970220433DB7F744C8E0BC', '46000091162001', '1', '18', '1', '4', '13', '14', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '150036', '0', '0', '2017-07-23 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('654D645F7B6720A9629B5D2F0789AEE7', '38000047162001', '1', '18', '1', '5', '2', '5', '4', '东校区', '东校实验中心大楼A栋', '实验中心A401', '150180', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('65D62E34366CE15B98D876CE257EE118', '33102566162001', '13', '18', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B503', '020086', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('661AB94637E296AA9DE08161F80F0BF6', '16000068162016', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C505', '080109', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('664B1A04379E397153F73BE95D5B286B', '62000100162005', '5', '17', '1', '1', '3', '5', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('66DD17EF0384233DC92CB5B5744DFA9F', '15000512162251', '1', '18', '1', '4', '4', '5', '4', '东校区', 'E楼', '东E404', '004404', '0', '0', '2017-07-25 09:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('673B593932AE06A3625FA2289679931D', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '006208', '0', '0', '2017-07-22 06:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('676FB4C4F7D278C66351F3FBA3DDADA9', 'LS1006162001', '1', '9', '1', '2', '4', '5', '1', '南校区', '逸夫楼', '艺401', '006613', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('67E2F5045A51D943FB5A6F2B765CE687', '33102616162001', '5', '5', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '140048', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('682BF57D1AEC42DA1D89B909D07B7043', '21000493162001', '1', '18', '1', '1', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海E405', '9160211', '0', '0', '2017-07-23 08:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('69B0D111FF430E59FDFBE2774425318E', 'FL1046162002', '1', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教406', '129229', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('69DB0F21A819C37159F3E18D4EE7B522', '37000380162002', '1', '18', '1', '1', '3', '5', '3', '珠海校区', '珠海教学楼', null, '140022', '0', '0', '2017-07-23 23:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6A107ACF23A08347EE7F915A22054CDF', 'FL1006162003', '1', '18', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海E309', '080103', '0', '0', '2017-07-21 22:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6AF9B6A97987D1CA473083E17F7D200E', '18000163162003', '1', '18', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教409', '006643', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6AFCEF1E6A8026641FA405CD19996CF9', 'MAR101162016', '1', '20', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B104', '005750', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6B02AF1F09551CE40F30CFF7F647FE92', '10112124162003', '10', '18', '1', '5', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C405', '9160175', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6B0B3605FA0EA7286D382FF538E6E9B4', '11206132162001', '1', '20', '1', '3', '8', '9', '1', '南校区', '逸夫楼', '艺307', '090114', '0', '0', '2017-07-21 16:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6B64B358AF4E8D4687E22A1948D33E5B', '16210034162022', '1', '20', '1', '2', '7', '10', '4', '东校区', 'E楼', '东E101', '050159', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6B7936AB1E9E016B3D79CAFFA5481320', '18000229162001', '1', '4', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教404', '149245', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6BA74C2683B218B71E07D5836A660BCC', '15000387162001', '1', '18', '1', '4', '1', '2', '1', '南校区', '外国语学院大楼', '外409', '006725', '0', '0', '2017-07-22 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6BB654C3F53D421A066E6148D81EC352', 'LS1002162002', '1', '6', '1', '3', '10', '11', '1', '南校区', '逸夫楼', '艺306', '005402', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6C4DC2DD0A23CAAFC6201C71E9DB0390', 'CD102162002', '1', '18', '1', '4', '2', '5', '4', '东校区', '东校实验中心大楼B栋', '实验中心B202', '080118', '0', '0', '2017-07-24 23:33:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6C9EFD3C63377D337263C85A7138F09F', '33000072162001', '6', '6', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6CB5C636DFB5755FC92970B1833CF246', '33111014162003', '1', '9', '1', '3', '8', '10', '1', '南校区', '逸夫楼', '艺203', '100158', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6CFEC3E07FC158C89A44A22C2DD8A408', '16000068162008', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F305', '130221', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6D3700C81245E02325B848F5C0412DE7', '33102616162003', '12', '12', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '050156', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('6D3E8E50D7F3928D0050EEF61C851B23', '52000077162002', '3', '5', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6D70F56459093B4C88C42C89A0BCC960', '46000101162001', '1', '18', '1', '2', '4', '5', '4', '东校区', 'C楼', '东C404', '040021', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('6F58D2C8B5CA79DC213EE43CE9300BD2', '16000068162013', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C405', '120191', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('6F7B27E3C135C27D2C3669133B37C2CA', 'PE102162188', '1', '18', '1', '4', '10', '11', null, null, null, null, '109127', '0', '0', '2017-07-24 16:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('6F82F4EA61226B258B7FDC3333D44882', '33102616162001', '8', '8', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '070015', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7012784443BDD1CDDF8821AE95174208', '17000262162001', '10', '18', '1', '1', '9', '11', '4', '东校区', 'A楼', '东A404', '130147', '0', '0', '2017-07-25 09:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('709E5D030D9C2576E25672F86BB1CC26', 'MAR101162013', '1', '20', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B101', '120318', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('70C9FB9856073F9C58CB8EB8153DE428', '16000068162024', '1', '20', '1', '3', '9', '11', '3', '珠海校区', '珠海教学楼', '珠海C407', '006321', '0', '0', '2017-07-24 12:03:44');
INSERT INTO `t_course_plan_zsu` VALUES ('712DDE367BB9EC1E3ABB0C6B89D82292', '52000006162001', '8', '11', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教403', '880132', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('713CCFE636BCEA43CA484E8EE46DFB32', '34109066162001', '1', '20', '1', '1', '3', '5', '1', '南校区', '逸夫楼', '艺305', '005976', '0', '0', '2017-07-24 09:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('71D2D70D145F4E4AC8A7F6D412326470', '52000077162003', '8', '8', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教102', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('71E20EE4CE8632DECD618F110B9C9C7B', '18000100162001', '1', '18', '1', '1', '8', '9', '1', '南校区', '第三教学楼', '三教408', '006643', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('71EB8477FBBCFA2A6C972943475C67D2', 'MAR101162010', '1', '20', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B101', '120318', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('7225EFF07D957CE165D81F95F8CF590D', '02243897162001', '1', '18', '1', '2', '1', '3', '1', '南校区', '逸夫楼', '艺308', '050156', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('7250EC259FB49A3ACF8C0E51A6E64A3A', '33000072162002', '2', '2', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('72888894CE102B591D92CF109AF0C747', '62000091162004', '1', '18', '1', '4', '9', '11', '4', '东校区', 'D楼', '东D202', '090002', '0', '0', '2017-07-24 10:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('72B4AC345ECFF5EBB08FBAF9D3230BB1', '16000068162027', '1', '20', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C305', '006048', '0', '0', '2017-07-24 12:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('73AF50B321428F1E06CECAD60104BE02', 'MAR102162028', '1', '20', '1', '4', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C303', '005060', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('73E50FED1AA9E67EF186478857FD3A59', 'LN203171002', '11', '19', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('748208C39B68891E056C1EABA10EF32A', '52000068162001', '15', '15', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教504', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('74BA14C7CD7E765701995C06C098F969', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '004516', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7656429941641D2591302C4C8CF03261', '45000175162001', '19', '19', '1', '2', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海A309', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7758C05FD808CD104544709C54348406', 'LS1002162001', '1', '12', '1', '1', '8', '9', '1', '南校区', '逸夫楼', '艺303', '005797', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('777EFE758EF6E698ACD5F37640C6DB70', '38000089171001', '1', '20', '1', '5', '5', '6', '4', '东校区', '东校区北学院楼', null, '005677', null, '0', '2017-07-23 23:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('779BD7F7CA8DC25DC36B9D872EB25AD4', 'CET102162001', '1', '18', '1', '5', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C305', '160017', '0', '0', '2017-07-22 07:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('77E4BD90EEE820C0E93A0A40233194C4', '37000334162001', '1', '18', null, '5', '8', '11', '1', '南校区', '第一教学楼', '1202', '070014', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('7865F0C21647149F56DEEEFC351B0A1D', 'MAR102162015', '1', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C403', '070124', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('7878D516DB19FD6BCC604A1C7929BD3E', '35129748162001', '1', '18', '1', '2', '10', '11', '4', '东校区', 'E楼', '东E303', '005123', '0', '0', '2017-07-22 12:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('78C6EBA9501C6D8C76B1392EBE9A8309', '21000493162002', '1', '18', '1', '1', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海E405', '9160211', '0', '0', '2017-07-23 08:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('78CCEF78B0E7CE80BCB1DA30E9DEDB14', '33000072162002', '8', '8', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('78CF42361B64F2AE1A4077F0AD7B25B5', '16129032162032', '1', '18', '1', '3', '4', '5', null, null, null, null, '014116', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('7A850EE8713E8B66ED12D6244BFF8E2D', '81000053162001', '7', '10', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教504', '820351', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('7AEBFC526EB452D86B38DD57E2742CC6', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '160058', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('7B0A278253B578978E6584070148DA10', 'LN201171004', '11', '19', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7B230EF120457B7BD542BF7DF1A1A881', '35000062162001', '1', '18', '1', '4', '3', '5', '4', '东校区', 'D楼', '东D401', '130018', '0', '0', '2017-07-21 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('7B5C3881AA8BC3AB2EF317F14C406914', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '070024', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('7B695AB74F33CF76DAED4655D12FD61F', '16210034162023', '1', '20', '1', '3', '3', '6', '4', '东校区', 'B楼', '东B403', '006057', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('7C6082414475C563E41AB50FF6C6B34F', 'LS1006162004', '10', '18', '1', '2', '4', '5', '1', '南校区', '逸夫楼', '艺405', '004516', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7C62910B65798C86CE90FDE3E2398EAE', '24200180162001', '14', '18', '1', '1', '8', '10', '1', '南校区', '文科楼', '文101', '157213', '0', '0', '2017-07-24 05:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('7CE752127730E15B0FEFB76CAA8E8ECF', '52000077162002', '8', '8', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7CE91C0FC9A3998042AADE32E182CA92', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '004581', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7DBC33FE1EE09FA9962AF106E6AEF5A8', '21000930171001', '1', '9', '1', '2', '5', '6', '3', '珠海校区', '旅游学院大楼', '翻译学院同传室', '149091', null, '0', '2017-07-25 12:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7E32A6AC45205E9B068D1613ABA85C23', '37009525162001', '8', '11', '1', '5', '2', '5', '3', '珠海校区', '珠海教学楼', '珠海A205', '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('7E59E72FEEBFBD2E55ED9D6A9704C442', '33111014162004', '10', '18', '1', '1', '1', '3', '1', '南校区', '逸夫楼', '艺203', '080007', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('7F84752B336FD0C28C914013BB04956A', '16210034162025', '1', '20', '1', '3', '7', '10', '4', '东校区', 'B楼', '东B403', '006057', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('7FAA4FFF2BEFB24E2CBAC2DF2430789E', '10000220162001', '1', '18', '1', '1', '8', '9', '1', '南校区', '林护堂', '林103实验', '090016', '0', '0', '2017-07-25 10:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('7FDBEB701357EE1123A8AE3CEE56C954', '18000100162003', '1', '18', '1', '2', '4', '5', '1', '南校区', '第三教学楼', '三教412', '130228', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('80699798963D507D85322ADB1CFCCAA7', '21000493162004', '1', '18', '1', '5', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海E203', '159432', '0', '0', '2017-07-23 11:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8124926D3F7559C871311F52D2B23D49', '40007234162002', '1', '18', '1', '4', '13', '15', '3', '珠海校区', '珠海教学楼', '珠海D207', '150152', '0', '0', '2017-07-21 22:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('81BF8EA16668A3EFC7B27D091AC3A605', '16129032162188', '1', '18', '1', '3', '8', '9', null, null, null, null, '109127', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('81DEABA5535B52BF211900F22A7A2EB1', '18000094162003', '1', '4', '1', '5', '2', '3', '1', '南校区', '第三教学楼', '三教412', '149183', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('8202F773627111697C08F1C33EFA61B9', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004581', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8225CCBBCD4909D19D1BD4AF46D6D2F2', '16000068162023', '1', '20', '1', '3', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C407', '006321', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8284B4A7E42C5468217C361E43BC53D9', 'LS1002162002', '7', '18', '1', '2', '8', '9', '1', '南校区', '逸夫楼', '艺307', '030104', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('82A805ECB45871FE8AA07F85E816A6C4', '33101031162002', '1', '18', '1', '3', '2', '4', '1', '南校区', '曾宪梓堂南院', '南院517', '006009', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('82CBA7F63B5831126A938C8F8E77CACB', '52000006162001', '3', '5', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教602', '880050', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('837C76DC079FE06DD5EDEC3BAC96A25F', '31000276162001', '1', '18', '1', '5', '4', '5', '1', '南校区', '第一教学楼', '1306', '070005', '0', '0', '2017-07-24 22:23:39');
INSERT INTO `t_course_plan_zsu` VALUES ('841CB50275F23903225CE1EA6520C138', '46000055162002', '1', '18', '1', '5', '4', '5', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '140254', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('842DF304132C37F9A813CBAA138D3A86', '10112124162003', '1', '9', '1', '5', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C405', '110128', '0', '0', '2017-07-22 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('84DDD8FED6F469F13D755A14570DE882', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004516', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('84F5BD5E0F45F5EFCB5E6EFE7E2E954B', '52000006162003', '6', '6', '1', '1', '10', '11', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8541DFEE335506704598EDB1F850FF6A', '35109204162001', '1', '18', '1', '4', '10', '11', '4', '东校区', 'D楼', '东D401', '050090', '0', '0', '2017-07-24 16:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8560C80F243CA380301D8489555A40C7', '52000068162002', '1', '10', '1', '4', '3', '4', '2', '北校区', '新教学楼', '新教203', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('85BAF155C7E82E0D561ACD56611A2277', 'LN201171002', '11', '19', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8633847EF1A5058E587B8DBD63D70B7F', 'MAR102162006', '1', '20', '1', '2', '10', '11', '1', '南校区', '逸夫楼', '艺408', '006266', '0', '0', '2017-07-23 18:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('866146045D66BB0ACA7A56C8919C7A64', '16210034162001', '1', '20', '1', '2', '3', '6', '1', '南校区', '逸夫楼', '艺201', '040090', '0', '0', '2017-07-24 09:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('86A1514541633FFEEA869DD98DA6CBFB', '18000163162002', '1', '18', '1', '2', '4', '5', '1', '南校区', '第三教学楼', '三教407', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('86FFB0614AFF6D002178D7893041A9F2', 'MAZ106162002', '1', '18', '1', '3', '9', '10', '3', '珠海校区', '珠海教学楼', '珠海A310', '9160184', '0', '0', '2017-07-24 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('87DB7942098C846FE90174021E38F8A4', '45000175162001', '19', '19', '1', '4', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海A309', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('87FE3A592395910C6E9DC4557F67A3FD', 'LN201171007', '1', '9', '1', '5', '7', '8', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('884ADDF46C527D16D8D2A4BE4B4DB20C', '18000141162001', '1', '18', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教405', '109170', '0', '0', '2017-07-21 16:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('888061755332103250F109B28227AAB4', '10152247162001', '1', '18', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B203', '005411', '0', '0', '2017-07-24 13:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('88A05B9F94635CC80F75C96802D8565A', '12009061162001', '1', '12', '1', '4', '8', '11', '4', '东校区', 'C楼', '东C305', '001355', '0', '0', '2017-07-24 07:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('88A573E51CCDFC54B5647FAF151BD800', 'LS1002162001', '1', '12', '1', '2', '1', '2', '1', '南校区', '逸夫楼', '艺303', '005797', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8969438CCCA5CB67F0AD0EE60DACE434', '18000163162003', '1', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教409', '006643', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('89F817D3EF79652C801CA77D63C16EF8', 'LN203171004', '11', '19', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8A0DAE8BED48C6E8C173C1C3AB7873BC', '37009525162002', '8', '11', '1', '5', '8', '11', '3', '珠海校区', '珠海教学楼', '珠海A205', '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8A49ECB445D39C729E0F18A4BA3F3DC3', '17000262162001', '10', '18', '1', '5', '9', '11', '4', '东校区', 'A楼', '东A404', '130147', '0', '0', '2017-07-25 09:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('8AC4C5B0C79DB7F9B23D58D0279D7F7D', '46000069162003', '1', '18', '1', '5', '9', '11', '4', '东校区', 'C楼', '东C206', '040010', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8AD1097CCDBB132D157B8A6D3AC706D0', 'LN201171005', '11', '19', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8AE61577FEE537FA1C697CB941D879DE', 'LN203171001', '1', '9', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8B7E46355A8244F26EFAB3ED368C8445', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '020125', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('8BD27A3D99E8010CEB00129FC65FB2F1', '18000106162002', '1', '2', '1', '5', '4', '5', '1', '南校区', '第三教学楼', '三教410', '156135', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8C05AC4167CC1E21599D5AA302D579E4', '52000006162003', '12', '12', '1', '4', '10', '11', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8CAF6A486DF20CBAE505CF7E30C0B09C', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '090055', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8CC0FF5C40BEFE9D6A8328F5868B820E', '81000053162001', '1', '6', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教504', '820351', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('8CC59E1EE801B1441EFCDB17A6130262', '52000006162003', '8', '10', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8DD5BAEED2B251E823B9E80FD0DDB058', '18000163162002', '1', '18', '1', '4', '8', '9', '1', '南校区', '第三教学楼', '三教407', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8DD8B7426C86F720A74A4B8DE5A9159E', '52000006162001', '12', '12', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教602', '880132', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('8EFDC96D342034CEED1123D1FB5E30B0', '33101108162001', '2', '18', '1', '1', '8', '11', '4', '东校区', '东校实验中心大楼F栋', null, '060183', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('8FAC7062E2E03CDAD1F1DF360A5EF461', '16000068162001', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C403', '130153', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('8FB87CB251389B414BB03A082927D85A', '23001038162001', '1', '20', '1', '5', '3', '5', '1', '南校区', '第一教学楼', '1205', '006894', '0', '0', '2017-07-22 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('8FC02D2B5982439DBDB2026C37C6F04F', '16129032162004', '1', '18', '1', '5', '4', '5', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('8FFB2FCA0107BFD20878E31267AC59FB', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '120023', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('91006BAE9B31F106103E42FC108EE372', '52000006162003', '13', '14', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('913D8E2038327643B58FA617BAACAA53', '62000073162001', '1', '18', '1', '4', '4', '5', '4', '东校区', '东校实验中心大楼B栋', '实验中心B203', '080066', '0', '0', '2017-07-23 19:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('91CED4B2B6609FDB99A2FAC155EB86F7', '15020006162001', '1', '18', '1', '3', '3', '4', '1', '南校区', '外国语学院大楼', '外406', '006294', '0', '0', '2017-07-22 12:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('9240770A403A81981EFE61D6FEDE691D', '34109066162002', '1', '20', '1', '1', '3', '5', '1', '南校区', '逸夫楼', '艺207', '006444', '0', '0', '2017-07-24 09:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('92B24DE55731E4A1AECAAFED38801D83', '40000239162001', '1', '18', '1', '5', '3', '5', '3', '珠海校区', '珠海教学楼', null, '150152', '0', '0', '2017-07-22 20:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('92D5AC64721F521CB079B9AE115A2A7C', '33102616162001', '6', '6', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '140002', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('92DFB72D7F6530E7A2F9344E75B7C24B', '14000633162001', '2', '10', '1', '7', '2', '5', null, null, null, null, '004774', '0', '0', '2017-07-21 23:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('9396725527B902225B15C69155D93F35', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '006736', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('93AF67177CA6C150277F03C2D49CE6A3', '19000374162049', '1', '18', '1', '1', '8', '9', '1', '南校区', '逸夫楼', '艺305', '006417', '0', '0', '2017-07-24 21:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('93CA4411E044A63C04760545BB34FC23', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '160058', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('93F2C64B9FD87F44BCBED2909FAD2E63', '33102546162001', '4', '6', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B503', '070143', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('94300ACF96B2A8D45D5CAC16B451DCDC', '33000072162002', '11', '12', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('943EDDFE7EDCC8ED9AD37B193A4D3D8E', 'MAR102162026', '1', '20', '1', '4', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海C203', '006921', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('94B61C9398C9DEC5D35F1FCF6EFDB314', '33102616162003', '11', '11', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '006654', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('95BEFE15D792B9B53949B13F249810D0', 'PHY120162008', '1', '18', '1', '3', '10', '11', '1', '南校区', '逸夫楼', '艺303', '006362', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('95D41BDF9F7AB7AA28CD45CA66664FE1', '76120009162001', '1', '12', '1', '3', '4', '5', '4', '东校区', 'A楼', '东A102', '140006', '0', '0', '2017-07-24 15:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('95D54AF64B8763A8F44F5B1700855512', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '100147', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('9634EEDD02AD4CF0595B7FCA27100E82', '46000138162001', '1', '18', '1', '4', '2', '5', '4', '东校区', '东校实验中心大楼B栋', '实验中心B403', '150036', '0', '0', '2017-07-23 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('963FE7F53DB60AA1720AF7269BDE935D', 'LS1004162005', '13', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院417', '020179', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('96788334F311EA8D9694DC292A704A56', '14000611162001', '1', '18', '1', '1', '13', '15', null, null, null, null, '040026', '0', '0', '2017-07-21 22:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('96C261A2E94C292F53F5A511335FBD50', 'MA192162013', '1', '20', '1', '3', '3', '4', '1', '南校区', '逸夫楼', '艺201', '130238', '0', '0', '2017-07-25 14:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('96C88DA7F4E7DA1F7FD61A152103037C', 'LN201171003', '1', '9', '1', '5', '5', '6', '1', '南校区', '黄传经堂', 'L303', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('96FACF3770A36CD1EB0C772175488CA1', '33102546162001', '10', '12', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B503', '070143', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('971942278A882197F62B536D134075B9', '38000090171001', '1', '20', '1', '5', '5', '6', null, null, null, null, '005677', null, '0', '2017-07-23 23:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('97525DA00665F7DD7A8F7E3B60F9A0CC', 'MAR102162014', '1', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C203', '006921', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('97C4FA4D63F79428BBD63AF68079F0A2', '62000146162001', '21', '21', '1', '1', '2', '5', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('97DF0D525EB62804C76BCCB9D47C212E', 'PHY129162001', '1', '18', '1', '1', '9', '11', '3', '珠海校区', '珠海教学楼', '珠海C505', '110158', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('97FF34CD0562AD2D1EB46484504AAA85', '33000057162001', '9', '17', '1', '2', '8', '11', '4', '东校区', '东校实验中心大楼F栋', '实验中心F301', '005322', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('98166CE1374CE76B4EE335361F9C34AD', '50000363162001', '10', '18', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('981B27BC321E11C4EE37A21C1297CDB5', '16210034162014', '1', '20', '1', '2', '3', '6', '4', '东校区', 'B楼', '东B503', '006057', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('98DED1E1C40163DFE8148FA9F5F15D03', '18000229162001', '5', '18', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教404', '006225', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('991AC8942ED76878F916E75A3E373952', '18000000162001', '1', '18', '2', '1', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C510', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('992D21DD93D1EE267D9F613141A528B8', '52000077162002', '1', '1', '1', '3', '1', '2', '2', '北校区', '新教学楼', '新教403', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('994D9BE45DA4E0EC99760462CF143598', '40007111162001', '7', '11', '1', '6', '2', '5', null, null, null, null, '030133', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('99CEB7CB5A62274F2C9BBBD6302D6369', '62000091162005', '1', '18', '1', '4', '3', '5', '4', '东校区', 'D楼', '东D202', '090002', '0', '0', '2017-07-24 10:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('9A9425A28D3DED316FFE361299C583F1', 'MAR102162007', '1', '20', '1', '3', '3', '4', '1', '南校区', '逸夫楼', '艺401', '005150', '0', '0', '2017-07-23 17:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('9BC138485E8F8C1B68CC24E3727EE7F1', 'MAR102162031', '1', '20', '1', '4', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C405', '070125', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('9C055EE1DC99F1CD3F44592C4418CC3D', '52000077162003', '4', '5', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教102', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('9C6FEE7F90FC98DA381F7D7C48B336B5', '20000097162001', '1', '12', '1', '2', '3', '5', '4', '东校区', 'A楼', '东A204', '060093', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('9CF885D727E4EBA10415571550A27493', '16210034162021', '1', '20', '1', '2', '7', '10', '4', '东校区', 'E楼', '东E201', '012135', '0', '0', '2017-07-24 11:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('9D1293A25F5741F0C9AF309E5CF61235', '52000006162001', '16', '17', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教403', '880035', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('9D6846BC22D891E701DDD1A6E5A6E151', '16210034162013', '1', '20', '1', '2', '3', '6', '4', '东校区', 'B楼', '东B303', '030117', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('9DFB2CFB7FD7B865ECACFB0981C5DBAC', '31000171162008', '1', '10', '1', '4', '1', '5', '1', '南校区', '丰盛堂', null, '006209', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('9E05582069C272FC6C4D31AF4426AE41', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '160004', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('9E61C6FD6147A2256AFDBBDB5077FBCE', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004581', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('9E68915752E228BE802ED390E8DF3F21', '52000077162003', '8', '8', '1', '4', '1', '2', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A0D8F3BE45391130241380BD566E477F', '40001248162001', '1', '18', '1', '3', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C507', '100091', '0', '0', '2017-07-22 18:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('A1273C9CA1603A9750BE942B89D16A07', '33102616162001', '12', '12', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '050156', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A14B0E023096B95F650E95FB0E3BBEDD', '52000006162001', '12', '12', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教602', '880132', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('A14F9FC840B245C48331B9459BD75301', '16129032162018', '1', '18', '1', '5', '10', '11', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('A17A3EE7E242C92902A2C3A86C3C7F28', '11206001162001', '11', '20', '1', '2', '2', '3', '1', '南校区', '第一教学楼', '1102', '020151', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A2281EA06A9B749F7646EB2AEF99C46E', '02243890162001', '1', '6', '1', '5', '9', '11', '4', '东校区', 'C楼', '东C301', '004611', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('A2590E1B16876F4FBE002D90A50E67B9', 'MAZ106162001', '1', '18', '1', '3', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海C510', '9160184', '0', '0', '2017-07-24 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('A324A9F6095EBE28789FCCE4F7FC0C58', '16210034162010', '1', '20', '1', '1', '3', '6', '4', '东校区', 'B楼', '东B303', '004044', '0', '0', '2017-07-24 10:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('A424AA5B135E11BAE6F54ACA1C181A73', '18000141162002', '1', '18', '1', '1', '10', '11', '1', '南校区', '第三教学楼', '三教407', '156135', '0', '0', '2017-07-21 16:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A456F760D34E5D705D1FA808829504CC', '37009525162001', '12', '13', '1', '6', '2', '5', null, null, null, null, '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('A4AAA5CE63FF20C98253A3EF1340E0A7', '33111014162003', '10', '18', '1', '3', '8', '10', '1', '南校区', '逸夫楼', '艺203', '080007', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('A4C10152887D25F511AC360E057A7430', '50000203162001', '1', '18', '1', '4', '4', '5', '2', '北校区', '新教学楼', '新教205', null, '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('A63083D0021B1C97C43DA67A34161A39', '33102616162003', '8', '8', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '070015', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('A7156A67773377BB103127C3DA773829', 'MAR102162009', '1', '20', '1', '1', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C403', '005544', '0', '0', '2017-07-23 18:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('A8186B195948409A10CA60007BCD16B0', '40007234162001', '1', '18', '1', '5', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海D201', '150152', '0', '0', '2017-07-22 21:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A857DF655EA4593EF022B32102B986A5', '13000327162001', '1', '12', '1', '3', '9', '11', '4', '东校区', 'C楼', '东C103', '160061', '0', '0', '2017-07-22 13:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('A885302DA0E3E5AE86D0CFDA6C410D01', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '130303', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('A8FDAEEF482780CE6E47BE9044777B2C', '12009061162001', '1', '12', '1', '4', '8', '11', '4', '东校区', 'C楼', '东C305', '006262', '0', '0', '2017-07-24 07:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('A91A3664EE3B4D4C5FA9F52010F62B38', '80000175162001', '1', '9', '1', '4', '8', '9', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A95FE7F09F3699750438FBAF2A179DF0', 'FL1006162001', '1', '18', '1', '3', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海E309', '080103', '0', '0', '2017-07-21 22:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('A99A8DE297F6DE344CF56236DCFB37E0', 'BS104162003', '1', '18', '1', '5', '9', '11', '4', '东校区', 'B楼', '东B103', '005411', '0', '0', '2017-07-24 15:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('A9C931E36BD5E210BA06B8DB608F8F9B', '35129748162001', '1', '18', '1', '5', '4', '5', '4', '东校区', 'E楼', '东E203', '005123', '0', '0', '2017-07-22 12:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AA3C82944E8C018560AF0945E860D0A7', 'MAR102162021', '1', '20', '1', '3', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海C205', '006775', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('AA90B1D982EC30832B899C5AD43DA685', '33102616162003', '5', '5', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '140048', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AA9F11094989BB772EA895C5B06044AF', '02243912162001', '10', '18', '1', '3', '8', '9', '4', '东校区', 'B楼', '东B402', '006021', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('AAABA9435529E09C368C98D57407FEB4', '62000146162001', '21', '21', '1', '5', '2', '5', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AAAF20BCCBEAE5F5B463D177B0CB596C', 'LS2044162002', '14', '18', '1', '2', '3', '5', '1', '南校区', '逸夫楼', '艺504', '090065', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('AB06A9B27DBD7D5ECE9002935DE1FD62', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '100147', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('AB66937A58D6D512F4BE2E7327705CD9', '62000054162001', '1', '18', '1', '1', '9', '11', '4', '东校区', 'D楼', '东D503', '070142', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AB6A72B417617A1021DC35A2AE78AEF2', '33102616162001', '7', '7', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '020185', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AC493527DF593BE59A50335A66BC8068', '62000146162001', '21', '21', '1', '3', '8', '11', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AC4971F4BE1B368CC0C1EB60DD787AA4', '20000159162002', '1', '12', '1', '5', '9', '11', '4', '东校区', 'C楼', '东C203', '130334', '0', '0', '2017-07-22 07:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AC5A06332BB5921543EE1C5A1E85A735', '16210034162012', '1', '20', '1', '1', '7', '10', '4', '东校区', 'B楼', '东B303', '004044', '0', '0', '2017-07-24 10:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AC7792C53FABDC3FB7633CC1CA2B98EE', '62000072162001', '1', '18', '1', '4', '2', '3', '4', '东校区', '东校实验中心大楼B栋', '实验中心B203', '080066', '0', '0', '2017-07-23 19:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AC7838327AEB78143216EA2DC812B8BF', 'LN102162002', '1', '12', '1', '4', '13', '15', '3', '珠海校区', '珠海教学楼', '珠海C403', '006150', '0', '0', '2017-07-22 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AD4908DA3BB24D4ABA76D2C40F67B90D', '15000287162001', '1', '18', '1', '1', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海E305', '001333', '0', '0', '2017-07-22 13:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AE2B7DBCC00F9ECC1C32871A507FD574', '31000358162013', '2', '10', '2', '3', '1', '8', '1', '南校区', '丰盛堂', null, '006542', '0', '0', '2017-07-23 11:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AE6D5EE8A84B4F4C6362DEC02B93D661', '37000357162001', '1', '18', '1', '1', '8', '10', '3', '珠海校区', '珠海教学楼', null, '140022', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('AE8246CD2361A672497659884382D2B8', 'MAR101162003', '1', '20', '1', '1', '9', '11', '4', '东校区', 'B楼', '东B104', '080110', '0', '0', '2017-07-24 12:03:44');
INSERT INTO `t_course_plan_zsu` VALUES ('AEAD1B3857A4693C3A64AFCB40B4761F', '46000015162003', '5', '16', '1', '5', '9', '11', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('AECE828A70CBE78781782B60CB9512B3', '11206001162001', '1', '10', '1', '2', '2', '3', '1', '南校区', '第一教学楼', '1102', '005598', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('AF13ABB974AC05856030C7FD59C07FDA', '45000216162001', '1', '18', '1', '3', '13', '14', '3', '珠海校区', '珠海教学楼', '珠海E209', '169421', '0', '0', '2017-07-24 09:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('AFD9C6081CC1FE0BDBF56241A1AFAE3D', 'EGE102162001', '1', '2', '1', '2', '1', '3', '3', '珠海校区', '珠海教学楼', '珠海B209', '005853', '0', '0', '2017-07-22 16:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B04346B1CDD04FE0C4D4C5EA3A2FC084', '40000278162001', '5', '18', '1', '3', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F410', '120321', '0', '0', '2017-07-22 22:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B0662B4DF8004047999586D20F1384DA', '62000073162002', '1', '18', '1', '4', '14', '15', '4', '东校区', '东校实验中心大楼B栋', '实验中心B203', '080066', '0', '0', '2017-07-23 19:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B0D95437D5C98F22D9500EA48B78E025', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '130303', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B1249CE254317C3FD7704818378B1F16', '38000090171001', '1', '20', '1', '5', '2', '4', null, null, null, null, '005677', '0', '1', '2017-07-23 23:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B175B763033A00DA61DD3B77C5A368D5', '46000102162005', '1', '18', '1', '3', '13', '14', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '005215', '0', '0', '2017-07-21 16:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B17C96536386F3A264D22F54AE55A751', '45000175162001', '19', '19', '1', '3', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海A310', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B1806085C0FF44FD0641D1FAE1F31D86', '33101031162005', '1', '18', '1', '4', '2', '4', '1', '南校区', '曾宪梓堂南院', '南院517', '120210', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B2299148FD12573078C51F5C97FA1441', '38112515171002', '1', '20', '1', '3', '5', '8', '4', '东校区', '东校实验中心大楼A栋', '实验中心A401', '150180', '0', '0', '2017-07-23 23:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B23D9779C6CA8290332A9374A6C83F68', '19000374162050', '1', '18', '1', '1', '4', '5', '1', '南校区', '逸夫楼', '艺206', '079031', '0', '0', '2017-07-24 21:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B2D3339FC2FDCB3D03A3FF7014D007B0', '33000072162002', '10', '10', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B3111B0DD2F60636B4D8700613561035', '52000068162002', '14', '16', '1', '4', '3', '4', '2', '北校区', '新教学楼', '新教203', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B35C716FCF8E89378845BE8D1DB8C17D', 'LN201171004', '1', '9', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B36B0CBBE6497DC96A06FC6AEE968133', '16210034162026', '1', '20', '1', '3', '7', '10', '4', '东校区', 'B楼', '东B303', '012135', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B3F7B390E2F957E56C87A898FC9F4EEE', '52000068162001', '1', '15', '1', '3', '3', '4', '2', '北校区', '新教学楼', '新教504', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B4B92680657E3B8D4C90504FAE8067D2', '62000100162003', '5', '17', '1', '1', '9', '11', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B52F336CA4E363DE27710A45B9003906', 'CHM110162004', '1', '18', '1', '1', '8', '9', '1', '南校区', '逸夫楼', '艺407', '120016', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B5D7D73A18F41A1415CE83E221CFB9DB', '10112124162004', '1', '9', '1', '5', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C405', '110128', '0', '0', '2017-07-22 11:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('B5FD5E1FB3D0875C4125A2A37CC1769F', '52000087162002', '1', '6', '1', '1', '10', '11', '2', '北校区', '新教学楼', '新教204', '820335', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B637BF03CCC7620B208220D6ACEDB549', '50000364162001', '1', '18', '1', '2', '1', '2', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B650CE0B68018CA4611FC3F5E7679F00', '52000006162003', '16', '17', '1', '2', '8', '9', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B66E5AEC4BA1BB3637AF845451387040', '52000006162003', '16', '16', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B6AD06EF6B72CF309B83F1F50C9A3B86', '52000068162001', '14', '14', '1', '5', '8', '9', '2', '北校区', '新教学楼', '新教303', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B794885E2B074B1C14542AE9E52B528A', '52000006162001', '6', '6', '1', '2', '8', '9', '2', '北校区', '新教学楼', '新教403', '880050', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('B7A76BBEEAF048BFE440FC52CEAED24F', '52000077162002', '1', '1', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B7AAED5C94127A84462ED5C7CC9D1028', '16210034162006', '1', '20', '1', '3', '7', '10', '1', '南校区', '逸夫楼', '艺308', '167274', '0', '0', '2017-07-24 09:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B7CBAB76FEB575A9D623E704D071A198', '11200161162001', '2', '13', '1', '2', '13', '15', '1', '南校区', '逸夫楼', '艺308', '090034', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B7D688CFB01FEC308AA4209820EDC87C', '16210034162007', '1', '20', '1', '2', '7', '10', '1', '南校区', '逸夫楼', '艺308', '040090', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B8456C6CE60996DE859D28438C070FC3', '52000077162003', '1', '2', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教102', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B861F8FE1B3B28FFB79C98F256B55907', '33102616162001', '9', '9', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '110025', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('B8728EB2B315268B5B42C4B65D299CA7', 'LS1002162001', '13', '18', '1', '1', '8', '9', '1', '南校区', '逸夫楼', '艺303', '120212', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B97F55B34925CD89301F418EDA370727', '16000068162010', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C405', '120191', '0', '0', '2017-07-24 11:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B9865D648939375196895317C25E41C1', '16129032162196', '1', '18', '1', '3', '10', '11', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B992BF977F0CBF57195B9076E8B33503', '13000196162002', '1', '20', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B202', '160061', '0', '0', '2017-07-22 13:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('B9EA0ED5AE9DA4D4AD7034F8E2C9A425', '13000267162001', '1', '12', '1', '5', '3', '5', '4', '东校区', 'A楼', '东A401', '130161', '0', '0', '2017-07-23 19:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('B9F1E3F15E05A9943E0336391328C147', '37009525162001', '5', '7', '1', '5', '2', '5', '3', '珠海校区', '珠海教学楼', '珠海C302', '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('BA1B2D5DCF8790D94AB82F489F068AE8', '42000299162001', '1', '18', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C408', '130166', '0', '0', '2017-07-23 23:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('BA55118BAA1294C0F2FCCCE3993BDA91', '12009061162001', '1', '12', '1', '4', '8', '11', '4', '东校区', 'C楼', '东C305', '004061', '0', '0', '2017-07-24 07:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('BB3D8F64A64E6BA1B526452BA6D5C0A3', '13000187162001', '2', '13', '1', '2', '13', '15', '4', '东校区', 'D楼', '东D304', '120253', '0', '0', '2017-07-22 13:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('BBBB8A84BE82615B64495E359440C0C2', 'MAR101162006', '1', '20', '1', '2', '9', '11', '4', '东校区', 'B楼', '东B101', '006604', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('BC6DACB4FD8FD93CACBFEA2CCB689FE9', '16210034162008', '1', '20', '1', '2', '7', '10', '1', '南校区', '逸夫楼', '艺302', '006497', '0', '0', '2017-07-24 10:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('BD2048BBA3B28C640B99D0E650E47AB5', '50000203162001', '1', '18', '1', '3', '3', '5', '2', '北校区', '新教学楼', '新教301', null, '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('BDA0BA112198238744933A866631DB90', '10134024162001', '1', '18', '1', '1', '2', '4', '1', '南校区', '叶葆定堂', '叶202', '020043', '0', '0', '2017-07-21 16:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('BE798BFCF770B1CB30B1D4D4FDFBF7B4', '35117629162001', '1', '18', '1', '1', '10', '11', '4', '东校区', '东校实验中心大楼B栋', '实验中心B401', '006100', '0', '0', '2017-07-24 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('BEAA6E32FD3F415DAB75413FFF9B94B2', 'MAR102162017', '1', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海C205', '006775', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('BF046AB2FDF99EB4E3442048A70D254B', 'MAR101162015', '1', '20', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B204', '005637', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('BFA926E686BFDED24D50D2CCD943C27C', '17000183162001', '1', '18', '1', '1', '3', '5', '4', '东校区', '东校实验中心大楼D栋', null, '140145', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('BFB4930A6F01C9ABB4FE8054168A312C', '46000113162001', '1', '18', '1', '4', '7', '8', '4', '东校区', 'D楼', '东D102', '150036', '0', '0', '2017-07-23 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('C1447F1D87DA7D8144911B75A3FA3993', '80000142162001', '1', '9', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C1D8CBFC80864902986018A11BDC3FEF', '18000141162002', '1', '18', '1', '3', '2', '3', '1', '南校区', '第三教学楼', '三教407', '156135', '0', '0', '2017-07-21 16:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C250C2C35AB10BF7ECC26E3C3E42EC84', '15000291162002', '1', '18', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海E307', '006725', '0', '0', '2017-07-25 11:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C2CC911E6E6EFE22F2003185E28BFE19', '16210034162019', '1', '20', '1', '2', '7', '10', '4', '东校区', 'B楼', '东B503', '006057', '0', '0', '2017-07-24 11:03:44');
INSERT INTO `t_course_plan_zsu` VALUES ('C357F770CEE00F17670A1C38B7D01374', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004965', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('C36AE61AA3F7A1F84D34BCD309F3FFEC', '52000077162003', '1', '1', '1', '3', '3', '4', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C430B10961135E1B0D71B1B8FBDD0DB1', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '020084', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('C43948AEC4ABF91A2F893B7FC6ECB86D', '18000094162003', '1', '4', '1', '1', '8', '9', '1', '南校区', '第三教学楼', '三教412', '149183', '0', '0', '2017-07-21 17:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C46D52AB732F924C3DE23A9E712DE070', 'PE102162209', '1', '18', '1', '4', '4', '5', null, null, null, null, '109127', '0', '0', '2017-07-24 15:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C473BFCA65248CF7F1C20AADB00A51EA', 'LS1006162004', '1', '9', '1', '2', '4', '5', '1', '南校区', '逸夫楼', '艺405', '050117', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C4D7EC0822C845D0FF13E6B1B38953D3', '17000120162002', '1', '18', '1', '4', '7', '8', null, null, null, null, '150156', '0', '0', '2017-07-24 23:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C4E13C78929D0A8AA15CC3630DEA010A', '14000588171001', '1', '19', '1', '2', '7', '8', '4', '东校区', '东校区南学院楼D栋', '南学院楼D304', '006290', '0', '0', '2017-07-23 22:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C53E13128C994F21C2EB74536FC32FF5', '33000072162001', '1', '1', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '020169', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('C5D30BFE29ADC20998321017A84A1512', 'MAR102162020', '1', '20', '1', '3', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海C207', '006426', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C5D560A0A986BA96583F1D950DBE9D4E', '46000102162001', '1', '18', '1', '3', '2', '3', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '005215', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('C5D7B0F44331DD4A1AE9085C607F4B38', '45000175162001', '18', '18', '1', '4', '1', '3', '3', '珠海校区', '珠海教学楼', '珠海A309', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C6140A5FA7D3D743A5741BF39D7064CC', '35111166162001', '1', '18', '1', '5', '3', '5', '4', '东校区', 'A楼', '东A403', '110170', '0', '0', '2017-07-24 19:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('C61C5C368159A06B3CEBFB016AC769EE', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '020084', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C61C797ABE646B79D1280FA47BF0F89D', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '130303', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C72B65A3A3DF201D32278ECB5F451178', '52000068162002', '12', '12', '1', '4', '3', '4', '2', '北校区', '新教学楼', '新教203', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C74CB9D568F9D41BD4BCC44A850D4C2F', 'MAR101162009', '1', '20', '1', '2', '9', '11', '4', '东校区', 'B楼', '东B204', '150170', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('C778A3CF28227A2A8D14968BC1E5E11A', '33102616162001', '3', '3', '1', '5', '13', '15', '1', '南校区', '逸夫楼', '艺302', '006613', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C7AF3ADC37D7EB9ACD3B92C4730977C3', 'PE102162141', '1', '18', '1', '2', '10', '11', null, null, null, null, '006582', '0', '0', '2017-07-25 10:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C81070997E4703DD0FD7B59EA9504CC8', '17000127162001', '10', '18', '1', '5', '3', '5', '4', '东校区', 'A楼', '东A306', '130147', '0', '0', '2017-07-25 09:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('C8468BDF212376429A04F7081B88032E', 'MAR101162020', '1', '20', '1', '2', '3', '5', '4', '东校区', 'B楼', '东B204', '150170', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('C85B4A019C87527D1F9DFE9F7CDCB023', 'LS2022162001', '1', '18', '1', '2', '8', '9', '1', '南校区', '逸夫楼', '艺304', '004704', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C87ECA897016E8FFBDBECC6D5B1CC36D', '18000096162003', '1', '18', '1', '4', '10', '11', '1', '南校区', '第三教学楼', '三教412', '004417', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('C98E07DA229ED3E1C0AA2120F1EC7777', '52000077162003', '2', '2', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('C9C0764D9DB97BDE3DD6670B3E0B634E', '33000072162001', '11', '12', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('C9C35AA243CFC507D7B4C681EDEA5512', 'MAR102162024', '1', '20', '1', '4', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海C205', '006775', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('C9F2C26A49497D14B8518C3C6ADCDDBF', '33000072162002', '17', '18', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CAAD39E293BE0C42E55FBB94A552EF67', '16113636162001', '1', '20', '1', '3', '1', '3', '4', '东校区', 'A楼', '东A505', '130320', '0', '0', '2017-07-21 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('CAEFE4F506BCD90DDF2152D73C6829E8', 'DCS112162010', '1', '18', '1', '1', '13', '14', '4', '东校区', '东校实验中心大楼B栋', '实验中心B201', '005427', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CB1D821A2D44620AE720DC6734982B35', 'MA196162003', '1', '20', '1', '5', '3', '5', '4', '东校区', 'B楼', '东B202', '020118', '0', '0', '2017-07-21 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CB74EC41C159258DEE37F05DFAF826D3', '16210034162015', '1', '20', '1', '2', '3', '6', '4', '东校区', 'E楼', '东E101', '020030', '0', '0', '2017-07-24 10:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CB82BD4662BEAEA844ED48551E54EDD9', 'LN201171005', '1', '9', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CBD3F1859EB8E0C82DB9E6D7BE5F6173', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '070024', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CC34D52FE21F54ACD01F3258FAAC0A9D', 'LS1002162002', '1', '6', '1', '2', '8', '9', '1', '南校区', '逸夫楼', '艺307', '005402', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('CC4D31B8C47A2F88A7E8C4CF5ADB1F7E', '30000023162001', '10', '18', '1', '2', '3', '5', '1', '南校区', '第一教学楼', '1302', '050199', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CCA4DA40BB464BE1E549EB00EFE8A4AE', '11206202162001', '1', '20', '1', '4', '2', '3', '1', '南校区', '第一教学楼', '1104', '020151', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CCDC8A41B1CF417FE3219E03C61CB011', '33101108162001', '2', '18', '1', '1', '8', '11', '4', '东校区', '东校实验中心大楼F栋', null, '080052', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('CCE941648039FA29C167C2317D7C895B', '46000055162001', '1', '18', '1', '5', '2', '3', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '140254', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('CCED91061C281034358F6B862AEFA4EB', '30000023162001', '1', '9', '1', '2', '3', '5', '1', '南校区', '第一教学楼', '1302', '020178', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CD63AD885181D0D74292D9ED156FF609', 'LS2044162001', '10', '12', '1', '5', '3', '5', '1', '南校区', '逸夫楼', '艺401', '090065', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CDC6C83971D106D6071FA05B78BA09E5', '16210034162018', '1', '20', '1', '2', '7', '10', '4', '东校区', 'B楼', '东B303', '030117', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CDD9DA0705A9F789EC5B97C5AB24ACF0', '10152116162001', '1', '18', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海D408', '140249', '0', '0', '2017-07-22 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CDEF12DDEA2C2A9C8A32E17270756BA6', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '005554', '0', '0', '2017-07-22 06:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CE2B2A9C27980EC83151957FD19ED4AB', 'MAR102162001', '1', '20', '1', '3', '1', '2', '1', '南校区', '逸夫楼', '艺302', '005655', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('CE2B3D3E3B98A2F8DFAB114A55227930', 'BS104162002', '1', '18', '1', '5', '3', '5', '4', '东校区', 'B楼', '东B103', '005411', '0', '0', '2017-07-24 15:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('CF0A956ACD39EE5A5149F38EA63745C9', '31126537162001', '1', '18', '1', '5', '8', '10', '1', '南校区', '第一教学楼', '1204', '006209', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('CFC03076C9BE7AC8D5CF7584F1DEE8A7', '23000223162001', '10', '20', '1', '4', '8', '10', '1', '南校区', '第一教学楼', '1401', '150019', '0', '0', '2017-07-21 16:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('D00C2711A25FD208395F4FB3553E6FC4', 'LS1008162004', '1', '18', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '160004', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('D12FADA4788C11F66734CC22B5E4F34D', 'MAR102162011', '1', '20', '1', '1', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海C403', '005544', '0', '0', '2017-07-23 18:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D1D5B5A6CB826388C91D3C98EAA44F37', '40007111162001', '7', '11', '1', '5', '3', '5', '3', '珠海校区', '旅游学院大楼', '旅游学院学术讨论室', '030133', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D20660CFA5324D38A60A7CCA69F367C1', '52000087162002', '11', '13', '1', '2', '1', '2', '2', '北校区', '新教学楼', '新教102', '820335', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('D2BC09776C04DAAC680BBF31F03ACDD5', 'MAR102162013', '1', '20', '1', '3', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C303', '005060', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D2EBAC91B4C988D1788177A1097C9BFF', 'MA192162013', '1', '20', '1', '1', '1', '2', '1', '南校区', '逸夫楼', '艺201', '130238', '0', '0', '2017-07-25 14:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('D4437AC61A03B3C89E37F8DBA97C5B01', '33000072162001', '9', '9', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D44D639D6CFDF5C6598CC84529646005', '23000330162001', '1', '20', '1', '2', '13', '15', '1', '南校区', '第一教学楼', '1202', '140247', '0', '0', '2017-07-21 16:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('D4C27ED94C0D77729763B87DE3878DFB', 'CD110162001', '1', '18', '1', '3', '3', '5', '4', '东校区', 'B楼', '东B205', '150168', '0', '0', '2017-07-24 00:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D4D342DEE613F690D550876ACDCF2298', '31000358162014', '2', '10', '3', '3', '1', '8', '1', '南校区', '丰盛堂', null, '060141', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D50B04DB23BDB1FFE60993E7DD57F0FE', 'PHZ102162001', '1', '18', '1', '3', '13', '14', '3', '珠海校区', '珠海教学楼', '珠海C210', '167190', '0', '0', '2017-07-24 13:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D52C38AD147F3D634EA716D3D71E9E68', 'LN201171002', '1', '9', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('D5379170359E8C36D597EA038A1CB791', '31000090162001', '1', '12', '1', '1', '1', '3', '1', '南校区', '第一教学楼', '1505', '080063', '0', '0', '2017-07-24 22:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D58FCA832D565AF3173779A7BEA1CE3F', '33000072162002', '15', '15', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D5CB7DE4E02239C7882B10847312BC6F', 'LN201171001', '1', '9', '1', '5', '5', '6', '1', '南校区', '叶葆定堂', '叶203', null, null, '0', '2017-07-24 09:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('D601CE7AD6DFBBC76DFF4F0FF012CF94', '16000068162026', '1', '20', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C407', '006321', '0', '0', '2017-07-24 12:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('D641738481D098A50FE602D50EC6BDBE', '10000343162002', '1', '12', '1', '4', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C508', '167162', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('D6EE86D7721CD0D3363D19942DBE1E83', '19000367162039', '1', '18', '1', '5', '4', '5', '1', '南校区', '逸夫楼', '艺206', '006417', '0', '0', '2017-07-24 21:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('D753561F998ADA76A382F89144A5003A', '23000351162001', '1', '20', '1', '5', '12', '15', '1', '南校区', '园东区106栋', '灵长类与人类进化室', '090013', '0', '0', '2017-07-22 18:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('D82646D5520D004769BF3970D6A3B562', 'MA192162014', '1', '20', '1', '1', '4', '5', '1', '南校区', '逸夫楼', '艺201', '130238', '0', '0', '2017-07-25 10:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('D8F2C64ABB66BD7E2A50CBFA350F9AE9', '18000100162001', '1', '18', '1', '3', '4', '5', '1', '南校区', '第三教学楼', '三教408', '006643', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('D92652D8CE82FFDB33E27A0F41264426', '33102566162001', '3', '6', '1', '3', '9', '11', '4', '东校区', 'B楼', '东B503', '030108', '0', '0', '2017-07-24 17:33:44');
INSERT INTO `t_course_plan_zsu` VALUES ('D952AB9BF8C3FD2B8E7CE5C0428700C6', '02040004162004', '1', '10', '3', '1', '7', '8', '4', '东校区', 'B楼', '东B503', '006740', '0', '0', '2017-07-22 21:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('D98E5D8E18564BF6A0FBF68AF47AB227', '52000077162003', '4', '5', '1', '4', '3', '4', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DA66F6EA589024D867C0869B2A20B03D', '16129032162153', '1', '18', '1', '3', '4', '5', null, null, null, null, '014154', '0', '0', '2017-07-24 16:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DAA0B3BF847013D47EF79D74FD7C995A', '10000267162001', '1', '18', '1', '1', '2', '3', '3', '珠海校区', '珠海教学楼', '珠海D304', '159413', '0', '0', '2017-07-25 10:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('DB032365E6849B641200FB466A0865B1', 'PE102162190', '1', '18', '1', '4', '10', '11', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('DB14ACE32639810FADADFE5AE455C0B2', '31000366162001', '2', '10', '1', '1', '8', '13', '1', '南校区', '丰盛堂', null, '100147', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('DB62581D19B63F44A396A0906D95E982', '76120009162001', '13', '18', '1', '3', '4', '5', '4', '东校区', 'A楼', '东A102', '120001', '0', '0', '2017-07-24 15:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('DC097E8343F7592C49DC3CD1CFD272E1', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '020125', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('DC22780E0C369DAFF5BEAFD14D2C60D2', 'PHY126162002', '1', '18', '1', '4', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F303', '080023', '0', '0', '2017-07-22 06:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DC53F333AD0EC96C15D025F0AF693D64', '16000068162014', '1', '20', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C407', '012078', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DCF145BE426612D3D2E3C2F8F7AD5F62', '52000006162003', '17', '17', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('DD2047F3690443AE653352D15F0449C0', '10112124162004', '10', '18', '1', '5', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C405', '9160175', '0', '0', '2017-07-22 11:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('DDF162310390383A83DA772681FD13DE', '11200161162002', '2', '13', '1', '3', '13', '15', '2', '北校区', '新教学楼', '新教202', '090034', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DE1965CF8FB10293D4812CADDCD50A0E', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '090055', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('DE28B62B700EC1EB570615C1DFDC0AB0', '16210034162005', '1', '20', '1', '3', '3', '6', '1', '南校区', '逸夫楼', '艺308', '167274', '0', '0', '2017-07-24 09:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('DE4CB96E96ABC14A46CEC8FE9DAB49B2', '62000146162001', '21', '21', '1', '3', '2', '5', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DE8856D03203FCF08BB3560A0349EA7D', '52000077162002', '2', '2', '1', '2', '1', '2', '2', '北校区', '新教学楼', '新教403', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DE9C33CFB0B0D69286B9E81108F8DAB3', '02040004162004', '11', '18', '3', '1', '7', '8', '4', '东校区', 'B楼', '东B503', '130197', '0', '0', '2017-07-22 21:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DEE762B71F0A3E700501EA1247A3E811', '41000224162001', '1', '18', '1', '2', '2', '4', '1', '南校区', '叶葆定堂', '叶202', '004124', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('DF44AD6A34393D10E28C8C0FF117E233', '50000364162001', '1', '18', '1', '4', '1', '2', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DF7EBA4545B126544E0857EA1D2A90E2', '10000210162001', '10', '18', '1', '3', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海D201', '005629', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('DFD3F4A1BD5BD857A0000A2351AAF808', '33102616162003', '4', '4', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '140030', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('DFDD8BE6E7D1E407965D588E18093F66', '52000006162003', '13', '13', '1', '1', '3', '4', '2', '北校区', '新教学楼', '新教404', null, '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E06C6D20FA99E7D1A93FA82EDF1A3745', 'EGE104162001', '3', '15', '1', '2', '1', '6', '3', '珠海校区', '珠海教学楼', '珠海A209', '005853', '0', '0', '2017-07-22 17:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E07F99CC86829DE2E07C6AE37BAC3BBE', 'MA196162001', '1', '20', '1', '4', '3', '5', '4', '东校区', 'B楼', '东B202', '020118', '0', '0', '2017-07-21 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E10183C6FFDDE031B802C183E879E8C7', 'MAR101162017', '1', '20', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B104', '080110', '0', '0', '2017-07-24 12:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E12458FE27C2D88606E3268FBC3D89BF', 'MAZ106162001', '1', '18', '1', '3', '3', '4', '3', '珠海校区', '珠海教学楼', '珠海A310', '9160184', '0', '0', '2017-07-24 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E15789C09966C379ABC23F6F4FA7B2B7', 'HS206162001', '11', '20', '1', '3', '8', '9', '3', '珠海校区', '珠海教学楼', '珠海F303', '100031', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E172ABE0779874F831AA9F415502102E', '38112065162002', '1', '18', '1', '4', '7', '9', '4', '东校区', 'A楼', '东A401', '140054', '0', '0', '2017-07-23 23:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E1BF6788FEF8CCDCDAFEB2C94343DBD2', 'MAR101162001', '1', '20', '1', '1', '3', '5', '4', '东校区', 'B楼', '东B101', '005730', '0', '0', '2017-07-24 12:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E1C7D6C8019219C98C9442F103FFE79F', 'MAR102162022', '1', '20', '1', '3', '10', '11', '3', '珠海校区', '珠海教学楼', '珠海C303', '070125', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E2159212F344CB18D0D4CF4E2E0F47A8', '31000364162001', '1', '16', '1', '6', '1', '2', null, null, null, null, '005379', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E24B1FEF30B7D78B068D6FCCE97EBB48', 'MA192162014', '1', '20', '1', '3', '1', '2', '1', '南校区', '逸夫楼', '艺201', '130238', '0', '0', '2017-07-25 10:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E2B867EC286D31BC1FD2E9C2ABA41066', 'MAR102162008', '1', '20', '1', '3', '3', '4', '1', '南校区', '逸夫楼', '艺402', '006266', '0', '0', '2017-07-23 18:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E2DDE047708F77367E78D836232F4D73', '16000068162022', '1', '20', '1', '2', '9', '11', '3', '珠海校区', '珠海教学楼', '珠海F403', '012168', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E2E44DB613257F99E28AE3698EA9F27C', '13000094162001', '1', '20', '1', '4', '3', '5', '4', '东校区', 'A楼', '东A503', '100018', '0', '0', '2017-07-23 22:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E320BFF0F1A40DF0B3F1BFEC06CE9A75', '52000077162003', '2', '2', '1', '5', '1', '2', '2', '北校区', '新教学楼', '新教102', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E35ED1B60CA75DBB0CD1944A076F619F', 'PE102162232', '1', '18', '1', '4', '8', '9', null, null, null, null, '014154', '0', '0', '2017-07-24 16:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E49982D8597512DA53F87EC69DCAF930', '33102616162003', '10', '10', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '004331', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E4F795B07B46BB6BBA6E858E57395FB5', 'LS2046162001', '1', '18', '1', '5', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院101', '050117', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E524BF9EA420AE94ACD4A844CD746E40', 'LS1008162001', '1', '18', '1', '4', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '050117', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E59276FC9C81B50C6026092269D17998', '16000068162007', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C507', '012021', '0', '0', '2017-07-24 11:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E5A3DC75B17C43BB35C8FA0F15E63A27', 'MAR102162030', '1', '20', '1', '4', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C205', '006775', '0', '0', '2017-07-23 18:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E5BDB915F916937DE96D5AF510578E43', '33102616162003', '13', '13', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '005302', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('E5D21CAB65379EE311E943D12DDAFC08', '52000068162002', '16', '16', '1', '1', '10', '11', '2', '北校区', '新教学楼', '新教204', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E5E6DDBE754F57EC3D7C9C984C680203', '46000056162004', '1', '18', '1', '4', '10', '11', '4', '东校区', 'D楼', '东D402', '130159', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E6207A2FD6DEA17CB936C834CC92ED9D', 'MAR102162003', '1', '20', '1', '3', '1', '2', '1', '南校区', '逸夫楼', '艺402', '006266', '0', '0', '2017-07-23 18:23:40');
INSERT INTO `t_course_plan_zsu` VALUES ('E642E4CD802D766C2D89A2909522D6AA', '16129032162217', '1', '18', '1', '5', '4', '5', null, null, null, null, '109127', '0', '0', '2017-07-24 15:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E681311C794E3CCA51336B701F1F5D31', '45000216162001', '1', '18', '1', '1', '13', '14', '3', '珠海校区', '珠海教学楼', '珠海E209', '129233', '0', '0', '2017-07-24 09:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E6BE49F2EC7840211C31A677629237E4', '62000146162001', '21', '21', '1', '4', '8', '11', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:42');
INSERT INTO `t_course_plan_zsu` VALUES ('E7A4D28C5C72F01C84A8EA7933B55E3E', '24200337162001', '1', '18', '1', '4', '4', '5', '1', '南校区', '逸夫楼', '艺404', '110143', '0', '0', '2017-07-25 14:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E7F3F82C07954C37BD6ED67F041A4A62', '46000071162001', '1', '18', '1', '3', '9', '10', '4', '东校区', '东校实验中心大楼B栋', '实验中心B201', '130248', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('E8C1AF34C74B673FEA2B5532CBFB3401', '16129032162205', '1', '18', '1', '3', '10', '11', null, null, null, null, '006582', '0', '0', '2017-07-25 09:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('E90728F4E7CAE138F6A015B5E9E248A6', '18000113162001', '1', '18', '1', '5', '2', '4', '1', '南校区', '文科楼', '文110', '130228', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('EA182E5FE73D9CEC7D6242E582FDDF83', 'LN203171004', '1', '9', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EA573AC28978B6280B132E87D556C4BE', 'PE102162170', '1', '18', '1', '2', '8', '9', null, null, null, null, '006582', '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('EA69FF70EC73A38CF6C3165492916869', 'LS1004162005', '1', '6', '1', '4', '7', '10', '1', '南校区', '曾宪梓堂南院', '南院417', '120006', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EB2673AEDA70F36EADF1EDD1109C43DD', 'LN203171002', '1', '9', '1', '5', '9', '10', '1', '南校区', '叶葆定堂', '叶201', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EC1A2870E7817B72E9C700E41B8A75F2', '19000367162040', '1', '18', '1', '5', '1', '2', '1', '南校区', '逸夫楼', '艺206', '006417', '0', '0', '2017-07-24 21:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('EC2823C0172D1DE06E1FC5008F3A58C4', '52000077162002', '3', '5', '1', '4', '1', '2', '2', '北校区', '新教学楼', '新教602', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('EC3011EC3019D43BA988BCB0C328C33A', '37009525162002', '12', '13', '1', '6', '8', '11', '3', '珠海校区', '珠海教学楼', null, '006211', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EC7002994FD8341868CE0B65EAD105CC', 'MAR102162032', '1', '20', '1', '4', '4', '5', '3', '珠海校区', '珠海教学楼', '珠海C207', '006426', '0', '0', '2017-07-23 19:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('ED3C92F5EEBE57F7BCA93BEC153D9560', '16210034162016', '1', '20', '1', '2', '3', '6', '4', '东校区', 'E楼', '东E201', '050159', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('ED4BA892F6923FEF0E0334A4B1A21293', '10000210162001', '1', '9', '1', '3', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海D201', '002053', '0', '0', '2017-07-24 18:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('ED8696B1EFE472AD770ECB629D41612C', '46000056162003', '1', '18', '1', '4', '7', '8', '4', '东校区', 'D楼', '东D402', '130159', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EDC5F549CD29C2BBF62BCC7025B7D3FE', '62000096162001', '1', '18', '1', '1', '8', '10', '4', '东校区', '东校实验中心大楼B栋', '实验中心B403', '005804', '0', '0', '2017-07-24 10:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('EDF221CBC3B8088A201403736E355B07', '46000056162001', '1', '18', '1', '4', '1', '2', '4', '东校区', 'D楼', '东D402', '140150', '0', '0', '2017-07-21 16:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EDF2C37354F93B8335D7B91ECBEBB53C', 'PE102162233', '1', '18', '1', '4', '8', '9', null, null, null, null, '109127', '0', '0', '2017-07-24 16:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('EE932EDAA2A20D593CE0D0404ABD88FE', '10102023162002', '1', '18', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海C412', '167166', '0', '0', '2017-07-21 17:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('EECE801F3DE200BED97E810F6E862B48', '16129032162152', '1', '18', '1', '3', '4', '5', null, null, null, null, '109127', '0', '0', '2017-07-24 10:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('EF4F25C42FEE3E33A9A79F7E75AE27D6', '16000068162003', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海F403', '012168', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('EF7D1118E36ECC17739EC72AB8F3ED3F', '16000068162006', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C505', '080109', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F0340B181C1DA9139A611E46A1E6D117', '33102616162003', '9', '9', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '110025', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F046A1878902BA8103B78072A94D3233', '33109157162001', '17', '18', '1', '3', '13', '15', '1', '南校区', '逸夫楼', '艺401', '040104', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F0A1FCE19B84A739C39D9630547BD3FA', '02243912162001', '1', '9', '1', '3', '8', '9', '4', '东校区', 'B楼', '东B402', '130274', '0', '0', '2017-07-24 17:23:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F0C0B53B7FB44A88F0E8560A0B1169B8', '46000015162002', '5', '16', '1', '2', '1', '3', '4', '东校区', '东校实验中心大楼C栋', '实验中心C102', '001618', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F0D27D1D09DB1D2BF2D167194F98797D', '10000210162002', '10', '18', '1', '3', '1', '3', '3', '珠海校区', '珠海教学楼', '珠海D201', '005629', '0', '0', '2017-07-24 19:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('F153074A1667886588C04FB58E5ED299', '31000358162009', '2', '10', '3', '4', '8', '13', '1', '南校区', '丰盛堂', null, '070010', '0', '0', '2017-07-22 06:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F164D469B2632E40EB4009ED7B6411FE', '18000100162003', '1', '18', '1', '4', '8', '9', '1', '南校区', '第三教学楼', '三教412', '130228', '0', '0', '2017-07-21 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('F1A9C004FC32970F8ABCF6F06E765596', '38000089171001', '1', '20', '1', '5', '2', '4', '4', '东校区', '东校区北学院楼', null, '005677', '0', '1', '2017-07-23 23:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('F1B17EFA5F77B2BE9023C5AD15577018', 'MAR101162007', '1', '20', '1', '2', '9', '11', '4', '东校区', 'B楼', '东B104', '120190', '0', '0', '2017-07-24 12:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('F1DEBD4B209D193CBA275D53F8C9E266', '33102616162003', '3', '3', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '006613', '0', '0', '2017-07-24 17:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('F20167729F9DDA7C18BC580D7CD6B5B7', '13000197162002', '1', '20', '1', '2', '3', '5', '4', '东校区', 'C楼', '东C402', '120253', '0', '0', '2017-07-22 13:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F24EF1EE55FA629725B38ECDBA3399D3', '62000146162001', '21', '21', '1', '2', '8', '11', null, null, null, '东A101', null, '0', '0', '2017-07-24 10:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F27CB979AFEA72A856DBC1D5971B5AB0', '33000072162002', '6', '6', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F29282F45958D44BE9A9E03701B9E272', '15000512162250', '1', '18', '1', '4', '8', '9', '4', '东校区', 'E楼', '东E204', '004404', '0', '0', '2017-07-25 09:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F2DCF788CC8D9C4CA42B0024EF0BECFE', 'LS1008162002', '1', '18', '1', '2', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '004581', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F2E001BE64D0FA4D825F0243343187DB', '35129304162007', '1', '20', '1', '1', '3', '5', '1', '南校区', '第一教学楼', '1301', '004989', '0', '0', '2017-07-25 11:03:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F2E08A7303746F2D313C98DAAB7CDEA9', '11207211162001', '1', '20', '1', '5', '4', '5', '1', '南校区', '第一教学楼', '1104', '120125', '0', '0', '2017-07-24 11:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F2EEE8C4FF951C5EDF21FCD868AA0D03', '80000142162001', '1', '9', '1', '5', '3', '4', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('F3698ABCA9720B505F8BDA1A481402F5', 'LN102162004', '1', '12', '1', '5', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海F303', '006150', '0', '0', '2017-07-22 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F3C560E11EFB89CEF42313DA58AA63D1', '16129032162050', '1', '18', '1', '4', '4', '5', null, null, null, null, '014116', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F3F4B6B99929A05C5210F48C3D1B8A68', '19000155162003', '2', '18', '1', '6', '2', '4', '4', '东校区', 'A楼', '东A101', '004404', '0', '0', '2017-07-25 09:03:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F3FD14B8DA79E8D36D73152804EB6E90', '45000175162001', '18', '18', '1', '5', '1', '2', '3', '珠海校区', '珠海教学楼', '珠海A310', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F3FF86A65EB41BC6A7B982B81B88DC76', '45000175162001', '19', '19', '1', '1', '2', '5', '3', '珠海校区', '珠海教学楼', '珠海A309', '140237', '0', '0', '2017-07-24 09:23:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F45116F507EA676DABA43FC7969AB6A5', '81000053162001', '8', '9', '1', '2', '3', '4', '2', '北校区', '新教学楼', '新教504', '820351', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('F54C167FCDB7795CDBFEFAE5EF29AAFD', '46000102162003', '1', '18', '1', '3', '4', '5', '4', '东校区', '东校实验中心大楼B栋', '实验中心B402', '005215', '0', '0', '2017-07-21 16:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F666BEDC6692DFD6E61D0103BC9D7B67', '52000068162002', '14', '15', '1', '5', '10', '11', '2', '北校区', '新教学楼', '新教204', '880007', '0', '0', '2017-07-25 08:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('F67C381067AAD8355E4F9DA88ECC1856', '10152116162002', '1', '18', '1', '2', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海E402', '140037', '0', '0', '2017-07-24 15:23:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F691A57BFB5CE5864C9842D5080D22F0', '16210034162017', '1', '20', '1', '2', '3', '6', '4', '东校区', 'B楼', '东B403', '012135', '0', '0', '2017-07-24 10:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F70EDFBA0471E8EEC1B9C4F929AB8C81', '31000366162002', '2', '10', '1', '1', '1', '6', '1', '南校区', '丰盛堂', null, '006736', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F7477921C364E6150A8D54B0D1248AE3', '52000006162001', '17', '17', '1', '2', '10', '11', '2', '北校区', '新教学楼', '新教403', '880035', '0', '0', '2017-07-24 11:13:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F7F00D8661EE46B860BE58B48523A8ED', '33000072162001', '2', '2', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '040099', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F8E9A519EE23751E3357CCF48C9A6B7F', 'LS2046162002', '1', '18', '1', '5', '12', '15', '1', '南校区', '曾宪梓堂南院', '南院101', '020084', '0', '0', '2017-07-24 17:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('F922F3877F3C995F46B2787D574A15FA', '33102616162003', '7', '7', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺302', '020185', '0', '0', '2017-07-24 17:43:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F92E40C65616DCF46EBBAE7450ECB079', 'LS2044162002', '10', '12', '1', '2', '3', '5', '1', '南校区', '逸夫楼', '艺504', '090065', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F93799442698C9053E8B9F5FA177C3C4', '31000366162003', '2', '10', '1', '2', '8', '13', '1', '南校区', '丰盛堂', null, '050036', '0', '0', '2017-07-22 06:43:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F96FC95F3203AE88E43B7819C28E73CB', 'LN201171008', '1', '9', '1', '5', '7', '8', '1', '南校区', '叶葆定堂', '叶102', null, null, '0', '2017-07-24 09:13:41');
INSERT INTO `t_course_plan_zsu` VALUES ('F98715F8699C656E74AB35BC6F6523FC', '33000072162001', '15', '15', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F9AFFF67F57E325EA94BEC9281888FF4', '50000116162001', '1', '9', '1', '5', '8', '9', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('F9B51BC7D9402F8F83AB51C7C51F2337', '33000072162002', '9', '9', '1', '5', '1', '3', '1', '南校区', '逸夫楼', '艺301', '130297', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('F9D79C75FE6DC41CBE90B4691F09F453', '31000171162006', '1', '10', '1', '1', '1', '5', '1', '南校区', '丰盛堂', null, '006810', '0', '0', '2017-07-24 22:23:39');
INSERT INTO `t_course_plan_zsu` VALUES ('F9F38585AACBE030BCCADDE90667DEC5', '10000303162001', '2', '13', '1', '2', '13', '15', null, null, null, null, '070114', '0', '0', '2017-07-25 12:53:40');
INSERT INTO `t_course_plan_zsu` VALUES ('FA9E95989581136AA56D164188E51C70', '18000000162001', '1', '18', '2', '5', '8', '10', '3', '珠海校区', '珠海教学楼', '珠海E302', '129228', '0', '0', '2017-07-21 17:03:41');
INSERT INTO `t_course_plan_zsu` VALUES ('FB48893AAB4BD7166860A8BD51306979', '11206105162001', '1', '10', '1', '4', '3', '5', '1', '南校区', '逸夫楼', '艺306', '050058', '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('FBA6601DF0B217D84679A8F2A6B68553', 'LS2044162002', '2', '4', '1', '2', '3', '5', '1', '南校区', '逸夫楼', '艺504', '120006', '0', '0', '2017-07-24 17:53:41');
INSERT INTO `t_course_plan_zsu` VALUES ('FBCEA26338F45C90ADFDE5896EDCC97A', '16000068162005', '1', '20', '1', '2', '3', '5', '3', '珠海校区', '珠海教学楼', '珠海C407', '012078', '0', '0', '2017-07-24 11:33:42');
INSERT INTO `t_course_plan_zsu` VALUES ('FBF67208243A4285428A21D8A8E3CC64', '16129032162149', '1', '18', '1', '3', '4', '5', null, null, null, null, '006582', '0', '0', '2017-07-25 09:43:44');
INSERT INTO `t_course_plan_zsu` VALUES ('FD3B525D4D7F7AC1B377BFA18E00106C', '80000175162001', '1', '18', '1', '1', '8', '9', '2', '北校区', '新教学楼', '新教104', null, '0', '0', '2017-07-25 10:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('FD52F6B9DE75F412C470A30AF234CC0C', 'LS2044162001', '5', '9', '1', '5', '3', '5', '1', '南校区', '逸夫楼', '艺401', '130213', '0', '0', '2017-07-24 17:53:42');
INSERT INTO `t_course_plan_zsu` VALUES ('FD8292CF68DE7040D3A61BBAA490BA28', 'TM120162001', '5', '18', '1', '2', '12', '14', '3', '珠海校区', '珠海教学楼', '珠海E302', '120321', '0', '0', '2017-07-22 19:03:45');
INSERT INTO `t_course_plan_zsu` VALUES ('FDA8C6E77036A021EABEDE25C505D409', '46000090162001', '1', '18', '1', '4', '10', '11', '4', '东校区', 'D楼', '东D501', '150036', '0', '0', '2017-07-23 16:13:44');
INSERT INTO `t_course_plan_zsu` VALUES ('FEAD53AD26F461DA528A7D3DCA3D8687', '52000077162003', '12', '12', '1', '4', '1', '4', '2', '北校区', '新教学楼', '新教603', null, '0', '0', '2017-07-24 08:43:42');
INSERT INTO `t_course_plan_zsu` VALUES ('FEF6C1E6A87C740050BECC0830F1FB9F', '33000216162001', '2', '7', '1', '2', '3', '5', '4', '东校区', 'C楼', '东C101', '005322', '0', '0', '2017-07-24 17:33:43');
INSERT INTO `t_course_plan_zsu` VALUES ('FF6D56D8C0CAC7264D3792D49406EFE9', '33000072162001', '13', '14', '1', '4', '1', '3', '1', '南校区', '逸夫楼', '艺301', '090104', '0', '0', '2017-07-24 17:33:43');

-- ----------------------------
-- Table structure for t_course_professor_info
-- ----------------------------
DROP TABLE IF EXISTS `t_course_professor_info`;
CREATE TABLE `t_course_professor_info` (
  `xq` int(11) NOT NULL,
  `xnd` varchar(20) DEFAULT NULL,
  `kkdwh` int(11) DEFAULT NULL,
  `kkdwmc` varchar(20) DEFAULT NULL,
  `jxbh` varchar(20) DEFAULT NULL,
  `kcdm` varchar(20) DEFAULT NULL,
  `kczwmc` varchar(9) DEFAULT NULL,
  `sksjdd` varchar(9) DEFAULT NULL,
  `kclb` varchar(9) DEFAULT NULL,
  `xf` int(9) DEFAULT NULL,
  `xs` int(9) DEFAULT NULL,
  `zgh` varchar(9) DEFAULT NULL,
  `xiaoqum` int(9) DEFAULT NULL,
  `xiaoqu` varchar(9) DEFAULT NULL,
  `xm` varchar(9) DEFAULT NULL,
  `przwm` int(9) DEFAULT NULL,
  `przw` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`xq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_professor_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_course_zsu
-- ----------------------------
DROP TABLE IF EXISTS `t_course_zsu`;
CREATE TABLE `t_course_zsu` (
  `JXBH` varchar(100) NOT NULL COMMENT '教学班号',
  `KCDM` varchar(400) DEFAULT NULL COMMENT '课程代码',
  `KCZWMC` varchar(400) DEFAULT NULL COMMENT '课程中文名称',
  `XND` varchar(400) DEFAULT NULL COMMENT '学年度',
  `XQ` int(4) DEFAULT '0' COMMENT '学期',
  `KKDWH` int(10) DEFAULT NULL COMMENT '开课单位号',
  `KKDWMC` varchar(400) DEFAULT NULL COMMENT '开课单位名称',
  `KCLB` varchar(400) DEFAULT NULL COMMENT '课程类别',
  `XF` int(8) DEFAULT '0' COMMENT '学分',
  `XS` int(8) DEFAULT '0' COMMENT '学时',
  `SKSJDD` varchar(400) DEFAULT NULL COMMENT '上课时间地点',
  `SFZB` int(4) DEFAULT NULL COMMENT '0(表示课程不需要实施)1(表示课程需要实施) ',
  `XDDX` varchar(800) DEFAULT NULL COMMENT '修读对象',
  `JXJDSCF` int(4) DEFAULT '0' COMMENT '教学进度生成否 0(没有生成) 1(表示生成)',
  `DELETEFLAG` int(4) DEFAULT '0' COMMENT '删除标记 默认0(不删除) 1(删除 )',
  `UPDATETIME` date DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`JXBH`),
  UNIQUE KEY `JXBH` (`JXBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_zsu
-- ----------------------------
INSERT INTO `t_course_zsu` VALUES ('11', 'f', null, null, '0', null, null, null, '0', '0', null, null, null, '0', '0', null);
INSERT INTO `t_course_zsu` VALUES ('16000068162012', '16000068', '马克思主义基本原理', '2016-2017', '2', '25000', '马克思主义学院', '公必', '3', '54', '星期二 8-10 节/珠海C403（1-20 周）', '1', '15级地理信息科学（遥感与地理信息系统方向）#15级地理信息科学（测绘工程方向）#15级自然地理与资源环境(资源环境方向)#15级自然地理与资源环境（自然地理方向）#15级阿拉伯语#15级朝鲜语#15级西班牙语#15级英语（国际翻译学院）#15级会展经济与管理（与澳大利亚昆士兰大学联合培养）#15级旅游管理（国际旅游方向）#15级旅游管理类（旅游学院）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16000068162013', '16000068', '马克思主义基本原理', '2016-2017', '2', '25000', '马克思主义学院', '公必', '3', '54', '星期二 8-10 节/珠海C405（1-20 周）', '1', '15级地理信息科学（遥感与地理信息系统方向）#15级地理信息科学（测绘工程方向）#15级自然地理与资源环境(资源环境方向)#15级自然地理与资源环境（自然地理方向）#15级阿拉伯语#15级朝鲜语#15级西班牙语#15级英语（国际翻译学院）#15级会展经济与管理（与澳大利亚昆士兰大学联合培养）#15级旅游管理（国际旅游方向）#15级旅游管理类（旅游学院）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16129032162018', '16129032', '体育', '2016-2017', '2', '16120', '体育教育系', '公必', '1', '36', '星期五 10-11节(1-18)每周', '1', '北校区,护理学院,2015级,15级护理学#北校区,中山医学院,2015级,15级临床医学#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16129032162179', '16129032', '体育', '2016-2017', '2', '16120', '体育教育系', '公必', '1', '36', '星期三 8-9节(1-18)每周', '1', '东校区,数据科学与计算机学院,2015级,15级软件工程（移动信息工程）#东校区,政治与公共事务管理学院,2015级,15级政治学与行政学#东校区,政治与公共事务管理学院,2015级,15级行政管理#东校区,政治与公共事务管理学院,2015级,15级公共管理类#东校区,法学院,2015级,15级法学#东校区,数据科学与计算机学院,2015级,15级保密管理#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16129032162188', '16129032', '体育', '2016-2017', '2', '16120', '体育教育系', '公必', '1', '36', '星期三 8-9节(1-18)每周', '1', '东校区,数据科学与计算机学院,2015级,15级软件工程（移动信息工程）#东校区,政治与公共事务管理学院,2015级,15级政治学与行政学#东校区,政治与公共事务管理学院,2015级,15级行政管理#东校区,政治与公共事务管理学院,2015级,15级公共管理类#东校区,法学院,2015级,15级法学#东校区,数据科学与计算机学院,2015级,15级保密管理#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162013', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期二 3-6 节/东B303（1-20 周）', '1', '15级环境工程#15级环境科学#15级交通工程#15级生物医学工程#15级能源与动力工程#15级理论与应用力学#15级新闻学#15级公共关系学#15级网络与新媒体#15级传播学（影像传播方向）#15级传播学（政务传播方向）#15级工商管理类（管理学院）#15级心理学类#15级旅游管理（与美国俄克拉荷马州立大学联合培养）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162016', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期二 3-6 节/东E201（1-20 周）', '1', '15级环境工程#15级环境科学#15级交通工程#15级生物医学工程#15级能源与动力工程#15级理论与应用力学#15级新闻学#15级公共关系学#15级网络与新媒体#15级传播学（影像传播方向）#15级传播学（政务传播方向）#15级工商管理类（管理学院）#15级心理学类#15级旅游管理（与美国俄克拉荷马州立大学联合培养）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162017', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期二 3-6 节/东B403（1-20 周）', '1', '15级环境工程#15级环境科学#15级交通工程#15级生物医学工程#15级能源与动力工程#15级理论与应用力学#15级新闻学#15级公共关系学#15级网络与新媒体#15级传播学（影像传播方向）#15级传播学（政务传播方向）#15级工商管理类（管理学院）#15级心理学类#15级旅游管理（与美国俄克拉荷马州立大学联合培养）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162020', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期二 7-10 节/东B403（1-20 周）', '1', '15级保密管理#15级软件工程#15级软件工程（国防生）#15级软件工程（移动信息工程）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162023', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期三 3-6 节/东B403（1-20 周）', '1', '15级信息管理与信息系统#15级法学#15级档案学#15级图书馆学#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162024', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期三 3-6 节/东B303（1-20 周）', '1', '15级信息管理与信息系统#15级法学#15级图书馆学#15级档案学#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162025', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期三 7-10 节/东B403（1-20 周）', '1', '15级自动化#15级通信工程#15级电子信息科学与技术#15级智能科学与技术#15级微电子科学与工程#15级光电信息科学与工程（信息显示与光电技术方向）#15级电子信息科学与技术（与香港中文大学联合培养）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('16210034162026', '16210034', '毛泽东思想和中国特色社会主义理论体系概论', '2016-2017', '2', '25000', '马克思主义学院', '公必', '6', '72', '星期三 7-10 节/东B303（1-20 周）', '1', '15级自动化#15级通信工程#15级电子信息科学与技术#15级智能科学与技术#15级微电子科学与工程#15级光电信息科学与工程（信息显示与光电技术方向）#15级电子信息科学与技术（与香港中文大学联合培养）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('17000127162001', '17000127', '纪录片实务（上）', '2016-2017', '2', '17000', '传播与设计学院', '专选', '3', '54', '星期一 3-5 节/东A306（10-18 周）,星期五 3-5 节/东A306（10-18 周）', '1', '15级新闻学#', '0', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('17000127162002', '17000127', '纪录片实务（上）', '2016-2017', '2', '17000', '传播与设计学院', '专选', '3', '54', '星期一 9-11 节/东A404（10-18 周）,星期五 9-11 节/东A404（10-18 周）', '0', '15级网络与新媒体#', '0', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('17000168162001', '17000168', '新媒体文化研究', '2016-2017', '2', '17000', '传播与设计学院', '专选', '3', '54', '星期二 9-11 节/东C303（1-18 周）', '1', '15级传播学（政务传播方向）#15级公共关系学#15级新闻学#15级网络与新媒体#15级传播学（影像传播方向）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('17000183162001', '17000183', '新闻摄影（下）', '2016-2017', '2', '17000', '传播与设计学院', '专必', '3', '54', '星期一 3-5 节：南实D101（1-18 周）', '1', '15级传播学（影像传播方向）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('17000198162001', '17000198', '人际沟通与公共演讲', '2016-2017', '2', '17000', '传播与设计学院', '专选', '2', '36', '星期三 3-5 节/东A207（13-18 周）,星期六 3-5 节/东A207（13-18 周）', '1', '15级传播学（政务传播方向）#15级公共关系学#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('17000262162001', '17000262', '纪录片实务（上）', '2016-2017', '2', '17000', '传播与设计学院', '专必', '3', '54', '星期一 9-11 节/东A404（10-18 周）,星期五 9-11 节/东A404（10-18 周）', '1', '15级传播学（影像传播方向）#', '0', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('18000000162001', '18000000', '高级汉语', '2016-2017', '2', '15000', '外国语学院', '公必', '6', '108', '星期一 8-10 节/珠海C510（1-18 周）单周,星期五 8-10 节/珠海E302（1-18 周）单周,星期一 8-10 节/珠海C510（1-18 周）双周,星期五 8-10 节/珠海E302（1-18 周）双周', '1', null, '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('20000053162001', '20000053', 'Java 语言', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '3', '72', '星期一 4-5 节/东B402（1-18 周）,星期五 8-9 节/东A505（1-18 周）', '1', '15级保密管理#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('20000097162001', '20000097', '保密督查', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '2', '36', '星期二 3-5 节/东A204（1-12 周）', '1', '15级保密管理#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('23000351162001', '23000351', '灵长类学实验', '2016-2017', '2', '23000', '社会学与人类学学院', '专选', '2', '72', '星期五 12-15 节/灵长类与人类进化室（1-20 周）', '1', '15级民族学#15级人类学#15级考古学#', '0', '0', '2017-07-22');
INSERT INTO `t_course_zsu` VALUES ('30000023162001', '30000023', '半导体器件物理', '2016-2017', '2', '74130', '物理学院', '专必', '3', '54', '星期二 3-5 节/1302（1-9 周）,星期二 3-5 节/1302（10-18 周）', '1', '14级微电子科学与工程#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('31000358162009', '31000358', '基础化学实验（有机）II', '2016-2017', '2', '31000', '化学学院', '专必', '1', '36', '星期四 8-13 节（2-10 周）双周', '1', '15级化学类,化学类15级C班#', '0', '0', '2017-07-22');
INSERT INTO `t_course_zsu` VALUES ('31000358162011', '31000358', '基础化学实验（有机）II', '2016-2017', '2', '31000', '化学学院', '专必', '1', '36', '星期三 1-8 节（2-10 周）单周', '1', '15级化学类,化学类15级F班#15级化学类,化学类15级E班#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('31000358162013', '31000358', '基础化学实验（有机）II', '2016-2017', '2', '31000', '化学学院', '专必', '1', '36', '星期三 1-8 节（2-10 周）单周', '1', '15级化学类,化学类15级E班#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('31000366162002', '31000366', '现代化学实验与技术（仪分）', '2016-2017', '2', '31000', '化学学院', '专必', '2', '72', '星期一 1-6 节：丰盛堂B座3楼（2-10 周）,星期一 1-6 节：丰盛堂B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）,星期一 1-6 节：B座3楼（2-10 周）', '1', '15级化学类,化学类15级C班#15级化学类,化学类15级D班#15级化学类,化学类15级G班#', '0', '0', '2017-07-22');
INSERT INTO `t_course_zsu` VALUES ('33101031162005', '33101031', '细胞生物学实验', '2016-2017', '2', '33000', '生命科学学院', '专必', '1', '54', '星期四 2-4 节/南院517（1-18 周）,星期四 2-4 节/南院517（1-18 周）', '1', '15级生物科学类#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('34109066162001', '34109066', '泛函分析', '2016-2017', '2', '34000', '数学学院', '专选', '3', '54', '星期一 3-5 节/艺305（1-20 周）', '1', '14级数学与应用数学,14n07010100001#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('34122584162004', '34122584', '数据结构与算法实验', '2016-2017', '2', '34000', '数学学院', '专选', '2', '36', '星期三 8-10 节：实验室201（2-18 周）双周', '1', '15级数学类,五班#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('35117629162001', '35117629', '数据结构', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '4', '90', '星期一 10-11 节/实验中心B401（1-18 周）,星期五 10-12 节/实验中心B401（1-18 周）', '1', '15级保密管理#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('38112065162001', '38112065', '大气化学', '2016-2017', '2', '74110', '大气科学学院', '专选', '3', '54', '星期四 3-5 节/东B401（1-18 周）', '1', '15级大气科学#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('38112065162002', '38112065', '大气化学', '2016-2017', '2', '74110', '大气科学学院', '专选', '3', '54', '星期四 7-9 节/东A401（1-18 周）', '1', '15级应用气象学#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('38112083162001', '38112083', '数学物理方法', '2016-2017', '2', '74110', '大气科学学院', '专必', '4', '72', '星期二 1-2 节/东B202（1-18 周）,星期四 1-2 节/东B202（1-18 周）', '1', '15级大气科学#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('40000039162002', '40000039', '高尔夫运营管理', '2016-2017', '2', '40000', '旅游学院', '专选', '2', '36', '星期二 3-5 节/珠海C303（6-16 周）', '1', '14级酒店管理（旅游学院）,俱乐部#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('40000278162001', '40000278', '研究方法（英语）', '2016-2017', '2', '40000', '旅游学院', '专必', '3', '54', '星期三 3-5 节/珠海F410（5-18 周）', '1', '15级会展经济与管理（与澳大利亚昆士兰大学联合培养）#', '0', '0', '2017-07-22');
INSERT INTO `t_course_zsu` VALUES ('40007234162001', '40007234', '商务统计学', '2016-2017', '2', '40000', '旅游学院', '专必', '3', '54', '星期五 3-5 节/珠海D201（1-18 周）', '1', '15级旅游管理类（旅游学院）,A3#15级旅游管理类（旅游学院）,A4#15级旅游管理类（旅游学院）,法国#', '0', '0', '2017-07-22');
INSERT INTO `t_course_zsu` VALUES ('46000015162001', '46000015', '计算机组成原理实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '1', '36', '星期三 1-3 节/实验中心C102（5-16 周）', '1', '15级软件工程（移动信息工程）,1501#15级软件工程（移动信息工程）,1502#15级软件工程（移动信息工程）,1503#15级软件工程（移动信息工程）,1504#15级软件工程（移动信息工程）,1505#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('46000024162001', '46000024', '操作系统设计与实现', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '2', '36', '星期四 4-5 节/东D203（1-18 周）', '1', '15级软件工程（移动信息工程）,1501#15级软件工程（移动信息工程）,1502#15级软件工程（移动信息工程）,1503#15级软件工程（移动信息工程）,1504#15级软件工程（移动信息工程）,1505#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000055162001', '46000055', '操作系统设计与实现实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '1', '36', '星期五 2-3 节/实验中心B402（1-18 周）', '1', '15级软件工程（移动信息工程）,1501#15级软件工程（移动信息工程）,1502#15级软件工程（移动信息工程）,1503#15级软件工程（移动信息工程）,1504#15级软件工程（移动信息工程）,1505#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000056162001', '46000056', '通信原理与系统', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '2', '36', '星期四 1-2 节/东D402（1-18 周）', '1', '15级软件工程（移动信息工程）,1501#15级软件工程（移动信息工程）,1502#15级软件工程（移动信息工程）,1503#15级软件工程（移动信息工程）,1504#15级软件工程（移动信息工程）,1505#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000070162001', '46000070', '数据仓库与数据挖掘', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '2', '36', '星期三 4-5 节/东C504（1-18 周）', '1', '14级软件工程（移动信息工程）#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000071162001', '46000071', '数据仓库与数据挖掘实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '1', '36', '星期三 9-10 节/实验中心B201（1-18 周）', '1', '14级软件工程（移动信息工程）#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000102162003', '46000102', '移动网络安全实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '1', '36', '星期三 4-5 节/实验中心B402（1-18 周）', '1', '14级软件工程（移动信息工程）,14M2班#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000102162004', '46000102', '移动网络安全实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '1', '36', '星期三 4-5 节/实验中心B402（1-18 周）', '0', '14级软件工程（移动信息工程）,14C1班#14级软件工程（移动信息工程）,14C2班#14级软件工程（移动信息工程）,14C3班#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000102162005', '46000102', '移动网络安全实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '1', '36', '星期三 13-14 节/实验中心B402（1-18 周）', '1', '14级软件工程（移动信息工程）,14M3班#14级软件工程（移动信息工程）,14M4班#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('46000102162006', '46000102', '移动网络安全实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '1', '36', '星期三 13-14 节/实验中心B402（1-18 周）', '0', '14级软件工程（移动信息工程）,14C1班#14级软件工程（移动信息工程）,14C2班#14级软件工程（移动信息工程）,14C3班#', '0', '0', '2017-07-21');
INSERT INTO `t_course_zsu` VALUES ('52000006162001', '52000006', '口腔内科学', '2016-2017', '2', '52000', '光华口腔医学院', '专必', '9', '208', '星期四 8-9 节/新教602（3-5 周）,星期五 8-9 节/新教602（3-5 周）,星期一 8-9 节/新教403（6 周）,星期二 8-9 节/新教403（6 周）,星期一 8-9 节/新教403（8 周）,星期一 3-4 节/新教403（8-10 周）,星期二 3-4 节/新教403（8-11 周）,星期四 8-9 节/新教602（12 周）,星期五 3-4 节/新教602（12 周）,星期一 3-4 节/新教403（13-14 周）,星期二 3-4 节/新教403（13-14 周）,星期一 3-4 节/新教403（16-17 周）,星期二 3-4 节/新教403（16-17 周）,星期二 10-11 节/新教403（17 周）', '1', '13级口腔医学,13级口腔002#13级口腔医学,13级口腔003#', '1', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('52000068162002', '52000068', '口腔组织病理学', '2016-2017', '2', '52000', '光华口腔医学院', '专必', '3', '66', '星期四 3-4 节/新教203（1-10 周）,星期四 3-4 节/新教203（12 周）,星期四 8-9 节/新教203（12 周）,星期四 3-4 节/新教203（14-16 周）,星期五 10-11 节/新教204（14-15 周）,星期一 10-11 节/新教204（16 周）', '1', '14级口腔医学（七年制）,14级口腔001#', '1', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('52000087162002', '52000087', '妇产科学', '2016-2017', '2', '52000', '光华口腔医学院', '专必', '2', '36', '星期一 10-11 节/新教204（1-6 周）,星期二 8-9 节/新教202（1-6 周）,星期二 1-2 节/新教102（11-13 周）,星期五 10-11 节/新教204（11-13 周）', '1', '14级口腔医学（七年制）,14级口腔001#', '1', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('62000091162004', '62000091', '数据库系统', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '3', '54', '星期四 9-11 节/东D202（1-18 周）', '1', '15级软件工程,教务4班#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('62000096162001', '62000096', '嵌入式操作系统', '2016-2017', '2', '67000', '数据科学与计算机学院', '专选', '3', '54', '星期一 8-10 节/实验中心B403（1-18 周）', '1', '14级软件工程(嵌入式软件与系统)#14级软件工程（国防生）#14级软件工程(通信软件)#14级软件工程(数字媒体)#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('62000100162003', '62000100', '计算机组成原理与接口技术实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '1', '36', '星期一 9-11 节/实验中心C102（5-17 周）', '1', '15级软件工程,教务3班#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('62000100162004', '62000100', '计算机组成原理与接口技术实验', '2016-2017', '2', '67000', '数据科学与计算机学院', '专必', '1', '36', '星期四 3-5 节/实验中心C102（5-17 周）', '1', '15级软件工程,教务4班#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('81000053162001', '81000053', '耳鼻喉科学', '2016-2017', '2', '52000', '光华口腔医学院', '专选', '2', '46', '星期二 3-4 节/新教504（1-6 周）,星期五 3-4 节/新教504（7-10 周）,星期二 3-4 节/新教504（8-9 周）', '1', '14级口腔医学,14级口腔002#14级口腔医学,14级口腔003#', '1', '0', '2017-07-25');
INSERT INTO `t_course_zsu` VALUES ('LS1004162005', 'LS1004', '植物学实验', '2016-2017', '2', '33000', '生命科学学院', '专必', '2', '72', '星期四 7-10 节/南院417（1-6 周）,星期四 7-10 节/南院417（1-6 周）,星期四 7-10 节/南院417（7-18 周）,星期四 7-10 节/南院417（7-12 周）,星期四 7-10 节/南院417（13-18 周）', '1', '16级生物科学#16级临床医学（八年制）-生#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('LS2044162001', 'LS2044', '普通生物学', '2016-2017', '2', '33000', '生命科学学院', '专必', '3', '54', '星期五 3-5 节/艺401（1,13 周）,星期五 3-5 节/艺401（2-4 周）,星期五 3-5 节/艺401（5-9 周）,星期五 3-5 节/艺401（10-12,14-18 周）', '1', '16级生物技术#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('LS2046162002', 'LS2046', '普通生物学实验', '2016-2017', '2', '33000', '生命科学学院', '专必', '1', '54', '星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）,星期五 12-15 节/南院101（1-18 周）', '1', '16级生物技术#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('MAR101162016', 'MAR101', '思想道德修养与法律基础', '2016-2017', '2', '25000', '马克思主义学院', '公必', '3', '54', '星期三 9-11 节/东B104（1-20 周）', '1', '16级工商管理类（管理学院）#16级电子信息类#16级微电子科学与工程#16级光电信息科学与工程（信息显示与光电技术方向）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('MAR101162017', 'MAR101', '思想道德修养与法律基础', '2016-2017', '2', '25000', '马克思主义学院', '公必', '3', '54', '星期一 3-5 节/东B104（1-20 周）', '1', '16级公共管理类#16级预防医学#16级卫生检验与检疫#16级临床医学,16级深圳临床014#16级临床医学,16级深圳临床015#16级临床医学,16级深圳临床016#16级临床医学,16级深圳临床017#16级临床医学,16级深圳临床018#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('MAR101162021', 'MAR101', '思想道德修养与法律基础', '2016-2017', '2', '25000', '马克思主义学院', '公必', '3', '54', '星期二 3-5 节/东B201（1-20 周）', '1', '16级法医学#16级基础医学#16级口腔医学#16级口腔医学（5+3）#16级药学#16级临床医学,16级临床004#16级临床医学,16级临床005#16级临床医学,16级临床006#16级临床医学,16级临床007#16级临床医学,16级临床008#16级临床医学,16级临床009#16级临床医学,16级临床010#16级临床医学,16级临床011#16级临床医学,16级临床012#16级临床医学,16级临床013#16级临床医学（国防生）#16级医学检验技术#16级康复治疗学#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('MAR102162032', 'MAR102', '中国近现代史纲要', '2016-2017', '2', '25000', '马克思主义学院', '公必', '2', '36', '星期四 4-5 节/珠海C207（1-20 周）', '1', '16级管理科学与工程类（岭南学院）#16级经济学类（岭南学院）#16级旅游管理类（旅游学院）#16级大气科学类#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('PE102162232', 'PE102', '体育', '2016-2017', '2', '16300', '体育部', '公必', '1', '36', '星期四 8-9节(1-18)每周', '1', '东校区,政治与公共事务管理学院,2016级,16级公共管理类#东校区,政治与公共事务管理学院,2016级,16级政治学与行政学#东校区,政治与公共事务管理学院,2016级,16级行政管理#东校区,传播与设计学院,2016级,16级新闻学#东校区,传播与设计学院,2016级,16级传播学#东校区,传播与设计学院,2016级,16级新闻传播学类#东校区,管理学院,2016级,16级市场营销（管理学院）#东校区,管理学院,2016级,16级会计学（管理学院英文班）#东校区,管理学院,2016级,16级工商管理类（管理学院）#东校区,管理学院,2016级,16级会计学（管理学院）#东校区,管理学院,2016级,16级工商管理（管理学院）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('PE102162233', 'PE102', '体育', '2016-2017', '2', '16300', '体育部', '公必', '1', '36', '星期四 8-9节(1-18)每周', '1', '东校区,政治与公共事务管理学院,2016级,16级公共管理类#东校区,政治与公共事务管理学院,2016级,16级政治学与行政学#东校区,政治与公共事务管理学院,2016级,16级行政管理#东校区,传播与设计学院,2016级,16级新闻学#东校区,传播与设计学院,2016级,16级传播学#东校区,传播与设计学院,2016级,16级新闻传播学类#东校区,管理学院,2016级,16级市场营销（管理学院）#东校区,管理学院,2016级,16级会计学（管理学院英文班）#东校区,管理学院,2016级,16级工商管理类（管理学院）#东校区,管理学院,2016级,16级会计学（管理学院）#东校区,管理学院,2016级,16级工商管理（管理学院）#', '0', '0', '2017-07-24');
INSERT INTO `t_course_zsu` VALUES ('PHY104162001', 'PHY104', '电磁学', '2016-2017', '2', '74130', '物理学院', '专必', '4', '72', '星期二 1-2 节/艺406（1-18 周）,星期五 4-5 节/艺406（1-18 周）', '1', '16级物理学,物理学A班#', '0', '0', '2017-07-23');
INSERT INTO `t_course_zsu` VALUES ('PHY129162001', 'PHY129', '普通物理(Ⅰ)', '2016-2017', '2', '74110', '大气科学学院', '专必', '5', '90', '星期一 9-11 节/珠海C505（1-18 周）,星期三 7-8 节/珠海C505（1-18 周）', '1', '16级大气科学类#', '0', '0', '2017-07-23');

-- ----------------------------
-- Table structure for t_listen_record_template
-- ----------------------------
DROP TABLE IF EXISTS `t_listen_record_template`;
CREATE TABLE `t_listen_record_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(400) DEFAULT NULL COMMENT '模板名称',
  `deleted` int(8) DEFAULT '0',
  `status` int(8) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `commit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_listen_record_template
-- ----------------------------
INSERT INTO `t_listen_record_template` VALUES ('1', '模板1.0', '0', null, null, null);
INSERT INTO `t_listen_record_template` VALUES ('2', 'ttt', '0', null, null, null);
INSERT INTO `t_listen_record_template` VALUES ('3', '模板3.0', '0', null, null, null);
INSERT INTO `t_listen_record_template` VALUES ('4', '模板2', '0', null, null, null);

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_order` int(11) DEFAULT NULL COMMENT '选项顺序',
  `option_content` varchar(400) DEFAULT NULL COMMENT '选项内容',
  `option_value` int(11) DEFAULT NULL COMMENT '选项值',
  `question_id` int(11) DEFAULT NULL COMMENT '问题id',
  `deleted` int(8) DEFAULT '0',
  `question_group_id` int(11) DEFAULT NULL COMMENT '问题组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES ('1', '1', '广州东校区', '1', null, '0', '1');
INSERT INTO `t_option` VALUES ('2', '2', '广州北校区', '2', null, '0', '1');
INSERT INTO `t_option` VALUES ('3', '3', '深圳校区', '3', null, '0', '1');
INSERT INTO `t_option` VALUES ('4', '4', '广州南校区', '4', null, '0', '1');
INSERT INTO `t_option` VALUES ('5', '5', '珠海校区', '5', null, '0', '1');
INSERT INTO `t_option` VALUES ('6', '1', '专业必修课', '1', null, '0', '4');
INSERT INTO `t_option` VALUES ('7', '2', '专业选修课', '2', null, '0', '4');
INSERT INTO `t_option` VALUES ('8', '3', '公共必修课', '3', null, '0', '4');
INSERT INTO `t_option` VALUES ('9', '4', '公共选修课', '4', null, '0', '4');
INSERT INTO `t_option` VALUES ('10', '1', '现场反馈', '1', null, '0', '6');
INSERT INTO `t_option` VALUES ('11', '2', '邮件反馈', '2', null, '0', '6');
INSERT INTO `t_option` VALUES ('12', '3', '暂未反馈', '3', null, '0', '6');
INSERT INTO `t_option` VALUES ('13', '4', '其他', '4', null, '0', '6');
INSERT INTO `t_option` VALUES ('15', '1', 'A', '1', '18', '0', null);
INSERT INTO `t_option` VALUES ('16', '2', 'B', '2', '18', '0', null);
INSERT INTO `t_option` VALUES ('17', '1', 'A', '1', '19', '0', null);
INSERT INTO `t_option` VALUES ('18', '2', 'B', '2', '19', '0', null);
INSERT INTO `t_option` VALUES ('19', '1', 'A', '1', '20', '0', null);
INSERT INTO `t_option` VALUES ('20', '2', 'B', '2', '20', '0', null);
INSERT INTO `t_option` VALUES ('21', '1', 'A', '1', '21', '0', null);
INSERT INTO `t_option` VALUES ('22', '2', 'B', '2', '21', '0', null);
INSERT INTO `t_option` VALUES ('23', '1', 'A', '1', '22', '0', null);
INSERT INTO `t_option` VALUES ('24', '2', 'B', '2', '22', '0', null);
INSERT INTO `t_option` VALUES ('25', '1', 'A', '1', '23', '0', null);
INSERT INTO `t_option` VALUES ('26', '2', 'B', '2', '23', '0', null);
INSERT INTO `t_option` VALUES ('27', '1', 'A', '1', '24', '0', null);
INSERT INTO `t_option` VALUES ('28', '2', 'B', '2', '24', '0', null);
INSERT INTO `t_option` VALUES ('29', '1', 'A', '1', '25', '0', null);
INSERT INTO `t_option` VALUES ('30', '2', 'B', '2', '25', '0', null);
INSERT INTO `t_option` VALUES ('31', '1', 'A', '1', '26', '0', null);
INSERT INTO `t_option` VALUES ('32', '2', 'B', '2', '26', '0', null);
INSERT INTO `t_option` VALUES ('33', '1', 'A', '1', '27', '0', null);
INSERT INTO `t_option` VALUES ('34', '2', 'B', '2', '27', '0', null);
INSERT INTO `t_option` VALUES ('35', '1', 'A', '1', '28', '0', null);
INSERT INTO `t_option` VALUES ('36', '2', 'B', '2', '28', '0', null);
INSERT INTO `t_option` VALUES ('37', '1', 'A', '1', '29', '0', null);
INSERT INTO `t_option` VALUES ('38', '2', 'B', '2', '29', '0', null);
INSERT INTO `t_option` VALUES ('39', '1', 'A', '1', '30', '0', null);
INSERT INTO `t_option` VALUES ('40', '2', 'B', '2', '30', '0', null);
INSERT INTO `t_option` VALUES ('52', '1', 'xxxx', '1', null, '0', '23');
INSERT INTO `t_option` VALUES ('53', '2', 'xxxx', '2', null, '0', '23');
INSERT INTO `t_option` VALUES ('54', '3', 'xxxx', '3', null, '0', '23');
INSERT INTO `t_option` VALUES ('55', '4', 'xxxx', '4', null, '0', '23');
INSERT INTO `t_option` VALUES ('184', '1', 'RRRR', '1', '71', '0', null);
INSERT INTO `t_option` VALUES ('185', '2', 'RRRR', '2', '71', '0', null);
INSERT INTO `t_option` VALUES ('186', '3', 'RRRR', '3', '71', '0', null);
INSERT INTO `t_option` VALUES ('187', '4', 'RRRR', '4', '71', '0', null);
INSERT INTO `t_option` VALUES ('188', '1', 'RRRR', '1', '72', '0', null);
INSERT INTO `t_option` VALUES ('189', '2', 'RRRR', '2', '72', '0', null);
INSERT INTO `t_option` VALUES ('190', '3', 'RRRR', '3', '72', '0', null);
INSERT INTO `t_option` VALUES ('191', '4', 'RRRR', '4', '72', '0', null);
INSERT INTO `t_option` VALUES ('192', '1', 'RRRR', '1', '73', '0', null);
INSERT INTO `t_option` VALUES ('193', '2', 'RRRR', '2', '73', '0', null);
INSERT INTO `t_option` VALUES ('194', '3', 'RRRR', '3', '73', '0', null);
INSERT INTO `t_option` VALUES ('195', '4', 'RRRR', '4', '73', '0', null);
INSERT INTO `t_option` VALUES ('196', '1', 'RRRR', '1', '74', '0', null);
INSERT INTO `t_option` VALUES ('197', '2', 'RRRR', '2', '74', '0', null);
INSERT INTO `t_option` VALUES ('198', '3', 'RRRR', '3', '74', '0', null);
INSERT INTO `t_option` VALUES ('199', '4', 'RRRR', '4', '74', '0', null);
INSERT INTO `t_option` VALUES ('200', '1', 'RRRR', '1', '75', '0', null);
INSERT INTO `t_option` VALUES ('201', '2', 'RRRR', '2', '75', '0', null);
INSERT INTO `t_option` VALUES ('202', '3', 'RRRR', '3', '75', '0', null);
INSERT INTO `t_option` VALUES ('203', '4', 'RRRR', '4', '75', '0', null);
INSERT INTO `t_option` VALUES ('204', '1', 'RRRR', '1', '76', '0', null);
INSERT INTO `t_option` VALUES ('205', '2', 'RRRR', '2', '76', '0', null);
INSERT INTO `t_option` VALUES ('206', '3', 'RRRR', '3', '76', '0', null);
INSERT INTO `t_option` VALUES ('207', '4', 'RRRR', '4', '76', '0', null);
INSERT INTO `t_option` VALUES ('208', '1', 'RRRR', '1', '77', '0', null);
INSERT INTO `t_option` VALUES ('209', '2', 'RRRR', '2', '77', '0', null);
INSERT INTO `t_option` VALUES ('210', '3', 'RRRR', '3', '77', '0', null);
INSERT INTO `t_option` VALUES ('211', '4', 'RRRR', '4', '77', '0', null);
INSERT INTO `t_option` VALUES ('212', '1', 'RRRR', '1', '78', '0', null);
INSERT INTO `t_option` VALUES ('213', '2', 'RRRR', '2', '78', '0', null);
INSERT INTO `t_option` VALUES ('214', '3', 'RRRR', '3', '78', '0', null);
INSERT INTO `t_option` VALUES ('215', '4', 'RRRR', '4', '78', '0', null);
INSERT INTO `t_option` VALUES ('216', '1', 'RRRR', '1', '79', '0', null);
INSERT INTO `t_option` VALUES ('217', '2', 'RRRR', '2', '79', '0', null);
INSERT INTO `t_option` VALUES ('218', '3', 'RRRR', '3', '79', '0', null);
INSERT INTO `t_option` VALUES ('219', '4', 'RRRR', '4', '79', '0', null);
INSERT INTO `t_option` VALUES ('220', '1', 'RRRR', '1', '80', '0', null);
INSERT INTO `t_option` VALUES ('221', '2', 'RRRR', '2', '80', '0', null);
INSERT INTO `t_option` VALUES ('222', '3', 'RRRR', '3', '80', '0', null);
INSERT INTO `t_option` VALUES ('223', '4', 'RRRR', '4', '80', '0', null);
INSERT INTO `t_option` VALUES ('224', '1', 'RRRR', '1', '81', '0', null);
INSERT INTO `t_option` VALUES ('225', '2', 'RRRR', '2', '81', '0', null);
INSERT INTO `t_option` VALUES ('226', '3', 'RRRR', '3', '81', '0', null);
INSERT INTO `t_option` VALUES ('227', '4', 'RRRR', '4', '81', '0', null);
INSERT INTO `t_option` VALUES ('228', '1', 'RRRR', '1', '82', '0', null);
INSERT INTO `t_option` VALUES ('229', '2', 'RRRR', '2', '82', '0', null);
INSERT INTO `t_option` VALUES ('230', '3', 'RRRR', '3', '82', '0', null);
INSERT INTO `t_option` VALUES ('231', '4', 'RRRR', '4', '82', '0', null);
INSERT INTO `t_option` VALUES ('232', '1', 'RRRR', '1', '83', '0', null);
INSERT INTO `t_option` VALUES ('233', '2', 'RRRR', '2', '83', '0', null);
INSERT INTO `t_option` VALUES ('234', '3', 'RRRR', '3', '83', '0', null);
INSERT INTO `t_option` VALUES ('235', '4', 'RRRR', '4', '83', '0', null);
INSERT INTO `t_option` VALUES ('236', '1', 'RRRR', '1', '84', '0', null);
INSERT INTO `t_option` VALUES ('237', '2', 'RRRR', '2', '84', '0', null);
INSERT INTO `t_option` VALUES ('238', '3', 'RRRR', '3', '84', '0', null);
INSERT INTO `t_option` VALUES ('239', '4', 'RRRR', '4', '84', '0', null);
INSERT INTO `t_option` VALUES ('240', '1', 'RRRR', '1', '85', '0', null);
INSERT INTO `t_option` VALUES ('241', '2', 'RRRR', '2', '85', '0', null);
INSERT INTO `t_option` VALUES ('242', '3', 'RRRR', '3', '85', '0', null);
INSERT INTO `t_option` VALUES ('243', '4', 'RRRR', '4', '85', '0', null);
INSERT INTO `t_option` VALUES ('244', '1', 'RRRR', '1', '86', '0', null);
INSERT INTO `t_option` VALUES ('245', '2', 'RRRR', '2', '86', '0', null);
INSERT INTO `t_option` VALUES ('246', '3', 'RRRR', '3', '86', '0', null);
INSERT INTO `t_option` VALUES ('247', '4', 'RRRR', '4', '86', '0', null);
INSERT INTO `t_option` VALUES ('248', '1', '星期一', '1', '4', '0', null);
INSERT INTO `t_option` VALUES ('249', '2', '星期二', '2', '4', '0', null);
INSERT INTO `t_option` VALUES ('250', '3', '星期三', '3', '4', '0', null);
INSERT INTO `t_option` VALUES ('251', '4', '星期四', '4', '4', '0', null);
INSERT INTO `t_option` VALUES ('252', '5', '星期五', '5', '4', '0', null);

-- ----------------------------
-- Table structure for t_payment_info
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_info`;
CREATE TABLE `t_payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_record_id` int(11) DEFAULT NULL COMMENT '记录表id',
  `listen_allowance` decimal(44,0) DEFAULT NULL COMMENT '听课津贴',
  `remote_city_allowance` decimal(44,0) DEFAULT NULL COMMENT '异城市津贴',
  `supervisor_allowance` decimal(44,0) DEFAULT NULL COMMENT '督导津贴',
  `groupLeader_allowance` decimal(44,0) DEFAULT NULL COMMENT '督导组长津贴',
  `other_allowance` decimal(44,0) DEFAULT NULL COMMENT '其他津贴',
  `total_allowance` decimal(44,0) DEFAULT NULL COMMENT '津贴合计',
  `deleted` int(8) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `remote_campus_allowance` decimal(44,0) DEFAULT NULL COMMENT '异校园津贴',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_payment_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_person_info_zsu
-- ----------------------------
DROP TABLE IF EXISTS `t_person_info_zsu`;
CREATE TABLE `t_person_info_zsu` (
  `ZGH` varchar(100) NOT NULL COMMENT '职工号',
  `XM` varchar(255) DEFAULT NULL COMMENT '姓名',
  `DWH` int(255) DEFAULT NULL COMMENT '单位号',
  `DW` varchar(255) DEFAULT NULL COMMENT '单位',
  `XIAOQUM` int(255) DEFAULT NULL COMMENT '校区码',
  `XIAOQU` varchar(255) DEFAULT NULL COMMENT '校区',
  `LXRQ` datetime DEFAULT NULL COMMENT '来校日期',
  `ZGLXM` int(255) DEFAULT NULL COMMENT '职工类型码',
  `ZGLX` varchar(255) DEFAULT NULL COMMENT '职工类型',
  `BZLBM` int(255) DEFAULT NULL COMMENT '编制类别码',
  `BZLB` varchar(255) DEFAULT NULL COMMENT '编制类别',
  `RYZTM` int(255) DEFAULT NULL COMMENT '人员状态码',
  `RYZT` varchar(4) DEFAULT NULL COMMENT '人员状态',
  `DELETEFLAG` int(4) DEFAULT NULL COMMENT '删除标记',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`ZGH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person_info_zsu
-- ----------------------------
INSERT INTO `t_person_info_zsu` VALUES ('001013H', '黄文高', '80000', '附属第一医院（第一临床学院）', null, null, '1994-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001020H', '陈玲', '80000', '附属第一医院（第一临床学院）', null, null, '1994-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001026H', '张宇', '80000', '附属第一医院（第一临床学院）', null, null, '1994-12-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001052H', '钟德霞', '80000', '附属第一医院（第一临床学院）', null, null, '1996-04-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001053H', '罗小平', '80000', '附属第一医院（第一临床学院）', null, null, '1996-04-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001063H', '李玉秀', '80000', '附属第一医院（第一临床学院）', null, null, '1996-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001080H', '肖云', '80000', '附属第一医院（第一临床学院）', null, null, '1997-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001085H', '黄铣明', '80000', '附属第一医院（第一临床学院）', null, null, '1997-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001088H', '夏冬梅', '80000', '附属第一医院（第一临床学院）', null, null, '1997-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001089H', '谢小晴', '80000', '附属第一医院（第一临床学院）', null, null, '1997-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001094H', '黄海月', '80000', '附属第一医院（第一临床学院）', null, null, '1997-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001107H', '李雪坚', '80000', '附属第一医院（第一临床学院）', null, null, '1998-03-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001128H', '卢伟', '80000', '附属第一医院（第一临床学院）', null, null, '1998-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001138H', '黄妃文', '80000', '附属第一医院（第一临床学院）', null, null, '1998-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001140H', '黄月友', '80000', '附属第一医院（第一临床学院）', null, null, '1998-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001146H', '容钻芬', '80000', '附属第一医院（第一临床学院）', null, null, '1998-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001154H', '莫彩珍', '80000', '附属第一医院（第一临床学院）', null, null, '1998-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001169H', '陈伟真', '80000', '附属第一医院（第一临床学院）', null, null, '1999-08-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001185H', '叶红杏', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001186H', '李雪梅', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001187H', '冼金惠', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001191H', '何小凤', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001194H', '叶辉莉', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001195H', '杨桂梅', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001196H', '彭小英', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001197H', '郭燕霞', '80000', '附属第一医院（第一临床学院）', null, null, '1999-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001218H', '白利平', '80000', '附属第一医院（第一临床学院）', null, null, '2000-02-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001219H', '黄月娣', '80000', '附属第一医院（第一临床学院）', null, null, '2000-02-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001224H', '李尚琴', '80000', '附属第一医院（第一临床学院）', null, null, '2000-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001227H', '黄建国', '80000', '附属第一医院（第一临床学院）', null, null, '2000-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001230H', '陈正宏', '80000', '附属第一医院（第一临床学院）', null, null, '2000-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001238H', '罗丽芬', '80000', '附属第一医院（第一临床学院）', null, null, '2000-12-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001255H', '廖丹', '80000', '附属第一医院（第一临床学院）', null, null, '2001-09-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001259H', '范红英', '80000', '附属第一医院（第一临床学院）', null, null, '2001-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001261H', '杨秋亮', '80000', '附属第一医院（第一临床学院）', null, null, '2001-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001276H', '林莲', '80000', '附属第一医院（第一临床学院）', null, null, '2002-03-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001317H', '罗海莲', '80000', '附属第一医院（第一临床学院）', null, null, '2003-03-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001322H', '胡秋香', '80000', '附属第一医院（第一临床学院）', null, null, '2003-03-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001332H', '徐俊', '80000', '附属第一医院（第一临床学院）', null, null, '2003-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001333H', '方丽璇', '80000', '附属第一医院（第一临床学院）', null, null, '2003-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001353H', '陆丹华', '80000', '附属第一医院（第一临床学院）', null, null, '2003-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001360H', '宁丽冰', '80000', '附属第一医院（第一临床学院）', null, null, '2003-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001364H', '芮丽涵', '80000', '附属第一医院（第一临床学院）', null, null, '2003-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001382H', '邓佩仪', '80000', '附属第一医院（第一临床学院）', null, null, '2004-01-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001383H', '杨京燕', '80000', '附属第一医院（第一临床学院）', null, null, '2004-01-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001415H', '谢英俊', '80000', '附属第一医院（第一临床学院）', null, null, '2004-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001421H', '王钰琦', '80000', '附属第一医院（第一临床学院）', null, null, '2004-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001426H', '徐碧金', '80000', '附属第一医院（第一临床学院）', null, null, '2004-12-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001428H', '吴晓篁', '80000', '附属第一医院（第一临床学院）', null, null, '2004-12-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001441H', '曾巧玲', '80000', '附属第一医院（第一临床学院）', null, null, '2004-12-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001466H', '李艳兰', '80000', '附属第一医院（第一临床学院）', null, null, '2005-02-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001521H', '赵江莉', '80000', '附属第一医院（第一临床学院）', null, null, '2005-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001535H', '杨薇', '80000', '附属第一医院（第一临床学院）', null, null, '2006-02-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001560H', '林惠嫦', '80000', '附属第一医院（第一临床学院）', null, null, '2006-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001568H', '邹菲菲', '80000', '附属第一医院（第一临床学院）', null, null, '2006-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001572H', '冯艳莲', '80000', '附属第一医院（第一临床学院）', null, null, '2006-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001585H', '王巧玲', '80000', '附属第一医院（第一临床学院）', null, null, '2006-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001662H', '曾云菲', '80000', '附属第一医院（第一临床学院）', null, null, '2007-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001686H', '戴巧艳', '80000', '附属第一医院（第一临床学院）', null, null, '2007-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001727H', '陈思玮', '80000', '附属第一医院（第一临床学院）', null, null, '2007-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001743H', '吴海燕', '80000', '附属第一医院（第一临床学院）', null, null, '2007-07-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001760H', '朱晓璐', '80000', '附属第一医院（第一临床学院）', null, null, '2007-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001771H', '黄瑕清', '80000', '附属第一医院（第一临床学院）', null, null, '2008-01-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('001786H', '吕惠芳', '80000', '附属第一医院（第一临床学院）', null, null, '2008-06-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('002142', '隋淑珍', '81000', '孙逸仙纪念医院', '1', '南校区', '1986-01-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '4', '退休', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('004199', '叶克难', '33000', '生命科学学院', '1', '南校区', '1988-07-01 00:00:00', '11', '事业编制人员', '11', '教学类', '1', '在校', '0', '2017-07-21 15:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('006027', '梁承勇', '3100', '教务部', '1', '南校区', '1996-07-01 00:00:00', '11', '事业编制人员', '121', '党政管理类', '1', '在校', '0', '2017-07-20 16:07:53');
INSERT INTO `t_person_info_zsu` VALUES ('011114', '林桂平', '81000', '孙逸仙纪念医院', '2', '北校区', '1995-07-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011131H', '缪妙玲', '80000', '附属第一医院（第一临床学院）', null, null, '2010-07-12 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011137H', '李穗琪', '80000', '附属第一医院（第一临床学院）', null, null, '2010-07-16 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011155H', '白莉洁', '80000', '附属第一医院（第一临床学院）', null, null, '2010-11-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011180H', '陆智珊', '80000', '附属第一医院（第一临床学院）', null, null, '2011-03-07 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011203H', '马诗婷', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011209H', '魏珠', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011210H', '陈琼芳', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011214H', '刘外娇', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011246H', '段丽丽', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011270H', '杨翠', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011351H', '王俊芝', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011373H', '周雅丽', '80000', '附属第一医院（第一临床学院）', null, null, '2011-07-11 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011409H', '冯育虹', '80000', '附属第一医院（第一临床学院）', null, null, '2012-02-14 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('011501H', '胡恩锦', '80000', '附属第一医院（第一临床学院）', null, null, '2002-07-29 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('017025', '黄冰', '83000', '中山眼科中心', '2', '北校区', '1983-07-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('020003', '刘燕君', '81000', '孙逸仙纪念医院', '1', '南校区', '2002-02-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('040035', '王嘉蔚', '83000', '中山眼科中心', '2', '北校区', '2002-12-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046002', '冯春霞', '89000', '附属第五医院（珠海医院）（第五临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046007', '吴江雪', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046010', '谢建民', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046013', '胡安斌', '80000', '附属第一医院（第一临床学院）', null, null, '2004-07-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046017', '李涛', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046018', '张俊萍', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046024', '胡震', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046025', '王昭', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046026', '白爱平', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046029', '罗璐', '81000', '孙逸仙纪念医院', null, null, '2004-08-26 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046034', '姜桔红', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046035', '曾令启', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046036', '唐启彬', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046044', '赵宗刚', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046052', '李鸿立', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046054', '张孝文', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046055', '玄绪军', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046057', '张琪', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046059', '包维民', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046063', '李俊石', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046064', '申本昌', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046069', '张伟', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046072', '裴兆辉', '80000', '附属第一医院（第一临床学院）', null, null, '2004-10-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046074', '宋革', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046075', '姜鸿彦', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046076', '凌士奇', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046077', '刘斌', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046079', '袁静', '2061', '干细胞与组织工程研究中心', null, null, null, '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('046081', '邵筱', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046083', '李德', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046086', '李明', '80000', '附属第一医院（第一临床学院）', null, null, '2004-12-21 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046089', '朱林', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046090', '何美霞', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('046095', '徐亚林', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('056006', '张海宁', '83000', '中山眼科中心', null, null, '2005-02-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('056007', '符淳', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('056012', '梅雀林', '80000', '附属第一医院（第一临床学院）', null, null, '2005-04-01 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('056013', '李宝金', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:53');
INSERT INTO `t_person_info_zsu` VALUES ('056018', '叶建明', '80000', '附属第一医院（第一临床学院）', null, null, '2005-03-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056020', '唐爱发', '82000', '附属第三医院（第三临床学院）', null, null, '2005-03-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056021', '郭新', '82000', '附属第三医院（第三临床学院）', null, null, '2005-03-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056023', '余刚', '80000', '附属第一医院（第一临床学院）', null, null, '2005-04-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056024', '王碧飞', '80000', '附属第一医院（第一临床学院）', null, null, '2005-04-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056026', '方天翎', '82000', '附属第三医院（第三临床学院）', null, null, '2005-03-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056032', '魏亚明', '81000', '孙逸仙纪念医院', null, null, '2005-06-02 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056033', '郅敏', '80000', '附属第一医院（第一临床学院）', null, null, '2005-05-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056037', '李俊', '81000', '孙逸仙纪念医院', null, null, '2005-05-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056039', '颜笑健', '84000', '肿瘤防治中心', null, null, '2005-07-12 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056041', '张刚庆', '82000', '附属第三医院（第三临床学院）', null, null, '2005-08-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056044', '朱志华', '84000', '肿瘤防治中心', null, null, '2005-07-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056050', '孙明', '81000', '孙逸仙纪念医院', null, null, '2005-09-02 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056052', '郁时兵', '81000', '孙逸仙纪念医院', null, null, '2005-09-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056057', '黄勇', '82000', '附属第三医院（第三临床学院）', null, null, '2006-03-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056058', '梁华', '82000', '附属第三医院（第三临床学院）', null, null, '2005-06-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056060', '熊俊', '80000', '附属第一医院（第一临床学院）', null, null, '2007-09-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056064', '陈香', '80000', '附属第一医院（第一临床学院）', null, null, '2005-09-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056066', '宋海峰', '84000', '肿瘤防治中心', null, null, '2005-09-02 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056072', '刘永轶', '81000', '孙逸仙纪念医院', null, null, '2005-08-14 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056079', '余利红', '2061', '干细胞与组织工程研究中心', null, null, '2005-08-30 00:00:00', '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('056081', '熊江', '80000', '附属第一医院（第一临床学院）', null, null, '2005-09-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056088', '查云飞', '80000', '附属第一医院（第一临床学院）', null, null, '2005-10-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056089', '王忠东', '87000', '附属口腔医院', null, null, '2005-10-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056092', '朱海鹏', '82000', '附属第三医院（第三临床学院）', null, null, '2005-10-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056093', '张炎', '82000', '附属第三医院（第三临床学院）', null, null, '2005-10-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056099', '项凤梅', '82000', '附属第三医院（第三临床学院）', null, null, '2005-11-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056100', '张岳峰', '82000', '附属第三医院（第三临床学院）', null, null, '2005-08-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056102', '吕文天', '82000', '附属第三医院（第三临床学院）', null, null, '2005-10-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056103', '俞建雄', '82000', '附属第三医院（第三临床学院）', null, null, '2005-12-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056104', '袁霞', '84000', '肿瘤防治中心', null, null, '2006-01-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('056110', '达明绪', '81000', '孙逸仙纪念医院', null, null, '2006-02-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('060020', '孔祥复', '84000', '肿瘤防治中心', null, null, '2006-10-08 00:00:00', '21', '固定编制（附属医院）', '11', '教学类', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066002', '汤志华', '81000', '孙逸仙纪念医院', null, null, '2006-02-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066010', '蒙荣森', '80000', '附属第一医院（第一临床学院）', null, null, '2006-04-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066011', '张阳', '80000', '附属第一医院（第一临床学院）', null, null, '2006-04-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066012', '罗刚', '82000', '附属第三医院（第三临床学院）', null, null, '2006-04-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066013', '潘春华', '84000', '肿瘤防治中心', null, null, '2006-04-14 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066016', '夏秀琼', '82000', '附属第三医院（第三临床学院）', null, null, '2006-04-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066017', '张三元', '81000', '孙逸仙纪念医院', null, null, '2006-04-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066019', '孙健鸣', '80000', '附属第一医院（第一临床学院）', null, null, '2006-06-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066020', '周金林', '84000', '肿瘤防治中心', null, null, '2006-07-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066021', '宋炎成', '82000', '附属第三医院（第三临床学院）', null, null, '2006-07-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066022', '曹俊霞', '84000', '肿瘤防治中心', null, null, '2006-07-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066023', '刘炜', '82000', '附属第三医院（第三临床学院）', null, null, '2006-07-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066024', '谷爱娣', '84000', '肿瘤防治中心', null, null, '2006-07-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066025', '李秋霞', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066026', '伍庄', '82000', '附属第三医院（第三临床学院）', null, null, '2006-07-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066035', '陈文捷', '82000', '附属第三医院（第三临床学院）', null, null, '2006-09-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066036', '刘莉', '84000', '肿瘤防治中心', null, null, '2006-08-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066037', '代志琰', '82000', '附属第三医院（第三临床学院）', null, null, '2006-07-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066040', '王青松', '83000', '中山眼科中心', null, null, '2006-10-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066042', '马保锋', '2061', '干细胞与组织工程研究中心', null, null, '2006-10-17 00:00:00', '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('066043', '李辽源', '82000', '附属第三医院（第三临床学院）', null, null, '2006-10-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066044', '谭真', '80000', '附属第一医院（第一临床学院）', null, null, '2006-10-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066047', '冯善伟', '2061', '干细胞与组织工程研究中心', null, null, '2006-10-23 00:00:00', '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('066049', '傅新晖', '80000', '附属第一医院（第一临床学院）', null, null, '2006-10-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066055', '梁新军', '81000', '孙逸仙纪念医院', null, null, '2006-10-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066056', '吴维光', '81000', '孙逸仙纪念医院', null, null, '2006-10-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066059', '岳伟英', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066061', '刘新生', '81000', '孙逸仙纪念医院', null, null, '2006-11-21 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066062', '唐宽晓', '80000', '附属第一医院（第一临床学院）', null, null, '2006-11-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066064', '詹林达', '80000', '附属第一医院（第一临床学院）', null, null, '2006-11-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066066', '陈天宇', '82000', '附属第三医院（第三临床学院）', null, null, '2006-12-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066067', '何伟', '84000', '肿瘤防治中心', null, null, '2006-12-05 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066068', '潘科', '84000', '肿瘤防治中心', null, null, '2006-12-06 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066069', '刘颖', '83000', '中山眼科中心', null, null, '2006-12-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066070', '庄志强', '81000', '孙逸仙纪念医院', null, null, '2006-12-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('066074', '张春玉', '84000', '肿瘤防治中心', null, null, '2006-12-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('070117', '周吉梅', '5060', '学报编辑部(期刊中心)', '3', '珠海校区', '2007-07-04 00:00:00', '11', '事业编制人员', '11', '教学类', '1', '在校', '0', '2017-07-20 16:07:54');
INSERT INTO `t_person_info_zsu` VALUES ('076002', '董家军', '84000', '肿瘤防治中心', null, null, '2007-01-11 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076009', '邓海霞', '81000', '孙逸仙纪念医院', null, null, '2007-03-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076010', '李刚', '84000', '肿瘤防治中心', null, null, '2007-03-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076011', '任亚琳', '83000', '中山眼科中心', null, null, '2007-03-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076012', '梁道臣', '80000', '附属第一医院（第一临床学院）', null, null, '2007-04-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076014', '贝锦新', '84000', '肿瘤防治中心', null, null, '2007-05-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076015', '赵红莉', '81000', '孙逸仙纪念医院', null, null, '2007-05-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076016', '黄江波', '81000', '孙逸仙纪念医院', null, null, '2007-05-01 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076028', '丁远杰', '84000', '肿瘤防治中心', null, null, '2007-07-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076035', '谭浩翔', '80000', '附属第一医院（第一临床学院）', null, null, '2007-08-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076045', '肖兰', '82000', '附属第三医院（第三临床学院）', null, null, '2007-09-06 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076055', '李琰', '82000', '附属第三医院（第三临床学院）', null, null, '2007-10-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076057', '任萌', '81000', '孙逸仙纪念医院', null, null, '2007-10-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076062', '台卫平', '80000', '附属第一医院（第一临床学院）', null, null, '2007-11-12 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076064', '张洪涛', '82000', '附属第三医院（第三临床学院）', null, null, '2007-11-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('076069', '张晓东', '80000', '附属第一医院（第一临床学院）', null, null, '2007-12-06 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('080060', '吕兰海', '87000', '附属口腔医院', '2', '北校区', '2008-05-15 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086006', '王文军', '81000', '孙逸仙纪念医院', null, null, '2008-01-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086008', '杨旭辉', '2061', '干细胞与组织工程研究中心', null, null, '2008-01-24 00:00:00', '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('086043', '杨孜欢', '88000', '附属第六医院', null, null, '2008-07-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086053', '周清明', '84000', '肿瘤防治中心', null, null, '2008-07-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086059', '柯建浩', '80000', '附属第一医院（第一临床学院）', null, null, '2008-08-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086062', '黄保丁', '80000', '附属第一医院（第一临床学院）', null, null, '2008-08-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086065', '陶然', '84000', '肿瘤防治中心', null, null, '2008-09-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086070', '周天保', '82000', '附属第三医院（第三临床学院）', null, null, '2008-09-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086072', '谭兵', '80000', '附属第一医院（第一临床学院）', null, null, '2008-09-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086076', '周瑾', '83000', '中山眼科中心', null, null, '2008-10-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086078', '杨浩贤', '84000', '肿瘤防治中心', null, null, '2008-10-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086082', '李飞', '80000', '附属第一医院（第一临床学院）', null, null, '2008-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086083', '王尧', '80000', '附属第一医院（第一临床学院）', null, null, '2008-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086084', '郑轶群', '82000', '附属第三医院（第三临床学院）', null, null, '2008-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086085', '练光辉', '80000', '附属第一医院（第一临床学院）', null, null, '2008-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086088', '樊冤桥', '80000', '附属第一医院（第一临床学院）', null, null, '2008-10-29 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086093', '曹晓敏', '81000', '孙逸仙纪念医院', null, null, '2008-11-06 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086098', '姜立', '84000', '肿瘤防治中心', null, null, '2008-11-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086100', '张彬', '84000', '肿瘤防治中心', null, null, '2008-11-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086101', '李胜活', '81000', '孙逸仙纪念医院', null, null, '2008-11-21 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086105', '刘中华', '80000', '附属第一医院（第一临床学院）', null, null, '2008-12-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086106', '武金宝', '81000', '孙逸仙纪念医院', null, null, '2008-12-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('086108', '张在其', '81000', '孙逸仙纪念医院', null, null, '2008-12-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('090059', '魏誉民', '83000', '中山眼科中心', '2', '北校区', '2009-03-01 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('090084', '刘佳', '5120', '发展规划办公室', '2', '北校区', '2004-07-01 00:00:00', '11', '事业编制人员', '121', '党政管理类', '1', '在校', '0', '2017-07-20 16:17:54');
INSERT INTO `t_person_info_zsu` VALUES ('096003', '余术宜', '87000', '附属口腔医院', null, null, '2009-02-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096011', '宋奎', '84000', '肿瘤防治中心', null, null, '2009-03-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096014', '陈华云', '80000', '附属第一医院（第一临床学院）', null, null, '2009-03-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096015', '邹毅', '84000', '肿瘤防治中心', null, null, '2009-03-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096019', '朱宝和', '80000', '附属第一医院（第一临床学院）', null, null, '2009-05-14 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096029', '陈丁生', '80000', '附属第一医院（第一临床学院）', null, null, '2009-07-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096047', '李伟强', '2061', '干细胞与组织工程研究中心', null, null, '2009-07-03 00:00:00', '13', '博士后', '15', '科研类', '2', '离校', '0', '2017-07-20 17:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('096048', '武征', '83000', '中山眼科中心', null, null, '2009-07-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096061', '谢军', '82000', '附属第三医院（第三临床学院）', null, null, '2009-07-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096064', '雷鸣', '81000', '孙逸仙纪念医院', null, null, '2009-07-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096065', '胡海燕', '81000', '孙逸仙纪念医院', null, null, '2009-07-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096072', '陈梦飞', '83000', '中山眼科中心', null, null, '2009-09-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096087', '林玲', '81000', '孙逸仙纪念医院', null, null, '2009-09-11 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096090', '刁志宏', '82000', '附属第三医院（第三临床学院）', null, null, '2009-11-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096092', '孙艳香', '80000', '附属第一医院（第一临床学院）', null, null, '2009-10-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096093', '赵成毅', '80000', '附属第一医院（第一临床学院）', null, null, '2009-10-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096096', '杨昂', '80000', '附属第一医院（第一临床学院）', null, null, '2009-10-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096098', '徐钧', '80000', '附属第一医院（第一临床学院）', null, null, '2009-10-26 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('096101', '丁童', '84000', '肿瘤防治中心', null, null, '2009-10-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('100086', '梁海含', '76170', '海洋工程与技术学院', null, null, '2010-03-16 00:00:00', '11', '事业编制人员', '121', '党政管理类', '1', '在校', '0', '2017-07-20 15:57:54');
INSERT INTO `t_person_info_zsu` VALUES ('106003', '谢治', '81000', '孙逸仙纪念医院', null, null, '2010-01-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106017', '覃海德', '84000', '肿瘤防治中心', null, null, '2010-05-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106018', '冯亚玲', '82000', '附属第三医院（第三临床学院）', null, null, '2010-05-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106046', '刘晖', '84000', '肿瘤防治中心', null, null, '2010-08-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106050', '李丹丹', '84000', '肿瘤防治中心', null, null, '2010-08-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106054', '赖芬菊', '84000', '肿瘤防治中心', null, null, '2010-08-27 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106057', '徐祖敏', '84000', '肿瘤防治中心', null, null, '2010-08-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106065', '李建平', '87000', '附属口腔医院', null, null, '2010-09-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106069', '汪宗保', '80000', '附属第一医院（第一临床学院）', null, null, '2010-10-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106071', '谢婵', '82000', '附属第三医院（第三临床学院）', null, null, '2010-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106076', '李乃洋', '83000', '中山眼科中心', null, null, '2010-11-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('106083', '蔡柏岑', '80000', '附属第一医院（第一临床学院）', null, null, '2010-12-09 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116001', '张晶晶', '84000', '肿瘤防治中心', null, null, '2011-01-05 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116009', '王红亮', '80000', '附属第一医院（第一临床学院）', null, null, '2011-02-24 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116016', '李健', '84000', '肿瘤防治中心', null, null, '2011-05-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116020', '费志强', '81000', '孙逸仙纪念医院', '2', '北校区', '2011-07-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116025', '王洪波', '84000', '肿瘤防治中心', null, null, '2011-07-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116029', '刘利平', '84000', '肿瘤防治中心', null, null, '2011-07-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116051', '张志毅', '84000', '肿瘤防治中心', null, null, '2011-12-12 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116052', '陈刚', '80000', '附属第一医院（第一临床学院）', null, null, '2011-12-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('116056', '韩洪瀛', '82000', '附属第三医院（第三临床学院）', null, null, '2011-12-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('120172', '黎彪', '76150', '电子与通信工程学院', '4', '东校区', '2012-07-04 00:00:00', '11', '事业编制人员', '121', '党政管理类', '1', '在校', '0', '2017-07-21 11:07:54');
INSERT INTO `t_person_info_zsu` VALUES ('121225H', '宋俊珉', '80000', '附属第一医院（第一临床学院）', null, null, '2012-07-03 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('121226H', '翁泰煜', '80000', '附属第一医院（第一临床学院）', null, null, '2012-07-03 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('121227H', '陈坚', '80000', '附属第一医院（第一临床学院）', null, null, '2012-07-03 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('121323H', '任自然', '80000', '附属第一医院（第一临床学院）', null, null, '2012-07-09 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('121460H', '黄渝清', '80000', '附属第一医院（第一临床学院）', null, null, '2012-07-16 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('121476H', '吴菲佳', '80000', '附属第一医院（第一临床学院）', null, null, '2012-08-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('122103H', '唐恬恬', '81000', '孙逸仙纪念医院', null, null, '2012-07-16 00:00:00', '21', '固定编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126008', '杨光', '84000', '肿瘤防治中心', null, null, '2012-01-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126020', '高树梓', '82000', '附属第三医院（第三临床学院）', null, null, '2012-03-05 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126022', '郭宇', '82000', '附属第三医院（第三临床学院）', null, null, '2012-03-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126029', '周焕城', '81000', '孙逸仙纪念医院', null, null, '2012-04-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126033', '王科', '82000', '附属第三医院（第三临床学院）', null, null, '2012-05-17 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126043', '颜静', '84000', '肿瘤防治中心', null, null, '2012-07-05 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126052', '刘珍银', '84000', '肿瘤防治中心', null, null, '2012-07-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126060', '张敏', '82000', '附属第三医院（第三临床学院）', null, null, '2012-08-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126065', '杨潇', '80000', '附属第一医院（第一临床学院）', null, null, '2012-08-29 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126068', '孙月丽', '84000', '肿瘤防治中心', null, null, '2012-08-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126071', '唐海林', '84000', '肿瘤防治中心', null, null, '2012-08-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126073', '童忠春', '87000', '附属口腔医院', null, null, '2012-08-29 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126080', '花文峰', '84000', '肿瘤防治中心', null, null, '2012-09-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126081', '庄宝雄', '81000', '孙逸仙纪念医院', null, null, '2012-09-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126083', '舒涛', '82000', '附属第三医院（第三临床学院）', null, null, '2012-10-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126084', '朱玉亮', '84000', '肿瘤防治中心', null, null, '2012-10-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126092', '蔡毅', '82000', '附属第三医院（第三临床学院）', null, null, '2012-10-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126095', '郑志兴', '84000', '肿瘤防治中心', null, null, '2012-10-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126101', '卢奎', '80000', '附属第一医院（第一临床学院）', null, null, '2012-11-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126102', '周治宇', '80000', '附属第一医院（第一临床学院）', null, null, '2012-11-15 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126103', '王家传', '80000', '附属第一医院（第一临床学院）', null, null, '2012-11-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126104', '朱艳霞', '80000', '附属第一医院（第一临床学院）', null, null, '2012-11-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126108', '李月', '84000', '肿瘤防治中心', null, null, '2012-12-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126111', '高东', '84000', '肿瘤防治中心', null, null, '2012-12-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('126112', '梁慧英', '81000', '孙逸仙纪念医院', null, null, '2012-12-03 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('129264', '周端咏', '84000', '肿瘤防治中心', '2', '北校区', '2012-10-01 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('129265', '王忍', '84000', '肿瘤防治中心', '2', '北校区', '2012-10-01 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:54');
INSERT INTO `t_person_info_zsu` VALUES ('130189', '钟华', '76190', '生物医学工程学院', '2', '北校区', '2013-07-01 00:00:00', '11', '事业编制人员', '121', '党政管理类', '1', '在校', '0', '2017-07-21 08:17:55');
INSERT INTO `t_person_info_zsu` VALUES ('136013', 'Suthakaran P', '82000', '附属第三医院（第三临床学院）', null, null, '2013-01-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136017', '王博', '81000', '孙逸仙纪念医院', null, null, '2013-02-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136023', '朱江', '84000', '肿瘤防治中心', null, null, '2013-04-08 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136025', '孔祥斌', '83000', '中山眼科中心', null, null, '2013-04-11 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136031', '潘运宝', '81000', '孙逸仙纪念医院', null, null, '2013-04-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136040', '王林', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136041', '扈慧静', '80000', '附属第一医院（第一临床学院）', null, null, '2013-06-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136046', '何重华', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136053', '李丽', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136056', '贺静', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136058', '唐建军', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136060', '桂安萍', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136061', '杨婷', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136068', '钟克波', '80000', '附属第一医院（第一临床学院）', null, null, '2013-08-13 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136073', '冯国开', '84000', '肿瘤防治中心', '2', '北校区', null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136101', '王迎雪', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136102', '刘真权', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136109', '高宁宁', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136113', '刘晓萍', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136117', '陈家杰', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136118', '马华娟', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136120', '贾昌昌', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136122', '李丽萍', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136124', '支慧', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136125', '廖红兴', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136128', '尹晴', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136129', '唐妍', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136137', '陈振宇', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136138', '李付贵', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136141', '张建华', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('136153', '林楚勇', '84000', '肿瘤防治中心', null, null, '2013-12-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('141645', '黄紫房', '80000', '附属第一医院（第一临床学院）', null, null, '2014-11-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('145801', '陈一辰', '87000', '附属口腔医院', null, null, '2014-08-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('145802', '黎伟杰', '87000', '附属口腔医院', null, null, '2014-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146002', '张妍', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146016', '邓裕华', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146017', '徐臻', '83000', '中山眼科中心', null, null, '2014-04-04 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146021', '高明慧', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146023', '汪海燕', '82000', '附属第三医院（第三临床学院）', null, null, '2014-05-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146027', '谭维格', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146030', '王春宝', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146035', '张志毅', '84000', '肿瘤防治中心', null, null, '2014-07-02 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146043', '鞠怀强', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146044', '王晓坤', '84000', '肿瘤防治中心', null, null, '2014-07-25 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146045', '张伟', '81000', '孙逸仙纪念医院', null, null, '2014-07-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146046', '廖丹', '84000', '肿瘤防治中心', null, null, '2014-07-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146047', '崔庆彬', '84000', '肿瘤防治中心', null, null, '2014-07-21 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146049', '吴文超', '84000', '肿瘤防治中心', null, null, '2014-07-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146050', '陈琪', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146069', '易诗白', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146073', '张华', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146080', '卢彦', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146088', '盖作启', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146089', '谢尚潜', '83000', '中山眼科中心', null, null, '2014-09-02 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146091', '崔艳梅', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146097', '方智新', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146098', '熊浩岚', '80000', '附属第一医院（第一临床学院）', null, null, '2014-09-18 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146099', '夏冰清', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146101', '朱正凯', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146103', '刘俊秀', '80000', '附属第一医院（第一临床学院）', null, null, '2014-09-18 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146104', '李中庭', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146113', '秦毅', '81000', '孙逸仙纪念医院', null, null, '2014-09-23 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146115', '向青锋', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146126', '魏灯辉', '84000', '肿瘤防治中心', null, null, '2014-10-22 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146128', '李跃进', '84000', '肿瘤防治中心', null, null, '2014-10-28 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146138', '陈伟', '84000', '肿瘤防治中心', null, null, '2014-10-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146142', '陈欣', '84000', '肿瘤防治中心', null, null, '2014-11-19 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146143', 'LO WAI LEUNG', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146145', '黄紫房', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146148', '左晓宇', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('146157', '周庆', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('149174', '丘鹏翔', '84000', '肿瘤防治中心', '2', '北校区', '2014-07-23 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('149175', '王秋月', '84000', '肿瘤防治中心', '2', '北校区', '2014-07-23 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156010', '倪新强', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156012', '王国新', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156018', '张望', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156022', '付顺军', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156024', 'Christophe Glorieux', '84000', '肿瘤防治中心', null, null, '2015-06-08 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156045', '黄飞娟', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156052', '吴海涛', '82000', '附属第三医院（第三临床学院）', null, null, '2015-05-18 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156057', '王海云', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156065', '王宏伟', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156066', '胡文艳', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156067', '肖刚', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156074', '王科峰', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156075', '宋德寿', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156100', '蒋威', '85000', '附属肿瘤医院（第七临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156107', 'Ravichandran Senthilkumar', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156113', '王秀敏', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156114', '程琳', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156121', '陈巍', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156122', '罗可望', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156143', '李新春', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156144', '刘晓霞', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156156', '胡连鑫', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156157', '董良', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156158', '林帆', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156160', '林志锐', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156162', '邱学成', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156164', '郑立胜', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156165', '陈子翔', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156166', '刘翠翠', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156180', '张炜', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156189', '陈晓瑜', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156201', '郭允苗', '84000', '肿瘤防治中心', null, null, '2015-10-09 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156202', '赵炳春', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156203', '李成林', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156204', '林钊宇', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156205', '黄亚强', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156209', '夏燕', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156213', '林小提', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156215', '平苏宁', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156216', '刘启颂', '81000', '孙逸仙纪念医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156218', '王李莉', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156220', '朱瑜龄', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156221', '王乐旬', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156223', 'Nemai Saha', '85000', '附属肿瘤医院（第七临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156229', '姚永超', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156231', '欧铜', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156233', '温秀云', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156234', '程林', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156244', '熊红莲', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156245', '杨雪松', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156246', '陈丽', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156247', '王文静', '80000', '附属第一医院（第一临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156248', '李卓', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156252', '王能', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156257', '赵华福', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156264', '钟伟枫', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156272', '何洁琼', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156274', '冯谦谨', '84000', '肿瘤防治中心', null, null, '2015-12-16 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156281', '简文静', '82000', '附属第三医院（第三临床学院）', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156284', '张虹', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('156287', '李伟', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('159054', '刘道路', '84000', '肿瘤防治中心', '2', '北校区', '2015-07-01 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('159055', '陈焯彬', '84000', '肿瘤防治中心', null, null, '2015-07-01 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '99', '待审核', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166009', '黄兰兰', '88000', '附属第六医院', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166010', '王经满', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166016', '路岸瑞', '84000', '肿瘤防治中心', null, null, null, '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166030', '张艳玲', '84000', '肿瘤防治中心', null, null, '2016-03-18 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166035', '谭嘉琦', '81000', '孙逸仙纪念医院', null, null, '2016-03-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166039', '黄叶飞', '82000', '附属第三医院（第三临床学院）', null, null, '2016-04-01 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166046', '张晓', '84000', '肿瘤防治中心', null, null, '2016-03-31 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166047', '侯国良', '84000', '肿瘤防治中心', null, null, '2016-05-11 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166048', '饶春宝', '80000', '附属第一医院（第一临床学院）', null, null, '2016-04-07 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166052', '高文杰', '80000', '附属第一医院（第一临床学院）', null, null, '2016-05-20 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166054', '胡倩', '84000', '肿瘤防治中心', null, null, '2016-05-27 00:00:00', '25', '博士后（附属医院）', '15', '科研类', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166055', '梁振浩', '84000', '肿瘤防治中心', null, null, '2016-05-10 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166060', '詹晓勇', '80000', '附属第一医院（第一临床学院）', null, null, '2016-06-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166063', '谢池楚', '82000', '附属第三医院（第三临床学院）', null, null, '2016-05-30 00:00:00', '25', '博士后（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166064', 'paul william bib', '83000', '中山眼科中心', null, null, null, '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166072', '陈思齐', '84000', '肿瘤防治中心', null, null, '2016-06-17 00:00:00', '25', '博士后（附属医院）', null, null, '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166076', '卢金昌', '80000', '附属第一医院（第一临床学院）', null, null, '2016-10-10 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166077', '王鑫', '84000', '肿瘤防治中心', null, null, '2016-06-24 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166087', '王晨媛', '84000', '肿瘤防治中心', null, null, '2016-07-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166088', '任栋', '80000', '附属第一医院（第一临床学院）', null, null, '2016-07-12 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166089', '孟繁钢', '80000', '附属第一医院（第一临床学院）', null, null, '2016-06-29 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166090', '林彩霞', '80000', '附属第一医院（第一临床学院）', null, null, '2016-06-30 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166091', '翟二涛', '80000', '附属第一医院（第一临床学院）', null, null, '2016-07-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166099', '张金栋', '84000', '肿瘤防治中心', null, null, '2016-07-11 00:00:00', '25', '博士后（附属医院）', null, null, '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166124', '高文超', '82000', '附属第三医院（第三临床学院）', null, null, '2016-07-29 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166125', '刘丽曼', '80000', '附属第一医院（第一临床学院）', null, null, '2016-07-28 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166131', '王忍', '84000', '肿瘤防治中心', null, null, '2016-07-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166133', '王子宁', '84000', '肿瘤防治中心', null, null, '2016-07-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166144', '赵德志', '84000', '肿瘤防治中心', null, null, '2016-08-03 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166145', '蒋帅', '84000', '肿瘤防治中心', null, null, '2016-08-29 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166146', '田京钰', '84000', '肿瘤防治中心', null, null, '2016-08-29 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166147', '李金庆', '84000', '肿瘤防治中心', null, null, '2016-08-30 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166152', '文小凤', '83000', '中山眼科中心', null, null, '2016-08-29 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166172', '杜则澎', '81000', '孙逸仙纪念医院', null, null, '2016-09-06 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166175', '马梦君', '81000', '孙逸仙纪念医院', null, null, '2016-09-12 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166176', '陆艺文', '81000', '孙逸仙纪念医院', null, null, '2016-09-13 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166178', '郑周英', '80000', '附属第一医院（第一临床学院）', null, null, '2016-09-14 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166179', '张春阳', '80000', '附属第一医院（第一临床学院）', null, null, '2016-09-14 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166180', '张桓熙', '80000', '附属第一医院（第一临床学院）', null, null, '2016-09-13 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166181', '李希芮', '80000', '附属第一医院（第一临床学院）', null, null, '2016-09-13 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166182', '陈洋', '84000', '肿瘤防治中心', null, null, '2016-09-19 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166183', '王熵', '84000', '肿瘤防治中心', null, null, '2016-09-22 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166196', '李凯', '88000', '附属第六医院', null, null, '2016-09-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166197', '赵齐', '84000', '肿瘤防治中心', null, null, '2016-09-18 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166212', '向橦', '84000', '肿瘤防治中心', null, null, '2016-09-20 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166230', '韩凯', '84000', '肿瘤防治中心', null, null, '2016-09-23 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166231', '辛爽', '84000', '肿瘤防治中心', null, null, '2016-11-07 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166238', '谭海', '83000', '中山眼科中心', null, null, '2016-10-12 00:00:00', '25', '博士后（附属医院）', null, null, '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166262', '殷沛宏', '80000', '附属第一医院（第一临床学院）', null, null, '2016-11-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166263', '刘莉', '84000', '肿瘤防治中心', null, null, '2016-10-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166264', '黄莎莎', '80000', '附属第一医院（第一临床学院）', null, null, '2016-11-07 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166265', '苏家豪', '82000', '附属第三医院（第三临床学院）', null, null, '2016-11-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166270', '刘惠娇', '80000', '附属第一医院（第一临床学院）', null, null, '2016-11-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166271', '刘静', '84000', '肿瘤防治中心', null, null, '2016-11-10 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166282', '安娜', '82000', '附属第三医院（第三临床学院）', null, null, '2016-11-15 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166285', '缪蕾', '84000', '肿瘤防治中心', null, null, '2016-11-23 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166286', '高峰', '81000', '孙逸仙纪念医院', null, null, '2016-11-25 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166295', '陈荣元', '83000', '中山眼科中心', null, null, '2016-12-15 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166296', '闫凤侠', '80000', '附属第一医院（第一临床学院）', null, null, '2016-12-30 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166298', '石茂华', '80000', '附属第一医院（第一临床学院）', null, null, '2016-12-15 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166299', '龚雪屹', '80000', '附属第一医院（第一临床学院）', null, null, '2016-12-19 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166302', '温创宇', '88000', '附属第六医院', '2', '北校区', '2016-12-26 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166303', 'MUHAMMAD KAMRAN', '84000', '肿瘤防治中心', null, null, '2017-06-01 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166307', '王雨洁', '80000', '附属第一医院（第一临床学院）', null, null, '2016-12-23 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166308', '向青锋', '84000', '肿瘤防治中心', null, null, '2016-12-21 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('166312', '康银峰', '84000', '肿瘤防治中心', null, null, '2016-12-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('167635', '路静', '36000', '药学院', '4', '东校区', '2017-07-03 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('168178', '谢剑刚', '67000', '数据科学与计算机学院', '4', '东校区', '2017-07-01 00:00:00', '14', '合同聘用人员（合同工）', '15', '科研类', '1', '在校', '0', '2017-07-20 21:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('169010', '梁文芊', '84000', '肿瘤防治中心', '2', '北校区', '2016-02-17 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('169051', '王艳艳', '84000', '肿瘤防治中心', '2', '北校区', '2016-04-05 00:00:00', '22', '流动编制（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('170038', '陈绍晴', '38000', '环境科学与工程学院', '1', '南校区', '2017-07-20 00:00:00', '11', '事业编制人员', '11', '教学类', '1', '在校', '0', '2017-07-24 16:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('170118', '陶建杰', '17000', '传播与设计学院', '4', '东校区', '2017-07-24 00:00:00', '11', '事业编制人员', '11', '教学类', '1', '在校', '0', '2017-07-24 16:27:54');
INSERT INTO `t_person_info_zsu` VALUES ('170153', '李凤臣', '45000', '中法核工程与技术学院', '3', '珠海校区', '2017-06-30 00:00:00', '11', '事业编制人员', '11', '教学类', '99', '待审核', '0', '2017-07-24 10:57:56');
INSERT INTO `t_person_info_zsu` VALUES ('170156', '朱庭顺', '31000', '化学学院', null, null, null, null, null, null, null, null, null, '0', '2017-07-20 16:57:55');
INSERT INTO `t_person_info_zsu` VALUES ('170345', '李春梅', '59000', '医学院', '5', null, '2017-06-30 00:00:00', '11', '事业编制人员', '11', '教学类', '99', '待审核', '0', '2017-07-25 12:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('170346', '邰忠智', '2160', '科学研究院', '1', '南校区', '2017-07-13 00:00:00', '11', '事业编制人员', '11', '教学类', '1', '在校', '0', '2017-07-20 15:47:57');
INSERT INTO `t_person_info_zsu` VALUES ('175506', '陈秋雯', '87000', '附属口腔医院', null, null, '2017-07-17 00:00:00', '21', '固定编制（附属医院）', null, null, '1', '在校', '0', '2017-07-18 17:27:58');
INSERT INTO `t_person_info_zsu` VALUES ('175611', '唐璇', '87000', '附属口腔医院', null, null, '2017-07-17 00:00:00', '22', '流动编制（附属医院）', null, null, '1', '在校', '0', '2017-07-18 17:27:58');
INSERT INTO `t_person_info_zsu` VALUES ('175615', '樊灿灿', '87000', '附属口腔医院', null, null, '2017-07-18 00:00:00', '22', '流动编制（附属医院）', null, null, '1', '在校', '0', '2017-07-18 17:27:58');
INSERT INTO `t_person_info_zsu` VALUES ('176012', '陈佩贤', '81000', '孙逸仙纪念医院', null, null, '2017-02-17 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176013', '符荣党', '82000', '附属第三医院（第三临床学院）', null, null, '2017-02-17 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176015', '蔡静', '84000', '肿瘤防治中心', null, null, '2017-02-21 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176018', '赵铎', '80000', '附属第一医院（第一临床学院）', null, null, '2017-02-27 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176025', '叶树标', '88000', '附属第六医院', null, null, '2017-04-14 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176034', '陈青云', '84000', '肿瘤防治中心', null, null, '2017-05-18 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176039', '宋健', '80000', '附属第一医院（第一临床学院）', null, null, '2017-03-20 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176040', '潘昱名', '82000', '附属第三医院（第三临床学院）', null, null, '2017-03-17 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176041', '徐艳雯', '84000', '肿瘤防治中心', null, null, '2017-03-17 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176050', '管玉涛', '81000', '孙逸仙纪念医院', null, null, '2017-04-25 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176056', '王俊峰', '84000', '肿瘤防治中心', null, null, '2017-05-03 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176057', '魏奭', '84000', '肿瘤防治中心', null, null, '2017-05-03 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176058', '李媛', '84000', '肿瘤防治中心', null, null, '2017-05-03 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176064', '王婷', '81000', '孙逸仙纪念医院', null, null, '2017-07-04 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176065', '周海松', '80000', '附属第一医院（第一临床学院）', null, null, '2017-06-13 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176071', '孙悦奇', '80000', '附属第一医院（第一临床学院）', null, null, '2017-07-03 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176072', '李智丽', '81000', '孙逸仙纪念医院', null, null, '2017-06-28 00:00:00', '25', '博士后（附属医院）', null, null, '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176073', '唐楠', '83000', '中山眼科中心', '2', '北校区', '2017-06-29 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-24 16:27:54');
INSERT INTO `t_person_info_zsu` VALUES ('176074', '刘少卿', '84000', '肿瘤防治中心', null, null, '2017-07-11 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176076', '苏小虎', '33000', '生命科学学院', null, null, '2017-07-21 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-21 11:17:56');
INSERT INTO `t_person_info_zsu` VALUES ('176078', '郭森', '31000', '化学学院', null, null, '2017-07-25 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-25 09:27:54');
INSERT INTO `t_person_info_zsu` VALUES ('176079', '田平阁', '80000', '附属第一医院（第一临床学院）', null, null, '2017-07-07 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176080', '范晶', '84000', '肿瘤防治中心', null, null, '2017-07-06 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176081', '马英新', '84000', '肿瘤防治中心', null, null, '2017-07-11 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176084', '刘威', '9060', '港澳珠江三角洲研究中心（基地）', null, null, '2017-07-17 00:00:00', '13', '博士后', null, null, '1', '在校', '0', '2017-07-20 09:18:00');
INSERT INTO `t_person_info_zsu` VALUES ('176085', '廖静', '33000', '生命科学学院', null, null, '2017-07-19 00:00:00', '13', '博士后', null, null, '1', '在校', '0', '2017-07-25 11:27:57');
INSERT INTO `t_person_info_zsu` VALUES ('176086', '叶丽平', '84000', '肿瘤防治中心', null, null, '2017-07-13 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176087', '何斌', '84000', '肿瘤防治中心', null, null, '2017-07-13 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176088', '李雷', '84000', '肿瘤防治中心', null, null, '2017-07-12 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176094', '张曦亚', '33000', '生命科学学院', null, null, '2017-07-20 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-20 09:47:57');
INSERT INTO `t_person_info_zsu` VALUES ('176098', '张胤鸣', '50000', '中山医学院', null, null, '2017-07-17 00:00:00', '13', '博士后', null, null, '1', '在校', '0', '2017-07-19 08:57:58');
INSERT INTO `t_person_info_zsu` VALUES ('176099', '张小然', '50000', '中山医学院', null, null, '2017-07-14 00:00:00', '13', '博士后', null, null, '1', '在校', '0', '2017-07-19 08:57:58');
INSERT INTO `t_person_info_zsu` VALUES ('176101', '方成', '84000', '肿瘤防治中心', null, null, '2017-07-14 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176102', '刘树强', '84000', '肿瘤防治中心', null, null, '2017-07-17 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176103', '何晶晶', '84000', '肿瘤防治中心', null, null, '2017-07-14 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176107', '徐绍华', '33000', '生命科学学院', null, null, '2017-07-20 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-20 15:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('176108', '王洋', '32110', '地球科学与工程学院', null, null, '2017-07-19 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-19 16:07:56');
INSERT INTO `t_person_info_zsu` VALUES ('176109', '陈龑骢', '31000', '化学学院', null, null, '2017-07-25 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-25 15:57:55');
INSERT INTO `t_person_info_zsu` VALUES ('176110', '胡佩珊', '84000', '肿瘤防治中心', null, null, '2017-07-21 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176111', '奚美君', '9060', '港澳珠江三角洲研究中心（基地）', null, null, '2017-07-20 00:00:00', '13', '博士后', null, null, '1', '在校', '0', '2017-07-24 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176112', '叶田田', '23000', '社会学与人类学学院', null, null, '2017-07-25 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-25 11:07:55');
INSERT INTO `t_person_info_zsu` VALUES ('176114', '赵康宁', '33000', '生命科学学院', null, null, '2017-07-20 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-20 15:47:57');
INSERT INTO `t_person_info_zsu` VALUES ('176116', '林铎儒', '83000', '中山眼科中心', '2', '北校区', '2017-07-20 00:00:00', '25', '博士后（附属医院）', null, null, '99', '待审核', '0', '2017-07-24 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('176118', '张续勐', '33000', '生命科学学院', null, null, '2017-07-20 00:00:00', '13', '博士后', null, null, '99', '待审核', '0', '2017-07-20 14:07:56');
INSERT INTO `t_person_info_zsu` VALUES ('176119', '测试', '2020', '人力资源管理处', null, null, null, null, null, null, null, null, null, '1', '2017-07-20 16:57:55');
INSERT INTO `t_person_info_zsu` VALUES ('177056', '唐晓文', '36000', '药学院', '4', '东校区', '2017-07-03 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177066', '李柳暗', '76120', '电子与信息工程学院', '4', '东校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-25 15:47:55');
INSERT INTO `t_person_info_zsu` VALUES ('177081', '孙烨', '21000', '国际翻译学院', '3', '珠海校区', '2017-07-11 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177098', '王琳', '41000', '国际金融学院', '3', '珠海校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 21:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('177107', '聂嘉明', '74120', '数学学院（珠海）', '3', '珠海校区', '2017-07-19 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177133', '郑娟', '31000', '化学学院', '1', '南校区', '2017-07-03 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177183', '徐宇航', '72130', '中国语言文学系（珠海）', '3', '珠海校区', '2017-07-19 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 21:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('177184', '张伟', '72130', '中国语言文学系（珠海）', '3', '珠海校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-22 13:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('177188', '洪晓纯', '72130', '中国语言文学系（珠海）', '3', '珠海校区', '2017-07-04 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177213', '郭宇菲', '15000', '外国语学院', '1', '南校区', '2017-07-01 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-24 16:27:54');
INSERT INTO `t_person_info_zsu` VALUES ('177215', '边武', '71000', '物理与天文学院', '3', '珠海校区', '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177247', '沈明华', '67000', '数据科学与计算机学院', '4', '东校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177255', '李军', '59000', '医学院', '5', null, '2017-07-19 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177266', '谭一洺', '37000', '地理科学与规划学院', '1', '南校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177269', '郝永超', '31000', '化学学院', '1', '南校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177276', '袁日荣', '74120', '数学学院（珠海）', '3', '珠海校区', '2017-07-07 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-25 10:07:55');
INSERT INTO `t_person_info_zsu` VALUES ('177277', '李昱帆', '74120', '数学学院（珠海）', '3', '珠海校区', '2017-07-10 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177313', '胡远浪', '50000', '中山医学院', '2', '北校区', '2017-07-12 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177324', '李庭绵', '72110', '哲学系（珠海）', '3', '珠海校区', '2017-07-19 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177335', '杨静', '29000', '材料科学与工程学院', '4', '东校区', '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-20 09:27:57');
INSERT INTO `t_person_info_zsu` VALUES ('177336', '唐亦汉', '37000', '地理科学与规划学院', '1', '南校区', '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177338', '许晓聪', '37000', '地理科学与规划学院', '1', '南校区', '2017-07-11 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177342', '刘疆平', '31000', '化学学院', '1', '南校区', '2017-07-10 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177346', '李晓慧', '34000', '数学学院', '1', '南校区', '2017-07-19 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177351', '孟山水', '36000', '药学院', '4', '东校区', '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177354', '王志仁', '36000', '药学院', '4', '东校区', '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177355', '鞠英辰', '36000', '药学院', '4', '东校区', '2017-07-04 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177358', '冯伟', '75110', '药学院（深圳）', '5', null, '2017-07-17 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-20 22:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('177359', '王进美', '75110', '药学院（深圳）', '5', null, '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177363', '邢帆', '59000', '医学院', '5', null, '2017-07-06 00:00:00', '16', '专职科研系列人员', '15', '科研类', '1', '在校', '0', '2017-07-24 15:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('177367', '卢笑予', '11100', '中国语言文学系', '1', '南校区', '2017-07-18 00:00:00', '16', '专职科研系列人员', '15', '科研类', '99', '待审核', '0', '2017-07-20 10:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('177375', '林浩彬', '11200', '历史学系', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-21 14:07:56');
INSERT INTO `t_person_info_zsu` VALUES ('177389', '叶毅均', '72120', '历史学系（珠海）', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-21 11:47:57');
INSERT INTO `t_person_info_zsu` VALUES ('177405', '祝青', '42000', '海洋科学学院', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-19 15:17:57');
INSERT INTO `t_person_info_zsu` VALUES ('177406', '张亚锋', '42000', '海洋科学学院', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-20 19:47:55');
INSERT INTO `t_person_info_zsu` VALUES ('177415', '阮宝玉', '72120', '历史学系（珠海）', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-20 20:07:56');
INSERT INTO `t_person_info_zsu` VALUES ('177419', '陈军', '15000', '外国语学院', null, null, null, null, null, null, null, '1', '在校', '0', '2017-07-21 17:07:55');
INSERT INTO `t_person_info_zsu` VALUES ('178044', '刘志聪', '67000', '数据科学与计算机学院', '4', '东校区', '2017-07-12 00:00:00', '14', '合同聘用人员（合同工）', '14', '工勤类', '1', '在校', '0', '2017-07-20 16:27:55');
INSERT INTO `t_person_info_zsu` VALUES ('178045', '廖子菊', '67000', '数据科学与计算机学院', '4', '东校区', '2017-07-01 00:00:00', '14', '合同聘用人员（合同工）', '15', '科研类', '99', '待审核', '0', '2017-07-20 18:07:57');
INSERT INTO `t_person_info_zsu` VALUES ('179052', '曾捷', '2510', '基建处', '1', '南校区', null, '12', '合同聘用人员（B系列）', '131', '实验工程类', '1', '在校', '0', '2017-07-20 21:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('179062', '韩文静', '36000', '药学院', '4', '东校区', null, '12', '合同聘用人员（B系列）', '131', '实验工程类', '1', '在校', '0', '2017-07-24 15:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('179084', '谢家俊', '33000', '生命科学学院', null, null, null, null, null, null, null, null, null, '0', '2017-07-19 08:48:01');
INSERT INTO `t_person_info_zsu` VALUES ('179085', '李冰', '50000', '中山医学院', null, null, null, null, null, null, null, null, null, '0', '2017-07-19 08:57:58');
INSERT INTO `t_person_info_zsu` VALUES ('179086', '王超', '50000', '中山医学院', null, null, null, null, null, null, null, null, null, '0', '2017-07-19 08:57:58');
INSERT INTO `t_person_info_zsu` VALUES ('179087', '王永君', '39000', '工学院', '4', '东校区', '2017-07-01 00:00:00', '12', '合同聘用人员（B系列）', '15', '科研类', '99', '待审核', '0', '2017-07-25 10:27:56');
INSERT INTO `t_person_info_zsu` VALUES ('179088', '徐梁', '38000', '环境科学与工程学院', '4', '东校区', '2017-07-01 00:00:00', '12', '合同聘用人员（B系列）', '15', '科研类', '99', '待审核', '0', '2017-07-21 12:57:55');
INSERT INTO `t_person_info_zsu` VALUES ('179089', '吴婷婷', '50000', '中山医学院', null, null, null, null, null, null, null, null, null, '0', '2017-07-19 09:57:56');
INSERT INTO `t_person_info_zsu` VALUES ('179090', '杨洋', '9060', '港澳珠江三角洲研究中心（基地）', null, null, '2017-07-18 00:00:00', '12', '合同聘用人员（B系列）', '15', '科研类', '99', '待审核', '0', '2017-07-19 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('179413', 'Craig James Manton', '15000', '外国语学院', '1', '南校区', '2017-09-01 00:00:00', '12', '合同聘用人员（B系列）', '11', '教学类', '99', '待审核', '0', '2017-07-24 17:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('179414', 'Florent Dubreuil', '15000', '外国语学院', '1', '南校区', '2017-09-01 00:00:00', '12', '合同聘用人员（B系列）', '11', '教学类', '99', '待审核', '0', '2017-07-24 17:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('179415', 'Surinder Mohan Soond', '15000', '外国语学院', '1', '南校区', '2017-09-01 00:00:00', '12', '合同聘用人员（B系列）', '11', '教学类', '99', '待审核', '0', '2017-07-24 17:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('179416', 'Dominik Andre Gerland', '15000', '外国语学院', '1', '南校区', '2017-09-01 00:00:00', '12', '合同聘用人员（B系列）', '11', '教学类', '99', '待审核', '0', '2017-07-24 16:47:56');
INSERT INTO `t_person_info_zsu` VALUES ('721158', '黎榕', '81000', '孙逸仙纪念医院', null, null, '2012-09-06 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('721159', '黎颖维', '81000', '孙逸仙纪念医院', null, null, '2012-07-30 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('721160', '张育玲', '81000', '孙逸仙纪念医院', null, null, '2008-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('721161', '张燕娜', '81000', '孙逸仙纪念医院', null, null, '2008-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('721162', '张雪琼', '81000', '孙逸仙纪念医院', null, null, '2008-10-01 00:00:00', '23', '合同工（附属医院）', '4', '附属单位', '1', '在校', '0', '2017-07-21 16:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('721824', '吴小风', '81000', '孙逸仙纪念医院', null, null, null, '23', '合同工（附属医院）', '4', '附属单位', '2', '离校', '0', '2017-07-23 11:37:55');
INSERT INTO `t_person_info_zsu` VALUES ('724265', '朱明君', '81000', '孙逸仙纪念医院', null, null, '2016-11-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724276', '肖华宇', '81000', '孙逸仙纪念医院', null, null, '2016-12-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724277', '梁芳晓', '81000', '孙逸仙纪念医院', null, null, '2016-12-12 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724278', '刘明珠', '81000', '孙逸仙纪念医院', null, null, '2016-12-12 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724279', '陈绍健', '81000', '孙逸仙纪念医院', null, null, '2016-12-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724280', '邓军', '81000', '孙逸仙纪念医院', null, null, '2016-12-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724319', '黎敏瑜', '81000', '孙逸仙纪念医院', null, null, '2017-01-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724321', '陈小佳', '81000', '孙逸仙纪念医院', null, null, '2017-01-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724322', '杨伟雄', '81000', '孙逸仙纪念医院', null, null, '2017-01-24 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724323', '朱玉叶', '81000', '孙逸仙纪念医院', null, null, '2017-02-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724325', '马正根', '81000', '孙逸仙纪念医院', null, null, '2017-02-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724329', '罗群', '81000', '孙逸仙纪念医院', null, null, '2017-02-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724330', '陈瑾', '81000', '孙逸仙纪念医院', null, null, '2017-02-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724331', '柏萍', '81000', '孙逸仙纪念医院', null, null, '2017-02-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724332', '陈颖筠', '81000', '孙逸仙纪念医院', null, null, '2017-02-07 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724333', '何奇柳', '81000', '孙逸仙纪念医院', null, null, '2017-02-09 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724445', '王永强', '81000', '孙逸仙纪念医院', null, null, '2017-02-13 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724446', '胡小欣', '81000', '孙逸仙纪念医院', null, null, '2017-02-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724447', '张锐浩', '81000', '孙逸仙纪念医院', null, null, '2017-02-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724448', '何寿富', '81000', '孙逸仙纪念医院', null, null, '2017-02-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724449', '刘静', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724451', '柏伟彬', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724452', '陈红梅', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724453', '李秋玲', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724454', '杨少璇', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724455', '杨超婷', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724456', '吴湘波', '81000', '孙逸仙纪念医院', null, null, '2017-03-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724457', '欧伟锋', '81000', '孙逸仙纪念医院', null, null, '2017-03-07 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724458', '张小草', '81000', '孙逸仙纪念医院', null, null, '2017-03-09 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724459', '何慧敏', '81000', '孙逸仙纪念医院', null, null, '2017-03-13 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724460', '吴秀云', '81000', '孙逸仙纪念医院', null, null, '2017-03-14 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:56');
INSERT INTO `t_person_info_zsu` VALUES ('724461', '魏华贵', '81000', '孙逸仙纪念医院', null, null, '2017-03-14 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724462', '叶馨琳', '81000', '孙逸仙纪念医院', null, null, '2017-03-16 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724463', '王婷', '81000', '孙逸仙纪念医院', null, null, '2017-03-16 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724464', '陈卫芳', '81000', '孙逸仙纪念医院', null, null, '2017-04-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724465', '曾月霞', '81000', '孙逸仙纪念医院', null, null, '2017-04-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724466', '杨少豪', '81000', '孙逸仙纪念医院', null, null, '2017-04-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724467', '廖荣煌', '81000', '孙逸仙纪念医院', null, null, '2017-04-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724468', '董世健', '81000', '孙逸仙纪念医院', null, null, '2017-04-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724470', '刘春霞', '81000', '孙逸仙纪念医院', null, null, '2017-04-11 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724471', '陈秋连', '81000', '孙逸仙纪念医院', null, null, '2017-04-17 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724472', '叶夏明', '81000', '孙逸仙纪念医院', null, null, '2017-05-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724473', '曹芝梅', '81000', '孙逸仙纪念医院', null, null, '2017-04-18 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724474', '余天祥', '81000', '孙逸仙纪念医院', null, null, '2017-04-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724475', '麦嘉仪', '81000', '孙逸仙纪念医院', null, null, '2017-04-24 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724476', '华芳群', '81000', '孙逸仙纪念医院', null, null, '2017-05-02 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724477', '梁燕琼', '81000', '孙逸仙纪念医院', null, null, '2017-05-02 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724479', '陈丽丹', '81000', '孙逸仙纪念医院', null, null, '2017-05-02 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724480', '廖蓓', '81000', '孙逸仙纪念医院', null, null, '2017-05-02 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724481', '曾胜强', '81000', '孙逸仙纪念医院', null, null, '2017-05-08 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724482', '卢换平', '81000', '孙逸仙纪念医院', null, null, '2017-05-02 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724494', '冯仲丹', '81000', '孙逸仙纪念医院', null, null, '2017-05-08 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724495', '李伟达', '81000', '孙逸仙纪念医院', null, null, '2017-05-08 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724496', '郭翀翀', '81000', '孙逸仙纪念医院', null, null, '2017-05-15 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724497', '谢锦辉', '81000', '孙逸仙纪念医院', null, null, '2017-05-15 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724498', '彭南清', '81000', '孙逸仙纪念医院', null, null, '2017-05-16 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724499', '王晓慧', '81000', '孙逸仙纪念医院', null, null, '2017-06-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724500', '潘国劲', '81000', '孙逸仙纪念医院', null, null, '2017-06-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724501', '廖定准', '81000', '孙逸仙纪念医院', null, null, '2017-06-06 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724502', '蔡小玲', '81000', '孙逸仙纪念医院', null, null, '2017-06-14 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724503', '王显带', '81000', '孙逸仙纪念医院', null, null, '2017-06-14 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724504', '毕永韬', '81000', '孙逸仙纪念医院', null, null, '2017-06-19 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724505', '朱间珍', '81000', '孙逸仙纪念医院', null, null, '2017-06-20 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724825', '郑娜芬', '81000', '孙逸仙纪念医院', null, null, '2017-06-22 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724826', '卢玉芳', '81000', '孙逸仙纪念医院', null, null, '2017-06-26 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724830', '丁丽娟', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724831', '郑志超', '81000', '孙逸仙纪念医院', null, null, '2017-07-01 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724832', '黄秋萍', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724833', '江绪旋', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724834', '肖至良', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724836', '王文胜', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724837', '刘咪', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724838', '徐文演', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724839', '江丹妮', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724840', '冯伟镜', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724841', '李慧杰', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724842', '余树斌', '81000', '孙逸仙纪念医院', null, null, '2017-07-03 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724843', '陈泳渝', '81000', '孙逸仙纪念医院', null, null, '2017-07-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724844', '路娟', '81000', '孙逸仙纪念医院', null, null, '2017-07-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724845', '唐媛', '81000', '孙逸仙纪念医院', null, null, '2017-07-05 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724846', '李红瑰', '81000', '孙逸仙纪念医院', null, null, '2017-07-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724847', '吴志超', '81000', '孙逸仙纪念医院', null, null, '2017-07-10 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724848', '朱鹏坤', '81000', '孙逸仙纪念医院', null, null, '2017-07-11 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724849', '陆柳伊', '81000', '孙逸仙纪念医院', null, null, '2017-07-13 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724850', '曾帆明', '81000', '孙逸仙纪念医院', null, null, '2017-07-13 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724851', '卢彩燕', '81000', '孙逸仙纪念医院', null, null, '2017-07-14 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724852', '吴华', '81000', '孙逸仙纪念医院', null, null, '2017-07-18 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');
INSERT INTO `t_person_info_zsu` VALUES ('724854', '陈倩齐', '81000', '孙逸仙纪念医院', null, null, '2017-07-19 00:00:00', '2', '附属医院人员', '4', '附属单位', '1', '在校', '0', '2017-07-21 11:37:57');

-- ----------------------------
-- Table structure for t_profession_info_zsu
-- ----------------------------
DROP TABLE IF EXISTS `t_profession_info_zsu`;
CREATE TABLE `t_profession_info_zsu` (
  `ZGH` varchar(100) NOT NULL COMMENT '职工号',
  `PRZWM` varchar(255) DEFAULT NULL COMMENT '聘任职务码',
  `PRZW` varchar(255) DEFAULT NULL COMMENT '聘任职务',
  `DELETEFLAG` int(4) DEFAULT NULL COMMENT '删除标记',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`ZGH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_profession_info_zsu
-- ----------------------------
INSERT INTO `t_profession_info_zsu` VALUES ('169051', null, null, '1', '2017-07-24 15:48:33');
INSERT INTO `t_profession_info_zsu` VALUES ('170153', '011', '教授', '0', '2017-07-24 11:08:36');
INSERT INTO `t_profession_info_zsu` VALUES ('170345', null, null, '0', '2017-07-25 13:28:35');
INSERT INTO `t_profession_info_zsu` VALUES ('177183', '601', '研究员', '1', '2017-07-20 21:38:31');
INSERT INTO `t_profession_info_zsu` VALUES ('177215', null, null, '1', '2017-07-24 15:48:33');
INSERT INTO `t_profession_info_zsu` VALUES ('177276', null, null, '0', '2017-07-25 17:18:29');
INSERT INTO `t_profession_info_zsu` VALUES ('177358', '603', '助理研究员', '1', '2017-07-20 22:08:30');
INSERT INTO `t_profession_info_zsu` VALUES ('724265', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724276', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724277', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724278', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724279', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724280', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724319', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724321', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724322', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724323', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724325', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724329', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724330', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724331', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724332', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724333', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724445', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724446', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724447', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724448', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724449', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724451', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724452', '999', '暂未聘任', '0', '2017-07-21 11:38:34');
INSERT INTO `t_profession_info_zsu` VALUES ('724453', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724454', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724455', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724456', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724457', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724458', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724459', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724460', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724461', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724462', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724463', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724464', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724465', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724466', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724467', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724468', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724470', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724471', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724472', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724473', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724474', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724475', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724476', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724477', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724479', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724480', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724481', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724482', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724494', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724495', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724496', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724497', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724498', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724499', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724500', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724501', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724502', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724503', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724504', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724505', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724825', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724826', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724830', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724831', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724832', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724833', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724834', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724836', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724837', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724838', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724839', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724840', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724841', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724842', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724843', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724844', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724845', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724846', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724847', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724848', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724849', '999', '暂未聘任', '0', '2017-07-21 11:38:32');
INSERT INTO `t_profession_info_zsu` VALUES ('724850', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724851', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724852', '999', '暂未聘任', '0', '2017-07-21 11:38:33');
INSERT INTO `t_profession_info_zsu` VALUES ('724854', '999', '暂未聘任', '0', '2017-07-21 11:38:33');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `question_name` varchar(400) DEFAULT NULL COMMENT '问题名称',
  `is_require` int(4) DEFAULT NULL COMMENT '是否必填',
  `type` varchar(400) DEFAULT NULL COMMENT '问题类型',
  `group_id` int(4) DEFAULT NULL COMMENT '问题组id',
  `deleted` int(8) DEFAULT '0',
  `question_type_id` int(11) DEFAULT NULL COMMENT '问题类型id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '1', '学年', '1', '4', '2', '0', '4');
INSERT INTO `t_question` VALUES ('2', '2', '学期', '1', '4', '2', '0', '4');
INSERT INTO `t_question` VALUES ('3', '3', '周', '1', '4', '2', '0', '4');
INSERT INTO `t_question` VALUES ('4', '4', '星期', '1', '3', '2', '0', '3');
INSERT INTO `t_question` VALUES ('5', '5', '节', '1', '4', '2', '0', '4');
INSERT INTO `t_question` VALUES ('6', '1', '课程号', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('7', '2', '教学班号', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('8', '3', '教师职称', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('9', '4', '课程名称', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('10', '5', '教师姓名', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('11', '6', '上课课室', '1', '4', '3', '0', '4');
INSERT INTO `t_question` VALUES ('12', '1', '所在学院', '1', '4', '5', '0', '4');
INSERT INTO `t_question` VALUES ('13', '2', '所在年级', '1', '4', '5', '0', '4');
INSERT INTO `t_question` VALUES ('18', '1', '责任心', '1', '1', '13', '0', '1');
INSERT INTO `t_question` VALUES ('19', '2', '教学准备', '1', '1', '13', '0', '1');
INSERT INTO `t_question` VALUES ('20', '3', '教案及PPT', '1', '1', '13', '0', '1');
INSERT INTO `t_question` VALUES ('21', '1', '内容丰富', '1', '1', '14', '0', '1');
INSERT INTO `t_question` VALUES ('22', '2', '逻辑清晰', '1', '1', '14', '0', '1');
INSERT INTO `t_question` VALUES ('23', '3', '理论联系实际', '1', '1', '14', '0', '1');
INSERT INTO `t_question` VALUES ('24', '1', '方式方法恰当', '1', '1', '15', '0', '1');
INSERT INTO `t_question` VALUES ('25', '2', '激发兴趣，启发思考', '1', '1', '15', '0', '1');
INSERT INTO `t_question` VALUES ('26', '3', '课堂组织', '1', '1', '15', '0', '1');
INSERT INTO `t_question` VALUES ('27', '4', '时间安排', '1', '1', '15', '0', '1');
INSERT INTO `t_question` VALUES ('28', '1', '仪态及表达', '1', '1', '16', '0', '1');
INSERT INTO `t_question` VALUES ('29', '2', '学生听课', '1', '1', '16', '0', '1');
INSERT INTO `t_question` VALUES ('30', '3', '课堂互动', '1', '1', '16', '0', '1');
INSERT INTO `t_question` VALUES ('35', '1', 'yyyy', '1', null, '25', '0', '4');
INSERT INTO `t_question` VALUES ('36', '2', 'yyyy', '1', null, '25', '0', '4');
INSERT INTO `t_question` VALUES ('37', '3', 'yyyy', '1', null, '25', '0', '4');
INSERT INTO `t_question` VALUES ('38', '4', 'yyyy', '1', null, '25', '0', '4');
INSERT INTO `t_question` VALUES ('71', '1', 'RRRR', '1', null, '37', '0', '6');
INSERT INTO `t_question` VALUES ('72', '2', 'RRRR', '1', null, '37', '0', '6');
INSERT INTO `t_question` VALUES ('73', '3', 'RRRR', '1', null, '37', '0', '6');
INSERT INTO `t_question` VALUES ('74', '4', 'RRRR', '1', null, '37', '0', '6');
INSERT INTO `t_question` VALUES ('75', '1', 'RRRR', '1', null, '38', '0', '6');
INSERT INTO `t_question` VALUES ('76', '2', 'RRRR', '1', null, '38', '0', '6');
INSERT INTO `t_question` VALUES ('77', '3', 'RRRR', '1', null, '38', '0', '6');
INSERT INTO `t_question` VALUES ('78', '4', 'RRRR', '1', null, '38', '0', '6');
INSERT INTO `t_question` VALUES ('79', '1', 'RRRR', '1', null, '39', '0', '6');
INSERT INTO `t_question` VALUES ('80', '2', 'RRRR', '1', null, '39', '0', '6');
INSERT INTO `t_question` VALUES ('81', '3', 'RRRR', '1', null, '39', '0', '6');
INSERT INTO `t_question` VALUES ('82', '4', 'RRRR', '1', null, '39', '0', '6');
INSERT INTO `t_question` VALUES ('83', '1', 'RRRR', '1', null, '40', '0', '6');
INSERT INTO `t_question` VALUES ('84', '2', 'RRRR', '1', null, '40', '0', '6');
INSERT INTO `t_question` VALUES ('85', '3', 'RRRR', '1', null, '40', '0', '6');
INSERT INTO `t_question` VALUES ('86', '4', 'RRRR', '1', null, '40', '0', '6');

-- ----------------------------
-- Table structure for t_question_group
-- ----------------------------
DROP TABLE IF EXISTS `t_question_group`;
CREATE TABLE `t_question_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temp_id` int(4) DEFAULT NULL COMMENT '模板id',
  `order_no` int(4) DEFAULT NULL COMMENT '排序',
  `question_info` varchar(400) DEFAULT NULL COMMENT '问题描述',
  `type_id` int(4) DEFAULT NULL COMMENT '类型id',
  `deleted` int(8) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_required` int(4) DEFAULT NULL COMMENT '是否必填',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question_group
-- ----------------------------
INSERT INTO `t_question_group` VALUES ('1', '1', '1', '听课校区', '1', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('2', '1', '2', '听课时间', '4', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('3', '1', '3', '课程基本信息', '4', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('4', '1', '4', '课程类别', '1', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('5', '1', '5', '学生信息', '4', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('6', '1', '6', '反馈情况', '1', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('7', '1', '8', '主要教学内容及过程', '5', '0', '提示:此处填写督导听课的时间节次', '1', null);
INSERT INTO `t_question_group` VALUES ('9', '1', '7', '教学评价', '6', '0', '提示:评价等级按A、B、C、D、E评定，分别表示”优秀“，”良好“，”一般“，”较差“，”很差“。', '1', null);
INSERT INTO `t_question_group` VALUES ('13', '1', '1', '教学态度', '6', '0', null, '1', '9');
INSERT INTO `t_question_group` VALUES ('14', '1', '2', '教学内容', '6', '0', null, '1', '9');
INSERT INTO `t_question_group` VALUES ('15', '1', '3', '教学方法', '6', '0', null, '1', '9');
INSERT INTO `t_question_group` VALUES ('16', '1', '4', '教学效果', '6', '0', null, '1', '9');
INSERT INTO `t_question_group` VALUES ('23', '2', '1', 'tttt', '1', '0', 'ttt', '1', null);
INSERT INTO `t_question_group` VALUES ('25', '2', '2', 'YYYY', '4', '0', 'YYYY', '1', null);
INSERT INTO `t_question_group` VALUES ('36', '2', '3', 'RRRR', '6', '0', 'RRRR', '1', null);
INSERT INTO `t_question_group` VALUES ('37', '2', '1', 'RRRR', '6', '0', 'RRRR', '1', '36');
INSERT INTO `t_question_group` VALUES ('38', '2', '2', 'RRRR', '6', '0', 'RRRR', '1', '36');
INSERT INTO `t_question_group` VALUES ('39', '2', '3', 'RRRR', '6', '0', 'RRRR', '1', '36');
INSERT INTO `t_question_group` VALUES ('40', '2', '4', 'RRRR', '6', '0', 'RRRR', '1', '36');

-- ----------------------------
-- Table structure for t_question_type
-- ----------------------------
DROP TABLE IF EXISTS `t_question_type`;
CREATE TABLE `t_question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `deleted` int(8) DEFAULT '0',
  `type_code` varchar(255) DEFAULT NULL COMMENT '类型编码',
  `singleFlag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question_type
-- ----------------------------
INSERT INTO `t_question_type` VALUES ('1', '单选题', '0', null, 'Y');
INSERT INTO `t_question_type` VALUES ('2', '多选题', '0', null, 'Y');
INSERT INTO `t_question_type` VALUES ('3', '下拉选择题', '0', null, 'Y');
INSERT INTO `t_question_type` VALUES ('4', '单行填空题', '0', null, 'N');
INSERT INTO `t_question_type` VALUES ('5', '多行填空题', '0', null, 'Y');
INSERT INTO `t_question_type` VALUES ('6', '矩阵单选题', '0', null, 'N');
INSERT INTO `t_question_type` VALUES ('7', '矩阵多选题', '0', null, 'N');

-- ----------------------------
-- Table structure for t_role_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu_info`;
CREATE TABLE `t_role_menu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单id',
  `deleted` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu_info
-- ----------------------------
INSERT INTO `t_role_menu_info` VALUES ('1', '1', '1', '0');
INSERT INTO `t_role_menu_info` VALUES ('2', '1', '2', '0');
INSERT INTO `t_role_menu_info` VALUES ('3', '1', '3', '0');
INSERT INTO `t_role_menu_info` VALUES ('4', '1', '4', '0');

-- ----------------------------
-- Table structure for t_supervisor_course_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_course_plan`;
CREATE TABLE `t_supervisor_course_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `supervisor_course_type` int(4) DEFAULT NULL COMMENT '督导听课类型',
  `total_listen_num` int(44) DEFAULT NULL COMMENT '总听课次数',
  `finished_listen_num` int(44) DEFAULT NULL COMMENT '已完成听课次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` int(8) DEFAULT '0',
  `class_no` varchar(444) DEFAULT NULL COMMENT '教学班号',
  `template_id` int(11) DEFAULT NULL COMMENT '模板id',
  `is_total_listen` int(255) DEFAULT NULL COMMENT '是否已完成听课',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_course_plan
-- ----------------------------
INSERT INTO `t_supervisor_course_plan` VALUES ('1', '1', '1', '3', null, '2017-07-07 15:47:49', '0', '38103825162002', null, null);
INSERT INTO `t_supervisor_course_plan` VALUES ('2', '1', '1', '3', null, '2017-07-07 14:55:12', '0', '38103825162011', null, null);
INSERT INTO `t_supervisor_course_plan` VALUES ('3', '1', '1', '5', null, '2017-07-07 15:48:01', '0', '38103825162011', '3', null);
INSERT INTO `t_supervisor_course_plan` VALUES ('4', '1', '2', '5', null, '2017-07-24 17:30:04', '0', '38103825162011', '1', null);
INSERT INTO `t_supervisor_course_plan` VALUES ('5', '1', '1', '5', null, '2017-07-07 15:37:45', '0', '38103825162011', '1', null);

-- ----------------------------
-- Table structure for t_supervisor_course_record
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_course_record`;
CREATE TABLE `t_supervisor_course_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_code` varchar(255) DEFAULT NULL COMMENT '记录表编码',
  `course_id` int(11) DEFAULT NULL COMMENT '课程号',
  `answer_info_id` int(4) DEFAULT NULL,
  `use_time` decimal(33,0) DEFAULT NULL COMMENT '用时数',
  `confirm_time` timestamp NULL DEFAULT NULL COMMENT '提交时间',
  `user_id` int(4) DEFAULT NULL COMMENT '用户id',
  `IP` varchar(400) DEFAULT NULL COMMENT 'ip地址',
  `source` varchar(400) DEFAULT NULL COMMENT '来源',
  `status` varchar(400) DEFAULT NULL COMMENT '状态 0(草稿) 1(提交)',
  `deleted` int(8) DEFAULT '0',
  `class_no` varchar(255) DEFAULT NULL COMMENT '教学号',
  `template_id` int(11) DEFAULT NULL COMMENT '模板id',
  `plan_id` int(11) DEFAULT NULL COMMENT '听课计划表id',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_title` varchar(255) DEFAULT NULL COMMENT '记录表题目',
  `record_desc` varchar(255) DEFAULT NULL COMMENT '记录表描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_course_record
-- ----------------------------
INSERT INTO `t_supervisor_course_record` VALUES ('1', '1000000001', null, null, '123', null, '1', '192.168.1.1', 'pc', 'A', '0', '38103825162002', null, '1', '2017-07-08 17:08:38', null, null);
INSERT INTO `t_supervisor_course_record` VALUES ('2', null, null, null, null, null, '1', null, null, null, '0', null, null, '1', null, null, null);
INSERT INTO `t_supervisor_course_record` VALUES ('3', null, null, null, null, null, '1', null, null, null, '0', null, null, '2', null, null, null);
INSERT INTO `t_supervisor_course_record` VALUES ('4', null, null, null, null, null, '1', null, null, null, '0', null, null, '2', null, null, null);

-- ----------------------------
-- Table structure for t_supervisor_course_type
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_course_type`;
CREATE TABLE `t_supervisor_course_type` (
  `id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL COMMENT '听课类型',
  `max_Value` int(11) DEFAULT NULL COMMENT '最大可听数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_course_type
-- ----------------------------
INSERT INTO `t_supervisor_course_type` VALUES ('1', '随堂听课', '16');
INSERT INTO `t_supervisor_course_type` VALUES ('2', '跟踪听课', '4');

-- ----------------------------
-- Table structure for t_supervisor_info
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_info`;
CREATE TABLE `t_supervisor_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor_code` varchar(400) DEFAULT NULL COMMENT '督导编码',
  `supervisor_group` varchar(400) DEFAULT NULL COMMENT '督导组名字',
  `group_id` int(12) DEFAULT NULL COMMENT '组别id',
  `name` varchar(400) DEFAULT NULL COMMENT '督导员名字',
  `gender` int(12) DEFAULT NULL COMMENT '督导员性别',
  `nation` varchar(400) DEFAULT NULL COMMENT '民族',
  `rank` varchar(400) DEFAULT NULL COMMENT '职称',
  `department` varchar(400) DEFAULT NULL COMMENT '所在院系名称',
  `department_id` int(12) DEFAULT NULL COMMENT '院系id',
  `school` varchar(400) DEFAULT NULL COMMENT '隶属校区',
  `school_id` int(12) DEFAULT NULL COMMENT '隶属校区id',
  `work_status` int(4) DEFAULT NULL COMMENT '在职状态',
  `employing_status` int(4) DEFAULT NULL COMMENT '在聘状态',
  `email` varchar(400) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(400) DEFAULT NULL COMMENT '手机',
  `roleid` int(4) DEFAULT NULL COMMENT '角色id',
  `sign` varchar(400) DEFAULT NULL COMMENT '签名',
  `deleted` int(4) DEFAULT '0' COMMENT '是否删除',
  `salary_no` varchar(255) DEFAULT NULL COMMENT '工资号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_info
-- ----------------------------
INSERT INTO `t_supervisor_info` VALUES ('1', '1001', '文科1组', '1', '朱元璋', '1', '汉族', '副教授', '哲学院', '1', '东校区', '1', '1', '0', '1111@qq.com', '13434582253', '1', 'src/recourse/zhouxx.jpg', '0', '000103');
INSERT INTO `t_supervisor_info` VALUES ('2', '1002', '文科2组', '2', '李世民', '0', '汉族', '正教授', '文学院', '1', '南校区', '2', '1', '0', '788767878@qq.com', '13434582254', '2', 'src/recourse/yangxx.jpg', '0', '3');
INSERT INTO `t_supervisor_info` VALUES ('3', '1003', '工科1组', '3', '雍正', '1', '满族', '副教授', '文学院', '1', '本校区', '3', '1', '0', '898788787@qq.com', '13434582255', '1', 'src/recourse/chenxx.jpg', '0', '123');
INSERT INTO `t_supervisor_info` VALUES ('4', 'dudao001', '文学组1', '1', '周XX', '1', '汉族', '副教授', '哲学院', '1', '东校区', '1', '1', '1', '1111@qq.com', '13434582253', '2', 'src/recourse/zhouxx.jpg', '1', '23');
INSERT INTO `t_supervisor_info` VALUES ('5', 'dudao002', '文学组2', '2', '杨XX', '0', '汉族', '正教授', '文学院', '1', '南校区', '2', '1', '1', '555@qq.com', '13434582254', '1', 'src/recourse/yangxx.jpg', '1', '3123');
INSERT INTO `t_supervisor_info` VALUES ('6', 'dudao003', '文学组3', '3', '陈XX', '1', '汉族', '副教授', '文学院', '1', '本校区', '3', '1', '1', '777@qq.com', '13434582255', '2', 'src/recourse/chenxx.jpg', '1', '23423');
INSERT INTO `t_supervisor_info` VALUES ('7', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '1', '166616661661@qq.com', null, null, null, '0', '435345');
INSERT INTO `t_supervisor_info` VALUES ('8', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '1', '166616661661@qq.com', null, null, null, '0', '6456');
INSERT INTO `t_supervisor_info` VALUES ('9', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '1', '166616661661@qq.com', null, null, null, '0', '234');
INSERT INTO `t_supervisor_info` VALUES ('10', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '1', '166616661661@qq.com', null, null, null, '0', '4234');
INSERT INTO `t_supervisor_info` VALUES ('11', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '1', '166616661661@qq.com', null, null, null, '0', '5345');
INSERT INTO `t_supervisor_info` VALUES ('12', null, null, null, null, null, null, null, '哲学院', null, null, null, null, '0', '166616661661@qq.com', null, null, null, '0', null);
INSERT INTO `t_supervisor_info` VALUES ('13', null, null, null, null, null, null, null, '哲学院', null, null, null, null, null, '166616661661@qq.com', null, null, null, '0', null);
INSERT INTO `t_supervisor_info` VALUES ('21', '724322', '文科一组', '1', '杨伟雄', '1', '汉族', '暂未聘任', '孙逸仙纪念医院', '81000', null, null, '1', '0', '1111@qq.com', '1232341', '1', 'src/recourse/zhouxx.jpg', '1', null);
INSERT INTO `t_supervisor_info` VALUES ('22', '177358', '文科一组', '1', '冯伟', '1', '汉族', '助理研究员', '药学院（深圳）', '75110', null, '5', '1', '0', '1111@qq.com', '1232341', '1', 'src/recourse/zhouxx.jpg', '1', null);
INSERT INTO `t_supervisor_info` VALUES ('23', '177183', '文科一组', '1', '徐宇航', '1', '汉族', '研究员', '中国语言文学系（珠海）', '72130', '珠海校区', '3', '1', '0', '1111@qq.com', '1232341', '1', 'src/recourse/zhouxx.jpg', '1', null);
INSERT INTO `t_supervisor_info` VALUES ('24', '724826', '文科一组', '1', '卢玉芳', '1', '汉族', '暂未聘任', '孙逸仙纪念医院', '81000', null, null, '1', '0', '1111@qq.com', '1232341', '1', 'src/recourse/zhouxx.jpg', '1', null);

-- ----------------------------
-- Table structure for t_supervisor_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_leave`;
CREATE TABLE `t_supervisor_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(400) DEFAULT NULL COMMENT '用户名称',
  `reason` varchar(400) DEFAULT NULL COMMENT '请假原因',
  `apply_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `approval_time` timestamp NULL DEFAULT NULL COMMENT '审批时间',
  `period` decimal(55,0) DEFAULT NULL COMMENT '请假周期',
  `status` int(4) DEFAULT NULL COMMENT '审批状态',
  `deleted` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_leave
-- ----------------------------
INSERT INTO `t_supervisor_leave` VALUES ('1', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('2', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('3', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('4', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('5', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('6', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('7', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('8', '1', 'super', '生病', '2017-06-12 15:43:20', '2017-06-12 15:43:20', '2', '1', '0');
INSERT INTO `t_supervisor_leave` VALUES ('9', null, 'sfasfafa', null, null, null, null, null, '0');
INSERT INTO `t_supervisor_leave` VALUES ('10', null, 'sfasfafa', null, null, null, null, null, '0');
INSERT INTO `t_supervisor_leave` VALUES ('11', null, 'sfasfafa', null, null, null, null, null, '0');
INSERT INTO `t_supervisor_leave` VALUES ('12', null, 'sfasfafa', null, null, null, null, null, '0');
INSERT INTO `t_supervisor_leave` VALUES ('13', null, 'sfasfafa', null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for t_supervisor_work_summarize
-- ----------------------------
DROP TABLE IF EXISTS `t_supervisor_work_summarize`;
CREATE TABLE `t_supervisor_work_summarize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `year` varchar(400) DEFAULT NULL COMMENT '年度',
  `term` int(4) DEFAULT NULL COMMENT '学期',
  `finish_attend_class_num` int(4) DEFAULT NULL COMMENT '完成随堂听课次数',
  `finish_follow_class_num` int(4) DEFAULT NULL COMMENT '完成跟踪评课次数',
  `term_teach_info` varchar(4000) DEFAULT NULL COMMENT '本学期教学总体情况',
  `term_teach_suggestionAndProblem` varchar(4000) DEFAULT NULL COMMENT '听课中发现的比较突出的问题及建议',
  `other` varchar(4000) DEFAULT NULL COMMENT '其他',
  `deleted` int(8) DEFAULT '0',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `commit_date` timestamp NULL DEFAULT NULL COMMENT '审批时间',
  `status` int(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_supervisor_work_summarize
-- ----------------------------
INSERT INTO `t_supervisor_work_summarize` VALUES ('1', '1', '2016-2017', '1', '1', '5', 'yyyyyyyyyyyyyyyyyyyyyy', 'ttttttttttttttttttttttttttt', 'ttttttt', '1', '2017-07-08 00:00:00', '2017-07-08 00:00:00', '1');
INSERT INTO `t_supervisor_work_summarize` VALUES ('2', '1', '2016-2017', '4', '5', '5', 'yyyyyyyyyyyyyyyyyyyyyy', 'ttttttttttttttttttttttttttt', 'ttttttt', '0', '2017-07-08 00:00:00', null, '1');
INSERT INTO `t_supervisor_work_summarize` VALUES ('3', '1', '2016-2017', '4', '5', '5', 'yyyyyyyyyyyyyyyyyyyyyy', 'ttttttttttttttttttttttttttt', 'ttttttt', '0', '2017-07-08 00:00:00', null, '1');
INSERT INTO `t_supervisor_work_summarize` VALUES ('4', '1', '2016-2017', '4', '5', '5', 'yyyyyyyyyyyyyyyyyyyyyy', 'ttttttttttttttttttttttttttt', 'ttttttt', '0', '2017-07-08 00:00:00', null, '1');
INSERT INTO `t_supervisor_work_summarize` VALUES ('5', '1', '2016-2017', '2', null, null, 'tttttttttttttttttttttttt', null, null, '0', '2017-07-08 00:00:00', null, '1');

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  `isleaf` varchar(400) DEFAULT NULL COMMENT '是否叶子',
  `menu_name` varchar(400) DEFAULT NULL COMMENT '菜单名称',
  `menu_order` varchar(400) DEFAULT NULL COMMENT '菜单顺序',
  `deleted` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', null, null, '听课记录管理', '1', '0');
INSERT INTO `t_sys_menu` VALUES ('2', null, null, '督导管理', '2', '0');
INSERT INTO `t_sys_menu` VALUES ('3', null, null, '课程管理', '3', '0');
INSERT INTO `t_sys_menu` VALUES ('4', null, null, '权限设置', '4', '0');
INSERT INTO `t_sys_menu` VALUES ('5', '1', null, '创建听课记录表', '5', '0');
INSERT INTO `t_sys_menu` VALUES ('6', '1', null, '编辑听课记录表', '6', '0');
INSERT INTO `t_sys_menu` VALUES ('7', '1', null, '统计&分析', '7', '0');
INSERT INTO `t_sys_menu` VALUES ('8', '1', null, '听课记录表回收', '8', '0');
INSERT INTO `t_sys_menu` VALUES ('9', '2', null, '督导个人信息管理', '9', '0');

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(4000) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(4000) DEFAULT NULL COMMENT '角色编码',
  `role_desc` varchar(4000) DEFAULT NULL COMMENT '角色描述',
  `deleted` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', '督导员', 'a', '督导员', '0');
INSERT INTO `t_sys_role` VALUES ('2', '督导员组长', 'b', '督导员组长', '0');
INSERT INTO `t_sys_role` VALUES ('3', '系统分析员', 'c', '系统分析员', '0');
INSERT INTO `t_sys_role` VALUES ('4', '系统管理员', 'd', '系统管理员', '0');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(4000) DEFAULT NULL COMMENT '用户名',
  `password` varchar(4000) DEFAULT NULL COMMENT '密码',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'super', '123', '1', '2017-07-09 17:39:57', '0');
INSERT INTO `t_sys_user` VALUES ('2', 'analyst\r\n', '123', '1', '2017-07-09 17:39:58', '0');
INSERT INTO `t_sys_user` VALUES ('3', 'supervisor', '123', '1', '2017-07-09 17:39:58', '0');
INSERT INTO `t_sys_user` VALUES ('4', 'supervisorLeader', '123', '1', '2017-07-09 17:40:02', '0');
INSERT INTO `t_sys_user` VALUES ('5', '5777', '888', '5', null, '0');

-- ----------------------------
-- View structure for t_sys_user_v
-- ----------------------------
DROP VIEW IF EXISTS `t_sys_user_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `t_sys_user_v` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`role_id` AS `role_id`,`u`.`create_date` AS `create_date`,`u`.`deleted` AS `deleted`,`r`.`role_name` AS `role_name`,`r`.`role_code` AS `role_code`,`r`.`role_desc` AS `role_desc` from (`t_sys_user` `u` left join `t_sys_role` `r` on((`u`.`role_id` = `r`.`id`))) ;

-- ----------------------------
-- View structure for v_course_professor_info
-- ----------------------------
DROP VIEW IF EXISTS `v_course_professor_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `v_course_professor_info` AS select `t_course_zsu`.`XND` AS `XND`,`t_course_zsu`.`XQ` AS `XQ`,`t_course_zsu`.`KKDWH` AS `KKDWH`,`t_course_zsu`.`KKDWMC` AS `KKDWMC`,`t_course_zsu`.`JXBH` AS `JXBH`,`t_course_zsu`.`KCDM` AS `KCDM`,`t_course_zsu`.`KCZWMC` AS `KCZWMC`,`t_course_zsu`.`SKSJDD` AS `SKSJDD`,`t_course_zsu`.`KCLB` AS `KCLB`,`t_course_zsu`.`XF` AS `XF`,`t_course_zsu`.`XS` AS `XS`,`t_course_plan_zsu`.`ZGH` AS `ZGH`,`t_course_plan_zsu`.`XIAOQUM` AS `XIAOQUM`,`t_course_plan_zsu`.`XIAOQU` AS `XIAOQU`,`t_person_info_zsu`.`XM` AS `XM`,`t_profession_info_zsu`.`PRZWM` AS `PRZWM`,`t_profession_info_zsu`.`PRZW` AS `PRZW` from (((`t_course_zsu` left join `t_course_plan_zsu` on((`t_course_zsu`.`JXBH` = `t_course_plan_zsu`.`JSBH`))) left join `t_person_info_zsu` on((`t_course_plan_zsu`.`ZGH` = `t_person_info_zsu`.`ZGH`))) left join `t_profession_info_zsu` on((`t_person_info_zsu`.`ZGH` = `t_profession_info_zsu`.`ZGH`))) order by `t_course_zsu`.`XND`,`t_course_zsu`.`JXBH` desc ;
SET FOREIGN_KEY_CHECKS=1;
