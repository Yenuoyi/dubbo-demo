/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50538
 Source Host           : localhost:3306
 Source Schema         : dubbo

 Target Server Type    : MySQL
 Target Server Version : 50538
 File Encoding         : 65001

 Date: 28/08/2018 17:24:45

*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `productTypes` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型',
  `orderNumber` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `unitPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `totalPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`orderNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('TT20180827095900001', '休闲裤', 10, 198.00, 1980.00);
INSERT INTO `orders` VALUES ('TT20180827154300001', '休闲裤', 10, 10.25, 102.50);
INSERT INTO `orders` VALUES ('TT20180827173300001', '休闲裤', 10, 198.00, 1980.00);
INSERT INTO `orders` VALUES ('TT20180827173400001', '休闲裤', 10, 198.00, 1980.00);

-- ----------------------------
-- Procedure structure for generate
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate`;
delimiter ;;
CREATE PROCEDURE `generate`(in orderNamePre char(2),in productTypes VARCHAR(20),
in orderNumber INT(10),in unitPrice decimal(10,2),OUT result INT(2))
BEGIN  
  DECLARE newOrderNo varchar(25);
  DECLARE currentDate varCHAR (15) ;-- 当前日期,有可能包含时分秒   
  DECLARE maxNo INT DEFAULT 0 ; -- 离现在最近的满足条件的订单编号的流水号最后5位，如：SH2013011000002的maxNo=2    
  DECLARE oldOrderNo VARCHAR (25) DEFAULT '' ;-- 离现在最近的满足条件的订单编号   
    
--   SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO currentDate ;-- 年月日时分秒共14位数
    SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i') INTO currentDate ;-- 年月日时分秒共14位数
    
        -- SUBSTRING() 字符串截取函数
  SELECT IFNULL(orderNo, '') INTO oldOrderNo   
  FROM orders
  WHERE SUBSTRING(orderNo, 3, 12) = currentDate   -- 截取时间段
    AND SUBSTRING(orderNo, 1, 2) = orderNamePre    -- 截取当前订单名
  ORDER BY orderNo DESC LIMIT 1 ; -- 有多条时只显示离现在最近的一条   
    
    -- 判断是否拥有当前时间段订单
  IF oldOrderNo != '' THEN   
    SET maxNo = SUBSTRING(oldOrderNo, -5);
  END IF ;  
    
  SELECT CONCAT(orderNamePre, currentDate,  LPAD((maxNo + 1), 5, '0')) INTO newOrderNo ;
        -- LPAD((maxNo + 1), 5, '0')：如果不足5位，将用0填充左边   
  INSERT INTO orders (orderNo,productTypes,orderNumber,unitPrice,totalPrice) VALUES (newOrderNo,productTypes,orderNumber,unitPrice,REPLACE(FORMAT(orderNumber*unitPrice,2),",","")) ; -- 向订单表中插入数据   
	SET result = 1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
