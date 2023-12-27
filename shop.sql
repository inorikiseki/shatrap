/*
 Navicat Premium Data Transfer

 Source Server         : 8.142.155.84
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35-0ubuntu0.22.04.1)
 Source Host           : 8.142.155.84:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 27/12/2023 15:29:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '购物车ID:自增列，主键',
  `user_id` int NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `good_id` int NOT NULL COMMENT '商品ID:外键，引用good(id)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `carUserID`(`user_id` ASC) USING BTREE,
  INDEX `carGoodID`(`good_id` ASC) USING BTREE,
  CONSTRAINT `carGoodID` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `carUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (31, 5, 22);
INSERT INTO `car` VALUES (32, 9, 38);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '种类ID:自增，主键',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '种类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '教科书');
INSERT INTO `category` VALUES (4, '文具和办公用品');
INSERT INTO `category` VALUES (5, '电子产品');
INSERT INTO `category` VALUES (7, '衣物');
INSERT INTO `category` VALUES (8, '宿舍必需品');
INSERT INTO `category` VALUES (9, '食品和饮料');
INSERT INTO `category` VALUES (10, '校园周边商品');
INSERT INTO `category` VALUES (11, '实验室用品');
INSERT INTO `category` VALUES (12, '活动门票');
INSERT INTO `category` VALUES (13, '运动器材');
INSERT INTO `category` VALUES (14, '音乐与乐器');
INSERT INTO `category` VALUES (15, '交通工具');
INSERT INTO `category` VALUES (16, '小说与漫画');
INSERT INTO `category` VALUES (17, '化妆品');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID：自增，主键',
  `user_id` int NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `category_id` int NOT NULL COMMENT '种类ID:外键，引用category（id）',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `describe` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品描述',
  `price` int NOT NULL COMMENT '商品价格',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品图片',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品状态：（1：未出售）（0：已出售）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodUserID`(`user_id` ASC) USING BTREE,
  INDEX `goodCategoryID`(`category_id` ASC) USING BTREE,
  INDEX `i_title`(`title` ASC) USING BTREE,
  CONSTRAINT `goodCategoryID` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goodUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (22, 2, 4, '一只钢笔', '以前买的一支钢笔，保护挺好的，没怎么用过，质量如图。', 20, '/upload/2023-12-19/pen.jpg', 0);
INSERT INTO `good` VALUES (23, 2, 4, '几乎全新的计算器', '几乎未使用的计算器，带有屏幕保护膜，适合数学、物理等科目的学生使用。', 40, '/upload/2023-12-19/计算器.jpg', 1);
INSERT INTO `good` VALUES (24, 2, 16, '漫画杂志合集', '文具	多本漫画杂志的合集，包含热门漫画作品，适合漫画爱好者收藏阅读。', 30, '/upload/2023-12-19/heji.jpg', 0);
INSERT INTO `good` VALUES (25, 3, 5, 'iPad Pro 11寸	', 'iPad	64GB储存容量，配备Apple Pencil和Smart Keyboard，适合学习和创作使用。', 3500, '/upload/2023-12-19/ipad.jpg', 1);
INSERT INTO `good` VALUES (26, 3, 5, '机械键盘	', '键盘	机械键盘，带有背光效果，使用可靠的机械轴，适合打字和游戏使用。', 300, '/upload/2023-12-19/keyboard.jpg', 1);
INSERT INTO `good` VALUES (27, 5, 7, '运动T恤', '衣服	品牌：Nike，尺码：M，适合运动和日常穿着，透气舒适，颜色：黑色。	', 50, '/upload/2023-12-19/nike.jpg', 1);
INSERT INTO `good` VALUES (28, 5, 7, '休闲裤', '	衣服	舒适休闲的长裤，尺码：M，适合日常休闲和校园活动，颜色：蓝色。	', 60, '/upload/2023-12-19/xiuxianku.jpg', 1);
INSERT INTO `good` VALUES (29, 5, 7, '外套	', '衣服	时尚款式的外套，尺码：XL，适合秋冬季节穿着，保暖舒适，颜色：灰色。	', 120, '/upload/2023-12-19/coat.jpg', 1);
INSERT INTO `good` VALUES (30, 9, 15, '山地自行车', '	自行车	品牌：Giant，车架尺寸：M，21速变速系统，前避震器，适合校园内的骑行和运动。	', 400, '/upload/2023-12-19/bycycle2.jpg', 1);
INSERT INTO `good` VALUES (31, 9, 8, '书架', '	支架	实木书架，适合放置书籍、文件和其他物品，方便整理和存放学习资料和文献。	', 50, '/upload/2023-12-19/shujia.jpg', 1);
INSERT INTO `good` VALUES (33, 10, 9, '薯片混合装', '	零食	多种口味的薯片混合装，包括原味、番茄、酸奶洋葱等，适合与朋友分享或作为小吃零食。	', 20, '/upload/2023-12-19/shupian.jpg', 1);
INSERT INTO `good` VALUES (34, 5, 4, '钢笔', '一支钢笔', 19, '/upload/2023-12-19/pen.jpg', 1);
INSERT INTO `good` VALUES (37, 2, 9, '泡芙小零食', '巧克力泡芙 * 10', 30, '/upload/2023-12-19/11/1702958169887.jpg', 1);
INSERT INTO `good` VALUES (38, 3, 2, '英语牛津字典', '英语牛津字典，几乎无损，无笔迹。', 45, '/upload/2023-12-19/12/1702958516603.jpg', 1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言ID:自增，主键',
  `user_id` int NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `good_id` int NOT NULL COMMENT '商品ID:外键，引用good(id)',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '留言内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `messageUserID`(`user_id` ASC) USING BTREE,
  INDEX `messageGoodID`(`good_id` ASC) USING BTREE,
  CONSTRAINT `messageGoodID` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `messageUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (18, 5, 22, '我喜欢这个牌子的钢笔，价格很不错。');
INSERT INTO `message` VALUES (19, 9, 28, '看上去质量不错。');
INSERT INTO `message` VALUES (20, 9, 31, '还能再便宜点吗？ ');
INSERT INTO `message` VALUES (21, 10, 31, '书架的价格有点高，但是实木材质的质感应该不错。请问书架的尺寸是多大？能否容纳大部分常见尺寸的书籍和文件？');
INSERT INTO `message` VALUES (22, 2, 37, '好好吃的样子！');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID:自增，主键',
  `user_id` int NOT NULL COMMENT '用户ID:外键，引用user(id)',
  `good_id` int NOT NULL COMMENT '商品ID:外键，引用good(id)',
  `take_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人姓名',
  `take_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人地址',
  `take_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人电话',
  `state` tinyint NOT NULL DEFAULT 1 COMMENT '订单状态：1:待确认 2:待发货 3:待收货 4:已完成',
  `express_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `express_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderUserID`(`user_id` ASC) USING BTREE,
  INDEX `orderGoodID`(`good_id` ASC) USING BTREE,
  CONSTRAINT `orderGoodID` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderUserID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (25, 5, 24, '孙六', '西园20舍102B', '18932932813', 1, NULL, NULL);
INSERT INTO `order` VALUES (26, 5, 22, '孙六', '西园10舍123A', '183323242424', 1, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID:自增，主键',
  `email` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户邮箱',
  `password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `sex` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/lib/img/head.jpg' COMMENT '用户头像',
  `is_admin` tinyint NOT NULL DEFAULT 0 COMMENT '是否为管理员（1：是，0：不是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_email`(`email` ASC) USING BTREE COMMENT '邮箱的唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin@qq.com', 'admin', '张三', '男', '/upload/img/head.jpg', 1);
INSERT INTO `user` VALUES (2, 'abc@qq.com', 'abc', '李四', '女', '/upload/img/head.jpg', 0);
INSERT INTO `user` VALUES (3, 'root@qq.com', 'root', '王五', '男', '/upload/2023-12-19/12/1702958542779.png', 0);
INSERT INTO `user` VALUES (5, '123@qq.com', '123', '孙六', '女', '/upload/2023-12-19/12/1702958583261.jpg', 0);
INSERT INTO `user` VALUES (6, 'zyf@qq.com', 'zyf', 'zyf', '男', '/upload/img/head.jpg', 1);
INSERT INTO `user` VALUES (7, 'zs@qq.com', 'zs', 'zs', '男', '/upload/img/head.jpg', 1);
INSERT INTO `user` VALUES (8, 'zhl@qq.com', 'zhl', 'zhl', '男', '/upload/img/head.jpg', 1);
INSERT INTO `user` VALUES (9, 'pen@qq.com', 'pen', '钱七', '男', '/upload/2023-12-19/12/1702958653987.jpg', 0);
INSERT INTO `user` VALUES (10, 'text@qq.com', 'text', '唐八', '女', '/upload/2023-12-19/12/1702958693424.jpg', 0);
INSERT INTO `user` VALUES (14, 'female', 'female', 'female', '女', '/lib/img/head.jpg', 0);
INSERT INTO `user` VALUES (15, 'man123', 'man', 'man', '男', '/lib/img/head.jpg', 0);

SET FOREIGN_KEY_CHECKS = 1;
