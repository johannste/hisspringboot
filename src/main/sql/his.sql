/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : his

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 16/12/2018 21:59:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for degree
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of degree
-- ----------------------------
BEGIN;
INSERT INTO `degree` VALUES (1, '专科');
INSERT INTO `degree` VALUES (4, '博士研究生');
INSERT INTO `degree` VALUES (2, '本科');
INSERT INTO `degree` VALUES (3, '硕士研究生');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(7) NOT NULL,
  `dept_eng_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`dept_name`) USING BTREE,
  UNIQUE KEY `eng_name` (`dept_eng_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES (1, '内科', 'Internal');
INSERT INTO `department` VALUES (2, '外科', 'Surgery');
INSERT INTO `department` VALUES (3, '妇产科', 'Obstetrics_Gynecology');
INSERT INTO `department` VALUES (4, '男科', 'Andrology');
INSERT INTO `department` VALUES (5, '儿科', 'Paediatrics');
INSERT INTO `department` VALUES (6, '五官科', 'Five_Sense_Organs');
INSERT INTO `department` VALUES (7, '骨科', 'Orthopedics');
INSERT INTO `department` VALUES (8, '精神科', 'Psychiatry');
INSERT INTO `department` VALUES (9, '护士科', 'Nursing');
INSERT INTO `department` VALUES (10, '胸心外科', 'Cardiothoracic_Surgery');
INSERT INTO `department` VALUES (11, '口腔科', 'Stomatology');
COMMIT;

