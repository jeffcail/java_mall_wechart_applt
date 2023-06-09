/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql8
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : 127.0.0.1:3306
 Source Schema         : java_mall

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 09/06/2023 15:13:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype` (
  `id` int DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
BEGIN;
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (1, '手机', '手机描述', '1.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (2, '电脑平板', '电脑平板描述', '2.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (3, '智能穿戴', '智能穿戴描述', '3.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (4, '电视', '电视描述', '4.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (5, '大家电', '大家电描述', '5.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (6, '小家电', '小家电描述', '6.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (7, '智能家居', '智能家居描述', '7.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (8, '户外出行', '户外出行描述', '8.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (9, '日用百货', '日用百货描述', '9.jpg');
INSERT INTO `t_bigtype` (`id`, `name`, `remark`, `image`) VALUES (10, '儿童用品', '儿童用品描述', '10.jpg');
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userId` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalPrice` decimal(10,0) DEFAULT NULL,
  `address` varchar(900) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consignee` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telNumber` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (3, 'MALL20230609125159000000979', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 00:52:00', NULL, 0);
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (4, 'MALL20230609125338000000187', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 00:53:38', NULL, 0);
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (5, 'MALL20230609010232000000870', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 13:02:33', NULL, 0);
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (6, 'MALL20230609010329000000467', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 13:03:29', NULL, 0);
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (7, 'MALL20230609020717000000944', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 14:07:18', NULL, 0);
INSERT INTO `t_order` (`id`, `orderNo`, `userId`, `totalPrice`, `address`, `consignee`, `telNumber`, `createDate`, `payDate`, `status`) VALUES (8, 'MALL20230609020720000000548', 'dfasdfsdaadfasds', 7999, '广东省广州市海珠区新港中路397号', '张三', '020-81167888', '2023-06-09 14:07:21', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mId` int DEFAULT NULL,
  `goodsId` int DEFAULT NULL,
  `goodsNumber` int DEFAULT NULL,
  `goodsPrice` decimal(10,0) DEFAULT NULL,
  `goodsName` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `goodsPic` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
BEGIN;
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (1, 3, 1, 1, 7999, '咖啡', '1.jpg');
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (2, 4, 1, 1, 7999, '咖啡', '1.jpg');
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (3, 5, 1, 1, 7999, '咖啡', '1.jpg');
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (4, 6, 1, 1, 7999, '咖啡', '1.jpg');
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (5, 7, 1, 1, 7999, '咖啡', '1.jpg');
INSERT INTO `t_order_detail` (`id`, `mId`, `goodsId`, `goodsNumber`, `goodsPrice`, `goodsName`, `goodsPic`) VALUES (6, 8, 1, 1, 7999, '咖啡', '1.jpg');
COMMIT;

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `proPic` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isHot` bit(1) DEFAULT NULL,
  `isSwiper` bit(1) DEFAULT NULL,
  `swiperPic` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `swiperSort` int DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `hotDateTime` datetime DEFAULT NULL,
  `productIntroImgs` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `productParaImgs` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_product
-- ----------------------------
BEGIN;
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (1, '咖啡', 7999.00, 2005, '1.jpg', b'1', b'1', '1.jpg', 1, 1, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (2, '跑车', 7999.00, 2005, '2.jpg', b'1', b'1', '2.jpg', 1, 2, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (3, '菊花', 7999.00, 2005, '3.jpg', b'1', b'1', '3.jpg', 1, 3, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (4, '小米电视', 7999.00, 2005, '4.jpg', b'1', b'1', '4.jpg', 1, 5, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (5, '咖啡', 7999.00, 2005, '5.jpg', b'1', b'1', '1.jpg', 1, 7, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (6, '跑车', 7999.00, 2005, '6.jpg', b'1', b'1', '2.jpg', 1, 10, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (7, '菊花', 7999.00, 2005, '7.jpg', b'1', b'1', '3.jpg', 1, 11, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (8, '小米电视', 7999.00, 2005, '8.jpg', b'1', b'1', '4.jpg', 1, 11, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (9, '菊花', 7999.00, 2005, '7.jpg', b'1', b'1', '3.jpg', 1, 39, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (10, '小米电视', 7999.00, 2005, '8.jpg', b'1', b'1', '4.jpg', 1, 40, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (11, '菊花', 7999.00, 2005, '7.jpg', b'1', b'1', '3.jpg', 1, 41, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
INSERT INTO `t_product` (`id`, `name`, `price`, `stock`, `proPic`, `isHot`, `isSwiper`, `swiperPic`, `swiperSort`, `typeId`, `hotDateTime`, `productIntroImgs`, `productParaImgs`, `description`) VALUES (12, '小米电视', 7999.00, 2005, '8.jpg', b'1', b'1', '4.jpg', 1, 41, '2023-06-04 22:34:27', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/2.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', 'iPhone 14 Pro是苹果公司于2022年9月8日发布的手机。 [1]<img width=\'100%\' src=\'http://localhost:9090/image/productIntroImgs/333.jpg\'></img>\niPhone 14 Pro长度为147.5毫米，宽度为71.5毫米，厚度为7.85毫米，重量206克。机身提供四种颜色：深空黑色、银色、金色、暗紫色。 [2]\niPhone 14 Pro搭载A16仿生芯片，预装iOS 16操作系统，前置1200万像素镜头，后置4800万像素主镜头+1200万像素超广角镜头+1200万长焦镜头；搭载不可拆卸式电池。 [3]\n', '苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro苹果14pro');
COMMIT;

-- ----------------------------
-- Table structure for t_product_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `t_product_swiper_image`;
CREATE TABLE `t_product_swiper_image` (
  `id` int DEFAULT NULL,
  `image` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `productId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_product_swiper_image
