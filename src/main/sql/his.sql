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

 Date: 30/11/2018 16:57:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for degree
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(7) NOT NULL,
  `dept_eng_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`dept_name`),
  UNIQUE KEY `eng_name` (`dept_eng_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `gender` int(11) NOT NULL,
  `hiredate` date DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `profession` varchar(10) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `is_expert` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_degree_id` (`degree_id`),
  KEY `fk_doctor_department_id` (`department_id`) USING BTREE,
  KEY `fk_doctor_is_expert` (`is_expert`),
  CONSTRAINT `fk_doctor_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`),
  CONSTRAINT `fk_doctor_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_doctor_is_expert` FOREIGN KEY (`is_expert`) REFERENCES `expert` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
  `id` int(11) DEFAULT '0',
  `expense` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expert
-- ----------------------------
BEGIN;
INSERT INTO `expert` VALUES (0, 8);
INSERT INTO `expert` VALUES (1, 12);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