-- ----------------------------
-- Table structure for diagnose_time_range
-- ----------------------------
DROP TABLE IF EXISTS `diagnose_time_range`;
CREATE TABLE `diagnose_time_range` (
  `id` int(2) NOT NULL,
  `range` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `range` (`range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diagnose_time_range
-- ----------------------------
BEGIN;
INSERT INTO `diagnose_time_range` VALUES (1, '00:00 - 01:00');
INSERT INTO `diagnose_time_range` VALUES (2, '01:00 - 02:00');
INSERT INTO `diagnose_time_range` VALUES (3, '02:00 - 03:00');
INSERT INTO `diagnose_time_range` VALUES (4, '03:00 - 04:00');
INSERT INTO `diagnose_time_range` VALUES (5, '04:00 - 05:00');
INSERT INTO `diagnose_time_range` VALUES (6, '05:00 - 06:00');
INSERT INTO `diagnose_time_range` VALUES (7, '06:00 - 07:00');
INSERT INTO `diagnose_time_range` VALUES (8, '07:00 - 08:00');
INSERT INTO `diagnose_time_range` VALUES (9, '08:00 - 09:00');
INSERT INTO `diagnose_time_range` VALUES (10, '09:00 - 10:00');
INSERT INTO `diagnose_time_range` VALUES (11, '10:00 - 11:00');
INSERT INTO `diagnose_time_range` VALUES (12, '11:00 - 12:00');
INSERT INTO `diagnose_time_range` VALUES (13, '12:00 - 13:00');
INSERT INTO `diagnose_time_range` VALUES (14, '13:00 - 14:00');
INSERT INTO `diagnose_time_range` VALUES (15, '14:00 - 15:00');
INSERT INTO `diagnose_time_range` VALUES (16, '15:00 - 16:00');
INSERT INTO `diagnose_time_range` VALUES (17, '16:00 - 17:00');
INSERT INTO `diagnose_time_range` VALUES (18, '17:00 - 18:00');
INSERT INTO `diagnose_time_range` VALUES (19, '18:00 - 19:00');
INSERT INTO `diagnose_time_range` VALUES (20, '19:00 - 20:00');
INSERT INTO `diagnose_time_range` VALUES (21, '20:00 - 21:00');
INSERT INTO `diagnose_time_range` VALUES (22, '21:00 - 22:00');
INSERT INTO `diagnose_time_range` VALUES (23, '22:00 - 23:00');
INSERT INTO `diagnose_time_range` VALUES (24, '23:00 - 24:00');
COMMIT;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `gender` int(1) NOT NULL,
  `hiredate` date DEFAULT NULL,
  `degree_id` int(1) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `profession` varchar(10) DEFAULT NULL,
  `department_id` int(4) DEFAULT NULL,
  `is_expert` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_doctor_degree_id` (`degree_id`) USING BTREE,
  KEY `fk_doctor_department_id` (`department_id`) USING BTREE,
  KEY `fk_doctor_is_expert` (`is_expert`) USING BTREE,
  CONSTRAINT `fk_doctor_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`),
  CONSTRAINT `fk_doctor_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_doctor_is_expert` FOREIGN KEY (`is_expert`) REFERENCES `expert` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of doctor
-- ----------------------------
BEGIN;
INSERT INTO `doctor` VALUES (1, '李秋子', 1, '2014-08-01', 2, '临床医学', '主治医师', 2, 0);
INSERT INTO `doctor` VALUES (2, '黄英', 1, '2012-04-05', 1, '护理学', '护士', 9, 0);
INSERT INTO `doctor` VALUES (3, '罗子君', 1, '2017-06-18', 2, '骨科', '主任', 7, 0);
INSERT INTO `doctor` VALUES (4, '唐颖', 0, '2015-08-19', 4, '心理学', '心理医生', 8, 0);
INSERT INTO `doctor` VALUES (5, '高毅', 0, '2013-03-20', 3, '临床医学', '主治医师', 1, 1);
INSERT INTO `doctor` VALUES (6, '唐颖', 0, '2015-08-19', 4, '临床医学', '主治医师', 5, 0);
INSERT INTO `doctor` VALUES (7, '王大陆', 0, '2013-03-20', 3, '临床医学', '主治医师', 1, 0);
INSERT INTO `doctor` VALUES (8, '王博', 0, '2012-06-04', 3, '中医', '主治医师', 3, 0);
INSERT INTO `doctor` VALUES (9, '李涂锌', 0, '2014-03-01', 3, '临床医学', '主任', 10, 1);
INSERT INTO `doctor` VALUES (10, '秦森', 1, '2012-02-21', 2, '口腔医学', '主治医师', 11, 0);
INSERT INTO `doctor` VALUES (11, '王英', 1, '2016-05-15', 3, '药学', '教授', 4, 0);
COMMIT;

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `id` int(1) NOT NULL,
  `expense` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of expert
-- ----------------------------
BEGIN;
INSERT INTO `expert` VALUES (0, 8);
INSERT INTO `expert` VALUES (1, 12);
COMMIT;

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `id` int(1) NOT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender` (`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
BEGIN;
INSERT INTO `gender` VALUES (1, '女');
INSERT INTO `gender` VALUES (0, '男');
COMMIT;

-- ----------------------------
-- Table structure for identify
-- ----------------------------
DROP TABLE IF EXISTS `identify`;
CREATE TABLE `identify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `identify_type` int(1) NOT NULL,
  `identify_number` varchar(18) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identify_number` (`identify_number`) USING BTREE,
  KEY `identify_type` (`identify_type`) USING BTREE,
  CONSTRAINT `fk_identify_uid` FOREIGN KEY (`uid`) REFERENCES `patient_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of identify
-- ----------------------------
BEGIN;
INSERT INTO `identify` VALUES (1, 0, 0, '00000000000000000');
INSERT INTO `identify` VALUES (2, 0, 1, '00000000000000001');
INSERT INTO `identify` VALUES (3, 0, 2, '00000000000000002');
INSERT INTO `identify` VALUES (4, 0, 3, '00000000000000003');
INSERT INTO `identify` VALUES (5, 1, 0, '440882199508132346');
INSERT INTO `identify` VALUES (6, 2, 0, '440882199508132347');
INSERT INTO `identify` VALUES (7, 3, 0, '440882199508132348');
INSERT INTO `identify` VALUES (8, 4, 0, '211234199402141291');
INSERT INTO `identify` VALUES (9, 5, 0, '21030319940325101x');
COMMIT;

-- ----------------------------
-- Table structure for identify_type
-- ----------------------------
DROP TABLE IF EXISTS `identify_type`;
CREATE TABLE `identify_type` (
  `id` int(1) NOT NULL,
  `type` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of identify_type
-- ----------------------------
BEGIN;
INSERT INTO `identify_type` VALUES (0, '身份证');
INSERT INTO `identify_type` VALUES (1, '医保卡');
INSERT INTO `identify_type` VALUES (2, '农合卡');
INSERT INTO `identify_type` VALUES (3, '健康卡');
INSERT INTO `identify_type` VALUES (4, '熙康卡');
COMMIT;

-- ----------------------------
-- Table structure for patient_list
-- ----------------------------
DROP TABLE IF EXISTS `patient_list`;
CREATE TABLE `patient_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `gender` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `province` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `identify_type` int(1) NOT NULL,
  `more_address` varchar(100) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `related_name` varchar(5) DEFAULT NULL,
  `related_phone_number` varchar(11) DEFAULT NULL,
  `relationship` int(1) DEFAULT NULL,
  `symptoms` varchar(200) DEFAULT NULL,
  `ill_history` varchar(200) DEFAULT NULL,
  `region` int(1) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_patient_list_identify_type` (`identify_type`) USING BTREE,
  KEY `fk_relationship` (`relationship`),
  KEY `fk_patient_list_region` (`region`),
  KEY `fk_patient_list_gender` (`gender`),
  CONSTRAINT `fk_patient_list_gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_patient_list_identify_type` FOREIGN KEY (`identify_type`) REFERENCES `identify` (`identify_type`),
  CONSTRAINT `fk_patient_list_region` FOREIGN KEY (`region`) REFERENCES `patient_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_list_relationship` FOREIGN KEY (`relationship`) REFERENCES `patient_relationship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of patient_list
-- ----------------------------
BEGIN;
INSERT INTO `patient_list` VALUES (1, '李丽', 1, 22, '广东省', '广州市', 0, '广州科技企业加速器尚志苑B2栋2楼', '13414937050', NULL, NULL, NULL, NULL, NULL, 1, '2018-12-07 21:42:44');
INSERT INTO `patient_list` VALUES (2, '赵青', 1, 21, '广东省', '广州市', 0, '广州华南师范大学尚志苑B1栋2楼', '13414935080', NULL, NULL, NULL, NULL, NULL, 2, '2018-12-07 21:42:44');
INSERT INTO `patient_list` VALUES (3, '钱虎', 0, 23, '广东省', '广州市', 0, '广州华南师范大学尚志苑C栋2楼', '13414936979', NULL, NULL, NULL, NULL, NULL, 3, '2018-12-07 21:42:44');
INSERT INTO `patient_list` VALUES (4, '曾雪花', 1, 23, '广东省', '湛江市', 0, '寸金桥29号尚志苑C栋3楼', '13414937053', NULL, NULL, NULL, NULL, NULL, 4, '2018-12-07 21:42:44');
INSERT INTO `patient_list` VALUES (5, '钱花花', 1, 24, '辽宁省', '鞍山市', 0, '天门山五道口', '13898909000', '', '', NULL, '', '', 3, '2018-12-16 21:51:05');
COMMIT;

-- ----------------------------
-- Table structure for patient_region
-- ----------------------------
DROP TABLE IF EXISTS `patient_region`;
CREATE TABLE `patient_region` (
  `id` int(11) NOT NULL,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_region
-- ----------------------------
BEGIN;
INSERT INTO `patient_region` VALUES (6, '住院');
INSERT INTO `patient_region` VALUES (4, '化验');
INSERT INTO `patient_region` VALUES (3, '急诊');
INSERT INTO `patient_region` VALUES (5, '手术');
INSERT INTO `patient_region` VALUES (1, '挂号');
INSERT INTO `patient_region` VALUES (2, '门诊');
COMMIT;

-- ----------------------------
-- Table structure for patient_relationship
-- ----------------------------
DROP TABLE IF EXISTS `patient_relationship`;
CREATE TABLE `patient_relationship` (
  `id` int(11) NOT NULL,
  `type` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient_relationship
-- ----------------------------
BEGIN;
INSERT INTO `patient_relationship` VALUES (3, '亲戚');
INSERT INTO `patient_relationship` VALUES (5, '其他');
INSERT INTO `patient_relationship` VALUES (4, '朋友');
INSERT INTO `patient_relationship` VALUES (2, '母亲');
INSERT INTO `patient_relationship` VALUES (1, '父亲');
COMMIT;

-- ----------------------------
-- Table structure for register_manager
-- ----------------------------
DROP TABLE IF EXISTS `register_manager`;
CREATE TABLE `register_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_number` varchar(20) NOT NULL UNIQUE,
  `identify_type` int(1) NOT NULL,
  `identify_number` varchar(18) NOT NULL,
  `department_id` int(1) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `register_date` date NOT NULL,
  `diagnose_time` int(2) NOT NULL,
  `expenses` int(11) NOT NULL,
  `is_paid` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_register_manager_diagnose_time` (`diagnose_time`),
  KEY `fk_register_manager_identify_type` (`identify_type`),
  KEY `fk_register_manager_department_id` (`department_id`),
  KEY `fk_register_manager_doctor_id` (`doctor_id`),
  KEY `fk_register_manager_identify_number` (`identify_number`),
  KEY `fk_register_manager_status` (`status`),
  KEY `fk_register_manager_is_paid` (`is_paid`),
  CONSTRAINT `fk_register_manager_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_register_manager_diagnose_time` FOREIGN KEY (`diagnose_time`) REFERENCES `diagnose_time_range` (`id`),
  CONSTRAINT `fk_register_manager_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `fk_register_manager_identify_number` FOREIGN KEY (`identify_number`) REFERENCES `identify` (`identify_number`),
  CONSTRAINT `fk_register_manager_identify_type` FOREIGN KEY (`identify_type`) REFERENCES `identify_type` (`id`),
  CONSTRAINT `fk_register_manager_is_paid` FOREIGN KEY (`is_paid`) REFERENCES `register_payment` (`id`),
  CONSTRAINT `fk_register_manager_status` FOREIGN KEY (`status`) REFERENCES `register_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_manager
-- ----------------------------
BEGIN;
INSERT INTO `register_manager` VALUES (1, '20181113000000000001', 0, '211234199402141291', 2, 1, '2018-12-13', 5, 8, 1, 1);
INSERT INTO `register_manager` VALUES (2, '20181113000000000002', 0, '211234199402141291', 1, 5, '2018-12-13', 5, 12, 1, 1);
INSERT INTO `register_manager` VALUES (3, '20181113000000000003', 0, '211234199402141291', 7, 3, '2018-12-13', 5, 8, 0, 2);
INSERT INTO `register_manager` VALUES (4, '20181113000000000004', 0, '440882199508132348', 4, 11, '2018-12-13', 5, 8, 1, 1);
INSERT INTO `register_manager` VALUES (5, '20181113000000000005', 0, '440882199508132348', 4, 11, '2018-12-13', 14, 8, 0, 2);
COMMIT;

-- ----------------------------
-- Table structure for register_payment
-- ----------------------------
DROP TABLE IF EXISTS `register_payment`;
CREATE TABLE `register_payment` (
  `id` int(1) NOT NULL,
  `is_paid` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `is_paid` (`is_paid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_payment
-- ----------------------------
BEGIN;
INSERT INTO `register_payment` VALUES (1, '已缴费');
INSERT INTO `register_payment` VALUES (0, '未缴费');
COMMIT;

-- ----------------------------
-- Table structure for register_status
-- ----------------------------
DROP TABLE IF EXISTS `register_status`;
CREATE TABLE `register_status` (
  `id` int(1) NOT NULL,
  `status` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`),
  UNIQUE KEY `status_2` (`status`),
  UNIQUE KEY `status_3` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_status
-- ----------------------------
BEGIN;
INSERT INTO `register_status` VALUES (2, '待生效');
INSERT INTO `register_status` VALUES (0, '无效');
INSERT INTO `register_status` VALUES (1, '有效');
COMMIT;

-- ----------------------------
-- View structure for v_patient_list
-- ----------------------------
DROP VIEW IF EXISTS `v_patient_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_patient_list` AS select `pl`.`id` AS `序号`,`pl`.`name` AS `姓名`,`g`.`gender` AS `性别`,`pl`.`age` AS `年龄`,`pl`.`province` AS `省份`,`pl`.`city` AS `城市`,`pl`.`more_address` AS `详细地址`,`it`.`type` AS `挂号凭证`,`i`.`identify_number` AS `凭证号`,`pl`.`phone` AS `手机`,`pl`.`related_name` AS `联系人姓名`,`pl`.`related_phone_number` AS `联系方式`,`prs`.`type` AS `与患者关系`,`pl`.`symptoms` AS `身体状况`,`pl`.`ill_history` AS `病史`,`pr`.`type` AS `患者来源`,`pl`.`create_date` AS `注册时间` from (((((`patient_list` `pl` left join `identify_type` `it` on((`pl`.`identify_type` = `it`.`id`))) left join `patient_region` `pr` on((`pl`.`region` = `pr`.`id`))) left join `gender` `g` on((`pl`.`gender` = `g`.`id`))) left join `identify` `i` on((`pl`.`id` = `i`.`uid`))) left join `patient_relationship` `prs` on((`pl`.`relationship` = `prs`.`id`)));

-- ----------------------------
-- View structure for v_register_list
-- ----------------------------
DROP VIEW IF EXISTS `v_register_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_register_list` AS select `rm`.`id` AS `序号`,`pl`.`name` AS `患者姓名`,`it`.`type` AS `挂号凭证`,`d`.`dept_name` AS `科室`,`doc`.`name` AS `就诊医生`,`rm`.`register_date` AS `就诊日期`,`dtr`.`range` AS `就诊时间`,`rm`.`register_number` AS `候诊号`,`rm`.`expenses` AS `挂号费`,`rp`.`is_paid` AS `缴费状态`,`rs`.`status` AS `挂号状态` from ((((((((`register_manager` `rm` left join `identify` `i` on((`rm`.`identify_number` = `i`.`identify_number`))) left join `identify_type` `it` on((`rm`.`identify_type` = `it`.`id`))) left join `patient_list` `pl` on((`i`.`uid` = `pl`.`id`))) left join `department` `d` on((`rm`.`department_id` = `d`.`id`))) left join `doctor` `doc` on((`rm`.`doctor_id` = `doc`.`id`))) left join `diagnose_time_range` `dtr` on((`rm`.`diagnose_time` = `dtr`.`id`))) left join `register_status` `rs` on((`rm`.`status` = `rs`.`id`))) left join `register_payment` `rp` on((`rm`.`is_paid` = `rp`.`id`))) where (`rm`.`status` <> 0) order by `rm`.`id`;

SET FOREIGN_KEY_CHECKS = 1;