-- ----------------------------
BEGIN;
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (1, '1.jpg', 1, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (2, '2.jpg', 2, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (3, '3.jpg', 3, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (4, '4.jpg', 4, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (5, '5.jpg', 5, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (6, '6.jpg', 6, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (7, '7.jpg', 7, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (8, '11.jpg', 1, 1);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (9, '22.jpg', 2, 4);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (10, '33.jpg', 3, 4);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (11, '44.jpg', 4, 4);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (12, '111.jpg', 1, 7);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (13, '222.jpg', 2, 7);
INSERT INTO `t_product_swiper_image` (`id`, `image`, `sort`, `productId`) VALUES (14, '333.jpg', 3, 8);
COMMIT;

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype` (
  `id` int DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(765) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bigTypeId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
BEGIN;
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (1, 'Xiaomi Civi', 'Xiaomi Civi', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (2, 'Xiaomi 数字系列', 'Xiaomi 数字系列', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (3, 'Xiaomi MIX系列', 'Xiaomi MIX系列', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (5, '小米平板', '小米平板', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (6, 'RedmiBook', 'RedmiBook', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (7, '小米笔记本', '小米笔记本', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (10, '耳机', '耳机', 3);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (11, '手表', '手表', 3);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (12, '手环', '手环', 3);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (13, '电视', '电视', 4);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (14, '小米电视大师', '小米电视大师', 4);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (15, '电视配件', '电视配件', 4);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (16, '空调', '空调', 5);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (17, '洗衣机', '洗衣机', 5);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (18, '冰箱', '冰箱', 5);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (19, '厨房大电', '厨房大电', 5);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (20, '厨房小电', '厨房小电', 6);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (21, '清洁电器', '清洁电器', 6);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (22, '环境电器', '环境电器', 6);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (23, '生活电器', '生活电器', 6);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (24, '小爱音箱', '小爱音箱', 7);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (25, '路由器', '路由器', 7);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (26, '智能安防', '智能安防', 7);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (27, '智能控制', '智能控制', 7);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (28, '户外出行', '户外出行', 8);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (29, '箱包', '箱包', 8);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (30, '家具日用', '家具日用', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (31, '防护清洁', '防护清洁', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (32, '会员定制', '会员定制', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (33, '个人护理', '个人护理', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (34, '健康', '健康', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (35, '鞋服配饰', '鞋服配饰', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (36, '床品家居', '床品家居', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (37, '礼品周边', '礼品周边', 9);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (38, '儿童用品', '儿童用品', 10);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (39, 'Redmi K系列', 'K系列', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (40, 'Redmi Note系列', 'Note系列', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (41, '游戏手机', '游戏手机', 1);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (44, '22', '22', 3);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (45, '是', '3 是', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (46, 'ewew', 'ew', 3);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (47, 'rrr', 'rrr', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (48, '43', '4343', 2);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (49, '5', '55', 4);
INSERT INTO `t_smalltype` (`id`, `name`, `remark`, `bigTypeId`) VALUES (50, '12', '22', 7);
COMMIT;

-- ----------------------------
-- Table structure for t_wxuserinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_wxuserinfo`;
CREATE TABLE `t_wxuserinfo` (
  `id` int DEFAULT NULL,
  `openid` varchar(90) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nickName` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatarUrl` varchar(600) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of t_wxuserinfo
-- ----------------------------
BEGIN;
INSERT INTO `t_wxuserinfo` (`id`, `openid`, `nickName`, `avatarUrl`, `registerDate`, `lastLoginDate`) VALUES (1, 'dfasdfsdaadfasds', 'Hello 菜先森', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKw5Yiaicb9DAHhLbNsHdc5ibLWa9qugFMt99cT3s5tHSu6R6IHoMrJFVNXWBXVJcKzUxopoDeXJu2nw/132', '2023-06-08 22:44:52', '2023-06-09 13:02:33');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
