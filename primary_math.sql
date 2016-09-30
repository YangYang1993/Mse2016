/*
Navicat MySQL Data Transfer

Source Server         : gan
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : primary_math

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2015-11-15 21:30:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `fault`
-- ----------------------------
DROP TABLE IF EXISTS `fault`;
CREATE TABLE `fault` (
  `faultID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `fileAddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`faultID`),
  KEY `userIDinFault` (`userID`),
  CONSTRAINT `userIDinFault` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fault
-- ----------------------------

-- ----------------------------
-- Table structure for `honour`
-- ----------------------------
DROP TABLE IF EXISTS `honour`;
CREATE TABLE `honour` (
  `honourID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `honourType` int(11) DEFAULT NULL,
  PRIMARY KEY (`honourID`),
  KEY `userIDinHonour` (`userID`),
  CONSTRAINT `userIDinHonour` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honour
-- ----------------------------
INSERT INTO `honour` VALUES ('1', '23', '2');
INSERT INTO `honour` VALUES ('2', '23', '5');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `recordID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT '题目类型',
  `datetime` date DEFAULT NULL,
  `minutes` int(11) DEFAULT NULL COMMENT '做题所用时长',
  `errorNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordID`),
  KEY `userIDinRecord` (`userID`),
  CONSTRAINT `userIDinRecord` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '23', '1', '2015-11-11', '10', '5');
INSERT INTO `record` VALUES ('2', '23', '1', '2015-11-12', '5', '6');
INSERT INTO `record` VALUES ('3', '23', '2', '2015-12-02', '6', '3');
INSERT INTO `record` VALUES ('4', '23', '2', '2015-11-12', '7', '7');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('23', 'gan', '123', '775201591@qq.com', '1', null, '0');
INSERT INTO `user` VALUES ('24', 'qq', '111', '123@qq.com', '1', null, '0');
