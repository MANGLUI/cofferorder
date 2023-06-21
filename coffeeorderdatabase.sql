/*
 Navicat MySQL Data Transfer

 Source Server         : ml0418
 Source Server Type    : MySQL
 Source Server Version : 50521
 Source Host           : localhost:3306
 Source Schema         : coffeeorderdatabase

 Target Server Type    : MySQL
 Target Server Version : 50521
 File Encoding         : 65001

 Date: 18/06/2023 15:06:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int(10) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '孟蕾', '123456');

-- ----------------------------
-- Table structure for coffee
-- ----------------------------
DROP TABLE IF EXISTS `coffee`;
CREATE TABLE `coffee`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `series` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coffee
-- ----------------------------
INSERT INTO `coffee` VALUES (1, '美式咖啡', '手工调制浓缩咖啡', 30.00, '简单即是美味，萃取经典浓缩咖啡，以水调和，香气浓郁满溢。');
INSERT INTO `coffee` VALUES (2, '拿铁', '手工调制浓缩咖啡', 33.00, '本色的经典咖啡饮品。新鲜萃取的浓缩咖啡中缓缓倒入蒸煮牛奶，简单的香与纯。');
INSERT INTO `coffee` VALUES (4, 'Pink Drink 粉粉生咖', '轻咖啡因系列', 43.00, '全新星巴克Pink Drink 粉粉生咖（轻咖啡因饮品），从未经烘培的100%阿拉卡生豆中萃取无寻常咖啡烘培味道和颜色的生咖精华，带来咖啡原生力，精选酸甜草莓与阿萨伊果的双重果汁惊喜拼配，巧妙搭配椰汁和真实果干，焕出明亮多彩，轻盈爽快的轻咖啡因饮品。');
INSERT INTO `coffee` VALUES (5, 'Dragon Drink 幻紫生咖', '轻咖啡因系列', 40.00, '全新星巴克Dragon Drink 幻紫生咖（轻咖啡因饮品），从未经烘培的100%阿拉卡生豆中萃取无寻常咖啡烘培味道和颜色的生咖精华，带来咖啡原生力，精选香甜芒果与火龙果的双重果汁惊喜拼配，巧妙搭配椰汁和真实果干，焕出温柔粉紫，轻盈爽快的轻咖啡因饮品。');
INSERT INTO `coffee` VALUES (6, '馥芮白', '手工调制浓缩咖啡', 41.00, '选用星巴克精粹浓缩咖啡制成，融合蒸煮牛奶，风味更浓郁和甘甜。');
INSERT INTO `coffee` VALUES (7, '焦糖玛奇朵', '手工调制浓缩咖啡', 37.00, '玛奇朵在意大利语中的意思是“印记”。从蒸煮牛奶和添加风味糖浆开始，再倒入醇厚的浓缩咖啡，留下属于玛奇朵的独有印记。');
INSERT INTO `coffee` VALUES (8, '浓缩咖啡', '手工调制浓缩咖啡', 37.00, '萃取星巴克浓缩烘焙咖啡豆精华，每一口都馥郁满溢，伴随浓郁的焦糖香及多层次的口感，带你开启星巴克咖啡之旅。');
INSERT INTO `coffee` VALUES (9, '抹茶星冰乐', '星冰乐系列', 36.00, '抹茶的清新，加一份牛奶的丝滑，与冰块和稀奶油搅拌出特有的清爽。');
INSERT INTO `coffee` VALUES (10, '盐系青梅气泡冷萃', '40.00', 40.00, '经14小时慢速萃取的冷萃带来沁甘顺滑的口感，遇上轻咸青梅风味与清爽红茶茶汤');
INSERT INTO `coffee` VALUES (16, '1111222', '111.0022', 111.00, '1111222');

SET FOREIGN_KEY_CHECKS = 1;
