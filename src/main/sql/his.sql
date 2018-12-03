/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : his

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 03/12/2018 11:47:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for degree
-- ----------------------------
DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree`  (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of degree
-- ----------------------------
INSERT INTO `degree` VALUES (1, '专科');
INSERT INTO `degree` VALUES (4, '博士研究生');
INSERT INTO `degree` VALUES (2, '本科');
INSERT INTO `degree` VALUES (3, '硕士研究生');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_eng_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`dept_name`) USING BTREE,
  UNIQUE INDEX `eng_name`(`dept_eng_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
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

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(1) NOT NULL,
  `hiredate` date NULL DEFAULT NULL,
  `degree_id` int(1) NULL DEFAULT NULL,
  `major` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profession` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_id` int(4) NULL DEFAULT NULL,
  `is_expert` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doctor_degree_id`(`degree_id`) USING BTREE,
  INDEX `fk_doctor_department_id`(`department_id`) USING BTREE,
  INDEX `fk_doctor_is_expert`(`is_expert`) USING BTREE,
  CONSTRAINT `fk_doctor_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_doctor_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_doctor_is_expert` FOREIGN KEY (`is_expert`) REFERENCES `expert` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
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

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert`  (
  `id` int(1) NULL DEFAULT 0,
  `expense` int(4) NULL DEFAULT NULL,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES (0, 8);
INSERT INTO `expert` VALUES (1, 12);

-- ----------------------------
-- Table structure for identify
-- ----------------------------
DROP TABLE IF EXISTS `identify`;
CREATE TABLE `identify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `identify_type` int(1) NOT NULL,
  `identify_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identify_number`(`identify_number`) USING BTREE,
  INDEX `identify_type`(`identify_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of identify
-- ----------------------------
INSERT INTO `identify` VALUES (1, 1, 0, '00000000000000000');
INSERT INTO `identify` VALUES (2, 1, 1, '00000000000000001');
INSERT INTO `identify` VALUES (3, 1, 2, '00000000000000002');
INSERT INTO `identify` VALUES (4, 1, 3, '00000000000000003');

-- ----------------------------
-- Table structure for patient_list
-- ----------------------------
DROP TABLE IF EXISTS `patient_list`;
CREATE TABLE `patient_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(1) NOT NULL,
  `age` int(3) NOT NULL,
  `identify_type` int(1) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_patient_list_identify_type`(`identify_type`) USING BTREE,
  CONSTRAINT `fk_patient_list_identify_type` FOREIGN KEY (`identify_type`) REFERENCES `identify` (`identify_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient_list
-- ----------------------------
INSERT INTO `patient_list` VALUES (1, '李丽', 1, 22, 0, '广东省广州科技企业加速器尚志苑B2栋2楼', '13414937050');

SET FOREIGN_KEY_CHECKS = 1;
