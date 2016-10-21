-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 01 月 15 日 09:43
-- 服务器版本: 5.5.8
-- PHP 版本: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `amc`
--

-- --------------------------------------------------------

--
-- 表的结构 `ci_admin`
--

CREATE TABLE IF NOT EXISTS `ci_admin` (
  `uid` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户名称',
  `userpwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否锁定',
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `lever` text COLLATE utf8_unicode_ci COMMENT '权限',
  `roleid` tinyint(1) DEFAULT '1' COMMENT '角色ID',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台用户' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ci_admin`
--

INSERT INTO `ci_admin` (`uid`, `username`, `userpwd`, `status`, `name`, `mobile`, `lever`, `roleid`) VALUES
(1, 'admin', '12b99e6b88f9d65b6b229c936702928d', 1, '罗经理', '', NULL, 0),
(3, 'zhouquan', 'f6f4404156560e3edd6dac26c37b5cea', 1, '周全', '13245678901', '1,2,3,4,5,31,32,33,34,35,36,37,38,39', 1),
(4, 'zangyize', '7b209910d2a43f9287e87b296a8f8af6', 1, '臧艺泽', '13245678909', '11,12,13,14,15,16,17,18,19,20,21,40,41,42,43,44,45,46,47,48', 1),
(5, 'guanqinyu', '4908445a82478261f8e3055e69770c4a', 1, '关钦玉', '13245678908', '25,26,27,28,29,30,40,41,42,68,69,70,71,72', 1),
(6, 'wangzhao', '3c28ddaf923edd1c01b78de62922abaa', 1, '王曌', '13245678907', '11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,6,10,7,8,9,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83', 1),
(7, 'yuanchunyu', '96b6f885ec7f802e6dfd07ee53b36c63', 1, '袁春宇', '13245678906', '1,2,3,4,5,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,6,10,7,8,9,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_category`
--

CREATE TABLE IF NOT EXISTS `ci_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `pid` smallint(6) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `depth` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '区别',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户、商品、供应商类别' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `ci_category`
--

INSERT INTO `ci_category` (`id`, `name`, `pid`, `path`, `depth`, `ordnum`, `status`, `type`) VALUES
(1, '大', 0, '1', 1, 0, 1, 'trade'),
(2, '中', 0, '2', 1, 0, 1, 'trade'),
(3, '小', 0, '3', 1, 0, 1, 'trade'),
(4, '高级信用', 0, '4', 1, 0, 1, 'supplytype'),
(5, '中级信用', 0, '5', 1, 0, 1, 'supplytype'),
(6, '低级信用', 0, '6', 1, 0, 1, 'supplytype'),
(7, '新供应商', 0, '7', 1, 0, 1, 'supplytype'),
(8, 'A', 0, '8', 1, 0, 1, 'customertype'),
(9, 'AA', 0, '9', 1, 0, 1, 'customertype'),
(10, 'AAA', 0, '10', 1, 0, 1, 'customertype'),
(11, 'AAAA', 0, '11', 1, 0, 1, 'customertype'),
(12, 'AAAAA', 0, '12', 1, 0, 1, 'customertype');

-- --------------------------------------------------------

--
-- 表的结构 `ci_category_type`
--

CREATE TABLE IF NOT EXISTS `ci_category_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `number` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '上级栏目ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`number`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户、商品、供应商类别' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `ci_category_type`
--

INSERT INTO `ci_category_type` (`id`, `name`, `number`, `status`) VALUES
(1, '商品类别', 'trade', 1),
(2, '户类别', 'customertype', 1),
(3, '供应商类别', 'supplytype', 1);

-- --------------------------------------------------------

--
-- 表的结构 `ci_contact`
--

CREATE TABLE IF NOT EXISTS `ci_contact` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '客户名称',
  `number` varchar(50) DEFAULT '0' COMMENT '客户编号',
  `categoryid` smallint(6) DEFAULT '0' COMMENT '客户类别',
  `categoryname` varchar(50) DEFAULT '' COMMENT '分类名称',
  `taxrate` double DEFAULT '0' COMMENT '税率',
  `amount` double DEFAULT '0' COMMENT '期初应付款',
  `periodmoney` double DEFAULT '0' COMMENT '期初预付款',
  `begindate` datetime DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `linkmans` text COMMENT '客户联系方式',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `type` tinyint(1) DEFAULT '1' COMMENT '1客户  2供应商',
  `contact` varchar(255) DEFAULT '',
  `credit` varchar(5) NOT NULL DEFAULT 'A',
  `contactaddress` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='客户、供应商管理' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `ci_contact`
--

INSERT INTO `ci_contact` (`id`, `name`, `number`, `categoryid`, `categoryname`, `taxrate`, `amount`, `periodmoney`, `begindate`, `remark`, `linkmans`, `status`, `type`, `contact`, `credit`, `contactaddress`) VALUES
(21, '爱信精机', 's000003', 5, '中级信用', 17, 0, 0, NULL, '', '[]', 1, 2, 's000003 爱信精机 []', 'AAA', ''),
(19, '博世', 's000001', 4, '高级信用', 17, 0, 0, '2014-09-01 00:00:00', '', '[]', 1, 2, 's000001 博世 []', 'AAAAA', ''),
(20, '大陆集团', 's000002', 5, '中级信用', 17, 0, 0, NULL, '', '[]', 1, 2, 's000002 大陆集团 []', 'AAAA', ''),
(22, '佛吉亚', 's000004', 6, '低级信用', 17, 0, 0, NULL, '', '[]', 1, 2, 's000004 佛吉亚 []', 'AA', ''),
(23, '江森自控', 's000005', 7, '新供应商', 17, 0, 0, NULL, '', '[]', 1, 2, 's000005 江森自控 []', 'A', ''),
(24, '广汇汽车服务股份公司', 'c000001', 12, 'AAAAA', 0, 0, 0, '2014-09-01 00:00:00', '', '[]', 1, 1, 'c000001 广汇汽车服务股份公司 []', 'AAAAA', ''),
(25, '国机汽车股份有限公司', 'c000002', 11, 'AAAA', 0, 0, 0, '2014-09-01 00:00:00', '', '[]', 1, 1, 'c000002 国机汽车股份有限公司 []', 'AAAA', ''),
(26, '深圳东风南方实业有限公司', 'c000003', 10, 'AAA', 0, 0, 0, '2014-09-01 00:00:00', '', '[]', 1, 1, 'c000003 深圳东风南方实业有限公司 []', 'AAA', ''),
(27, '浙江和诚汽车有限公司', 'c000004', 9, 'AA', 0, 0, 0, NULL, '', '[]', 1, 1, 'c000004 浙江和诚汽车有限公司 []', 'AA', ''),
(28, '鸿粤汽车销售集团有限公司', 'c000005', 8, 'A', 0, 0, 0, NULL, '', '[]', 1, 1, 'c000005 鸿粤汽车销售集团有限公司 []', 'A', ''),
(29, '广东前锋汽车修理厂', 'c000006', 8, 'A', 0, 0, 0, NULL, '', '[]', 1, 1, 'c000006 广东前锋汽车修理厂 []', 'A', '');

-- --------------------------------------------------------

--
-- 表的结构 `ci_goods`
--

CREATE TABLE IF NOT EXISTS `ci_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `number` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商品编号',
  `quantity` double DEFAULT '0' COMMENT '库存数量',
  `spec` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '规格',
  `unitid` smallint(6) DEFAULT '0' COMMENT '单位ID',
  `unitname` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单位名称',
  `categoryid` smallint(6) DEFAULT '0' COMMENT '商品分类ID',
  `categoryname` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '分类名称',
  `purprice` double DEFAULT '0' COMMENT '预计采购价',
  `saleprice` double DEFAULT '0' COMMENT '预计销售价',
  `unitcost` double DEFAULT '0' COMMENT '单位成本',
  `amount` double DEFAULT '0' COMMENT '期初总价',
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `goods` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `safequantity` double NOT NULL DEFAULT '0' COMMENT '安全库存',
  `safelevel` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '安全库存' COMMENT '库存水平',
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品管理' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ci_goods`
--

INSERT INTO `ci_goods` (`id`, `name`, `number`, `quantity`, `spec`, `unitid`, `unitname`, `categoryid`, `categoryname`, `purprice`, `saleprice`, `unitcost`, `amount`, `remark`, `status`, `goods`, `safequantity`, `safelevel`) VALUES
(3, '钢板', 'g000001', 500, '', 2, '件', 1, '大', 400, 800, 500, 0, '', 1, 'g000001 钢板_', 100, '安全库存'),
(4, '雨刮器', 'g000002', 100, '', 2, '件', 2, '中', 200, 400, 300, 0, '', 1, 'g000002 雨刮器_', 50, '危险库存'),
(5, '方向盘锁', 'g000003', 0, '', 1, '个', 3, '小', 50, 100, 70, 0, '', 1, 'g000003 方向盘锁_', 200, '严重缺货'),
(6, '胎压监视系统', 'g000004', 0, '', 7, '套', 1, '大', 800, 1500, 900, 0, '', 1, 'g000004 胎压监视系统_', 50, '严重缺货'),
(7, '离合器', 'g000005', 500, '', 2, '件', 2, '中', 500, 800, 650, 0, '', 1, 'g000005 离合器_', 100, '安全库存'),
(8, '火花塞', 'g000006', 400, '', 1, '个', 3, '小', 5, 10, 5, 0, '', 1, 'g000006 火花塞_', 800, '危险库存'),
(9, '润滑油', 'g000007', 500, '', 8, '桶', 2, '中', 70, 100, 80, 0, '', 1, 'g000007 润滑油_', 100, '安全库存');

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoi`
--

CREATE TABLE IF NOT EXISTS `ci_invoi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactname` varchar(50) DEFAULT '',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `username` varchar(50) DEFAULT '' COMMENT '制单人',
  `type` tinyint(1) DEFAULT '1' COMMENT '1其他入库  2盘盈  3其他出库  4盘亏',
  `typename` varchar(20) DEFAULT '',
  `totalamount` double DEFAULT '0' COMMENT '金额',
  `totalqty` double DEFAULT '0',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `billtype` tinyint(1) DEFAULT '1' COMMENT '1入库  2出库',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='其他入库、出库记录' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ci_invoi`
--

INSERT INTO `ci_invoi` (`id`, `contactid`, `contactname`, `billno`, `uid`, `username`, `type`, `typename`, `totalamount`, `totalqty`, `billdate`, `description`, `billtype`, `status`) VALUES
(2, 21, 's000003 爱信精机', 'XS201601151553324', 1, '罗经理', 1, '', 500, 1, '2016-01-15', '', 1, 0),
(1, 29, 'c000006 广东前锋汽车修理厂', 'XS201601151529471', 1, '罗经理', 1, '', 10000, 100, '2016-01-15', '', 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invoi_info`
--

CREATE TABLE IF NOT EXISTS `ci_invoi_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiid` int(11) DEFAULT '0',
  `contactno` varchar(50) DEFAULT '' COMMENT '供应商编号',
  `contactid` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactname` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `type` tinyint(1) DEFAULT '1' COMMENT '1其他入库 2盘盈 3其他出库 4盘亏',
  `typename` varchar(20) DEFAULT '',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `goodsno` varchar(50) DEFAULT '' COMMENT '商品编号',
  `goodsid` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `qty` double DEFAULT '0' COMMENT '数量',
  `billtype` tinyint(1) DEFAULT '1' COMMENT '1入库 2出库',
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`),
  KEY `type` (`type`),
  KEY `billdate` (`billdate`),
  KEY `type,billdate` (`type`,`billdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='其他入库、出库明细' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ci_invoi_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `ci_invoi_type`
--

CREATE TABLE IF NOT EXISTS `ci_invoi_type` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `inout` tinyint(1) DEFAULT '1' COMMENT '1 入库  -1出库',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(10) DEFAULT '',
  `default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='其他入库类型' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ci_invoi_type`
--

INSERT INTO `ci_invoi_type` (`id`, `name`, `inout`, `status`, `type`, `default`) VALUES
(1, '其他入库', 1, 1, 'in', 1),
(2, '盘盈', 1, 1, 'in', 0),
(3, '其他出库', -1, 1, 'out', 1),
(4, '盘亏', -1, 1, 'out', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invpu`
--

CREATE TABLE IF NOT EXISTS `ci_invpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactname` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `username` varchar(50) DEFAULT '' COMMENT '制单人',
  `type` tinyint(1) DEFAULT '1' COMMENT '1购货 2退货',
  `totalamount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpamount` double DEFAULT '0' COMMENT '已付款金额',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disrate` double DEFAULT '0' COMMENT '折扣率',
  `disamount` double DEFAULT '0' COMMENT '折扣金额',
  `totalqty` double DEFAULT '0' COMMENT '总数量',
  `totalarrears` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='采购记录' AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `ci_invpu`
--

INSERT INTO `ci_invpu` (`id`, `contactid`, `contactname`, `billno`, `uid`, `username`, `type`, `totalamount`, `amount`, `rpamount`, `billdate`, `description`, `arrears`, `disrate`, `disamount`, `totalqty`, `totalarrears`) VALUES
(48, 21, 's000003 爱信精机', 'CG201601151553327', 1, '罗经理', 1, 500, 500, 0, '2016-01-15', '', 500, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invpu_info`
--

CREATE TABLE IF NOT EXISTS `ci_invpu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invpuid` int(11) DEFAULT '0' COMMENT '关联ID',
  `contactno` varchar(50) DEFAULT '' COMMENT '供应商编号',
  `contactid` smallint(6) DEFAULT '0' COMMENT '供应商ID',
  `contactname` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `type` tinyint(1) DEFAULT '1' COMMENT '1采购 2退货',
  `amount` double DEFAULT '0' COMMENT '购货金额',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `goodsno` varchar(50) DEFAULT '' COMMENT '商品编号',
  `goodsid` int(11) DEFAULT '0' COMMENT '商品ID',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountrate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`),
  KEY `type` (`type`),
  KEY `billdate` (`billdate`),
  KEY `type,billdate` (`type`,`billdate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='采购明细' AUTO_INCREMENT=55 ;

--
-- 转存表中的数据 `ci_invpu_info`
--

INSERT INTO `ci_invpu_info` (`id`, `invpuid`, `contactno`, `contactid`, `contactname`, `billno`, `type`, `amount`, `billdate`, `description`, `goodsno`, `goodsid`, `price`, `deduction`, `discountrate`, `qty`) VALUES
(54, 48, '', 21, 's000003 爱信精机', 'CG201601151553327', 1, 500, '2016-01-15', '', 'g000005', 7, 500, 0, 0, 1),
(53, 47, '', 19, 's000001 博世', 'CG201601151437068', 1, 10000, '2016-01-15', '', 'g000003', 5, 50, 0, 0, 200),
(52, 46, '', 19, 's000001 博世', 'CG201601151419119', 1, 10000, '2016-01-15', '', 'g000003', 5, 50, 0, 0, 200),
(51, 45, '', 23, 's000005 江森自控', 'CG201601151408459', 1, 10000, '2016-01-15', '', 'g000003', 5, 50, 0, 0, 200);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invsa`
--

CREATE TABLE IF NOT EXISTS `ci_invsa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` smallint(6) unsigned zerofill DEFAULT NULL COMMENT '供应商ID',
  `contactname` varchar(50) DEFAULT '' COMMENT '供应商名称',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `uid` smallint(6) DEFAULT '0',
  `username` varchar(50) DEFAULT '' COMMENT '制单人',
  `type` tinyint(1) DEFAULT '1' COMMENT '1销货 2退货',
  `totalamount` double DEFAULT '0' COMMENT '购货总金额',
  `amount` double DEFAULT '0' COMMENT '折扣后金额',
  `rpamount` double DEFAULT '0' COMMENT '已付款金额',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(100) DEFAULT '' COMMENT '备注',
  `arrears` double DEFAULT '0' COMMENT '本次欠款',
  `disrate` double DEFAULT '0' COMMENT '折扣率',
  `disamount` double DEFAULT '0' COMMENT '折扣金额',
  `totalqty` double DEFAULT '0' COMMENT '总数量',
  `totalarrears` double DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='销售记录' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `ci_invsa`
--

INSERT INTO `ci_invsa` (`id`, `contactid`, `contactname`, `billno`, `uid`, `username`, `type`, `totalamount`, `amount`, `rpamount`, `billdate`, `description`, `arrears`, `disrate`, `disamount`, `totalqty`, `totalarrears`, `status`) VALUES
(31, 000029, 'c000006 广东前锋汽车修理厂', 'XS201601151529479', 1, '罗经理', 1, 10000, 10000, 0, '2016-01-15', '', 10000, 0, 0, 100, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_invsa_info`
--

CREATE TABLE IF NOT EXISTS `ci_invsa_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invsaid` int(11) DEFAULT '0' COMMENT '关联ID',
  `contactid` smallint(6) DEFAULT '0' COMMENT '客户ID',
  `contactno` varchar(50) DEFAULT '' COMMENT '客户编号',
  `contactname` varchar(50) DEFAULT '' COMMENT '客户名称',
  `billno` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '单据编号',
  `type` tinyint(1) DEFAULT '1' COMMENT '1销售 2退货',
  `amount` double DEFAULT '0' COMMENT '销货金额',
  `billdate` date DEFAULT NULL COMMENT '单据日期',
  `description` varchar(50) DEFAULT '' COMMENT '备注',
  `goodsid` int(11) DEFAULT '0' COMMENT '商品ID',
  `goodsno` varchar(50) DEFAULT '' COMMENT '商品编号',
  `price` double DEFAULT '0' COMMENT '单价',
  `deduction` double DEFAULT '0' COMMENT '折扣额',
  `discountrate` double DEFAULT '0' COMMENT '折扣率',
  `qty` double DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `goodsid` (`goodsid`),
  KEY `type` (`type`),
  KEY `type,billdate` (`type`,`billdate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='采购明细' AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `ci_invsa_info`
--

INSERT INTO `ci_invsa_info` (`id`, `invsaid`, `contactid`, `contactno`, `contactname`, `billno`, `type`, `amount`, `billdate`, `description`, `goodsid`, `goodsno`, `price`, `deduction`, `discountrate`, `qty`) VALUES
(37, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151433146', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(24, 3, 24, '', 'c000001 广汇汽车服务股份公司', 'XS201601150247011', 1, 1500, '2016-01-15', '', 6, 'g000004', 1500, 0, 0, 1),
(25, 4, 25, '', 'c000002 国机汽车股份有限公司', 'XS201601150302518', 1, 100, '2016-01-15', '', 5, 'g000003', 100, 0, 0, 1),
(26, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601150305310', 1, 800, '2016-01-15', '', 3, 'g000001', 800, 0, 0, 1),
(35, 0, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151428156', 1, 100, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 1),
(36, 0, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151431042', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(27, 1, 28, '', 'c000005 鸿粤汽车销售集团有限公司', 'XS201601151213132', 1, 10, '2016-01-15', '', 8, 'g000006', 10, 0, 0, 1),
(28, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151220316', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(29, 1, 27, '', 'c000004 浙江和诚汽车有限公司', 'XS201601151340023', 1, 10000, '2016-01-15', '', 5, 'g000003', 100, 0, 0, 100),
(30, 0, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151352303', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(31, 0, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151406593', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(32, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151414492', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(33, 0, 27, '', 'c000004 浙江和诚汽车有限公司', 'XS201601151417491', 1, 100, '2016-01-15', '', 5, 'g000003', 100, 0, 0, 1),
(34, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151421556', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100),
(38, 0, 27, '', 'c000004 浙江和诚汽车有限公司', 'XS201601151435576', 1, 100, '2016-01-15', '', 5, 'g000003', 100, 0, 0, 1),
(39, 1, 29, '', 'c000006 广东前锋汽车修理厂', 'XS201601151529479', 1, 10000, '2016-01-15', '', 9, 'g000007', 100, 0, 0, 100);

-- --------------------------------------------------------

--
-- 表的结构 `ci_lack_info`
--

CREATE TABLE IF NOT EXISTS `ci_lack_info` (
  `id` int(11) NOT NULL,
  `lackno` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `contactorderid` int(11) NOT NULL,
  `goodsname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `goodsno` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lackqty` double NOT NULL,
  `contactdate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='缺货信息';

--
-- 转存表中的数据 `ci_lack_info`
--

INSERT INTO `ci_lack_info` (`id`, `lackno`, `contactorderid`, `goodsname`, `goodsno`, `lackqty`, `contactdate`) VALUES
(1, 'XS201601151370023', 1, '方向盘锁', 'g000003', 100, '2016-01-15');

-- --------------------------------------------------------

--
-- 表的结构 `ci_log`
--

CREATE TABLE IF NOT EXISTS `ci_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` smallint(6) DEFAULT '0' COMMENT '用户ID',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '姓名',
  `log` varchar(50) DEFAULT '' COMMENT '日志内容',
  `type` tinyint(1) DEFAULT '1' COMMENT ' ',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `modifytime` datetime DEFAULT NULL COMMENT '写入日期',
  `adddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='操作日志' AUTO_INCREMENT=261 ;

--
-- 转存表中的数据 `ci_log`
--

INSERT INTO `ci_log` (`id`, `userid`, `name`, `log`, `type`, `username`, `modifytime`, `adddate`) VALUES
(260, 1, '罗经理', '新增购货单 单据编号：CG201601151553327', 1, 'admin', '2016-01-15 15:53:32', '2016-01-15'),
(259, 1, '罗经理', '转为销售帐', 1, 'admin', '2016-01-15 15:52:50', '2016-01-15'),
(258, 1, '罗经理', '确认出库', 1, 'admin', '2016-01-15 15:52:35', '2016-01-15'),
(257, 1, '罗经理', '新增销货单 单据编号：XS201601151529479', 1, 'admin', '2016-01-15 15:29:47', '2016-01-15'),
(255, 1, '罗经理', '确认入库', 1, 'admin', '2016-01-15 14:37:36', '2016-01-15'),
(256, 1, '罗经理', '转为销售帐', 1, 'admin', '2016-01-15 14:37:55', '2016-01-15'),
(254, 1, '罗经理', '新增购货单 单据编号：CG201601151437068', 1, 'admin', '2016-01-15 14:37:06', '2016-01-15'),
(253, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 14:36:35', '2016-01-15'),
(252, 6, '王曌', '转为销售帐', 1, 'wangzhao', '2016-01-15 14:35:19', '2016-01-15'),
(251, 6, '王曌', '确认出库', 1, 'wangzhao', '2016-01-15 14:35:01', '2016-01-15'),
(245, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 14:18:27', '2016-01-15'),
(246, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:23:47', '2016-01-15'),
(247, 6, '王曌', '确认出库', 1, 'wangzhao', '2016-01-15 14:24:07', '2016-01-15'),
(248, 6, '王曌', '删除其他出库 单据编号：XS201601151421559', 1, 'wangzhao', '2016-01-15 14:31:53', '2016-01-15'),
(249, 6, '王曌', '新增销货单 单据编号：XS201601151433146', 1, 'wangzhao', '2016-01-15 14:33:14', '2016-01-15'),
(250, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:34:46', '2016-01-15'),
(244, 6, '王曌', '转为销售帐', 1, 'wangzhao', '2016-01-15 14:17:16', '2016-01-15'),
(243, 6, '王曌', '确认出库', 1, 'wangzhao', '2016-01-15 14:16:54', '2016-01-15'),
(242, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:16:31', '2016-01-15'),
(241, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:11:24', '2016-01-15'),
(240, 1, '罗经理', '确认入库', 1, 'admin', '2016-01-15 14:09:18', '2016-01-15'),
(239, 1, '罗经理', '新增购货单 单据编号：CG201601151408459', 1, 'admin', '2016-01-15 14:08:45', '2016-01-15'),
(238, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 14:08:07', '2016-01-15'),
(237, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:02:30', '2016-01-15'),
(236, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 14:01:09', '2016-01-15'),
(235, 6, '王曌', '确认出库', 1, 'wangzhao', '2016-01-15 13:56:13', '2016-01-15'),
(233, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 13:51:16', '2016-01-15'),
(234, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 13:55:48', '2016-01-15'),
(232, 1, '罗经理', '删除销货单 单据编号：XS201601151220316', 1, 'admin', '2016-01-15 13:42:21', '2016-01-15'),
(231, 1, '罗经理', '删除销货单 单据编号：XS201601151340023', 1, 'admin', '2016-01-15 13:42:17', '2016-01-15'),
(230, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 13:41:59', '2016-01-15'),
(216, 1, '罗经理', '转为销售帐', 1, 'admin', '2016-01-15 12:12:18', '2016-01-15'),
(217, 1, '罗经理', '新增销货单 单据编号：XS201601151213132', 1, 'admin', '2016-01-15 12:13:13', '2016-01-15'),
(218, 1, '罗经理', '确认出库', 1, 'admin', '2016-01-15 12:14:21', '2016-01-15'),
(219, 1, '罗经理', '新增购货单 单据编号：CG201601151216276', 1, 'admin', '2016-01-15 12:16:27', '2016-01-15'),
(220, 1, '罗经理', '删除销货单 单据编号：XS201601151213132', 1, 'admin', '2016-01-15 12:19:39', '2016-01-15'),
(221, 1, '罗经理', '新增销货单 单据编号：XS201601151220316', 1, 'admin', '2016-01-15 12:20:31', '2016-01-15'),
(222, 1, '罗经理', '确认出库', 1, 'admin', '2016-01-15 12:20:47', '2016-01-15'),
(223, 1, '罗经理', '转为销售帐', 1, 'admin', '2016-01-15 12:21:25', '2016-01-15'),
(224, 3, '周全', '登陆成功 用户名：zhouquan', 1, 'zhouquan', '2016-01-15 12:48:44', '2016-01-15'),
(225, 4, '臧艺泽', '登陆成功 用户名：zangyize', 1, 'zangyize', '2016-01-15 12:49:25', '2016-01-15'),
(226, 5, '关钦玉', '登陆成功 用户名：guanqinyu', 1, 'guanqinyu', '2016-01-15 12:49:59', '2016-01-15'),
(227, 6, '王曌', '登陆成功 用户名：wangzhao', 1, 'wangzhao', '2016-01-15 12:50:38', '2016-01-15'),
(228, 7, '袁春宇', '登陆成功 用户名：yuanchunyu', 1, 'yuanchunyu', '2016-01-15 12:51:23', '2016-01-15'),
(229, 1, '罗经理', '登陆成功 用户名：admin', 1, 'admin', '2016-01-15 12:51:45', '2016-01-15');

-- --------------------------------------------------------

--
-- 表的结构 `ci_menu`
--

CREATE TABLE IF NOT EXISTS `ci_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '导航栏目',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目名称',
  `pid` smallint(5) DEFAULT '0' COMMENT '上级栏目ID',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '栏目路径',
  `depth` tinyint(2) DEFAULT '1' COMMENT '层次',
  `ordnum` smallint(6) DEFAULT '0' COMMENT '排序',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '外部链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='导航管理' AUTO_INCREMENT=85 ;

--
-- 转存表中的数据 `ci_menu`
--

INSERT INTO `ci_menu` (`id`, `title`, `pid`, `path`, `depth`, `ordnum`, `url`, `status`) VALUES
(1, '购货单', 1, '1', 1, 99, '', 1),
(2, '新增', 1, '1,2', 2, 99, '', 1),
(3, '修改', 1, '1,3', 2, 99, '', 1),
(4, '删除', 1, '1,4', 2, 99, '', 1),
(5, '导出', 1, '1,5', 2, 99, '', 1),
(6, '销货单', 6, '6', 1, 99, '', 1),
(7, '新增', 6, '6,7', 2, 99, '', 1),
(8, '修改', 6, '6,8', 2, 99, '', 1),
(9, '删除', 6, '6,9', 2, 99, '', 1),
(10, '导出', 6, '6,10', 2, 99, '', 1),
(11, '盘点', 11, '11', 1, 99, '', 1),
(12, '生成盘点记录', 11, '11,12', 2, 99, '', 1),
(13, '导出', 11, '11,13', 2, 99, '', 1),
(14, '其他入库', 14, '14', 1, 99, '', 1),
(15, '新增', 14, '14,15', 2, 99, '', 1),
(16, '修改', 14, '14,16', 2, 99, '', 1),
(17, '删除', 14, '14,17', 2, 99, '', 1),
(18, '其他出库', 18, '18', 1, 99, '', 1),
(19, '新增', 18, '18,19', 2, 99, '', 1),
(20, '修改', 18, '18,20', 2, 99, '', 1),
(21, '删除', 18, '18,21', 2, 99, '', 1),
(22, '采购明细表', 22, '22', 1, 99, '', 1),
(23, '导出', 22, '22,23', 2, 99, '', 1),
(24, '打印', 22, '22,24', 2, 99, '', 1),
(25, '采购汇总表（按商品）', 25, '25', 1, 99, '', 1),
(26, '导出', 25, '25,26', 2, 99, '', 1),
(27, '打印', 25, '25,27', 2, 99, '', 1),
(28, '采购汇总表（按供应商）', 28, '28', 1, 99, '', 1),
(29, '导出', 28, '28,29', 2, 99, '', 1),
(30, '打印', 28, '28,30', 2, 99, '', 1),
(31, '销售明细表', 31, '31', 1, 99, '', 1),
(32, '导出', 31, '31,32', 2, 99, '', 1),
(33, '打印', 31, '31,33', 2, 99, '', 1),
(34, '销售汇总表（按商品）', 34, '34', 1, 99, '', 1),
(35, '导出', 34, '34,35', 2, 99, '', 1),
(36, '打印', 34, '34,36', 2, 99, '', 1),
(37, '销售汇总表（按客户）', 37, '37', 1, 99, '', 1),
(38, '导出', 37, '37,38', 2, 99, '', 1),
(39, '打印', 37, '37,39', 2, 99, '', 1),
(40, '商品库存余额表', 40, '40', 1, 99, '', 1),
(41, '导出', 40, '40,41', 2, 99, '', 1),
(42, '打印', 40, '40,42', 2, 99, '', 1),
(43, '商品收发明细表', 43, '43', 1, 99, '', 1),
(44, '导出', 43, '43,44', 2, 99, '', 1),
(45, '打印', 43, '43,45', 2, 99, '', 1),
(46, '商品收发汇总表', 46, '46', 1, 99, '', 1),
(47, '导出', 46, '46,47', 2, 99, '', 1),
(48, '打印', 46, '46,48', 2, 99, '', 1),
(49, '往来单位欠款表', 49, '49', 1, 99, '', 1),
(50, '导出', 49, '49,50', 2, 99, '', 1),
(51, '打印', 49, '49,51', 2, 99, '', 1),
(52, '应付账款明细表', 52, '52', 1, 99, '', 1),
(53, '导出', 52, '52,53', 2, 99, '', 1),
(54, '打印', 52, '52,54', 2, 99, '', 1),
(55, '应收账款明细表', 55, '55', 1, 99, '', 1),
(56, '导出', 55, '55,56', 2, 99, '', 1),
(57, '打印', 55, '55,57', 2, 99, '', 1),
(58, '客户管理', 58, '58', 1, 99, '', 1),
(59, '新增', 58, '58,59', 2, 99, '', 1),
(60, '修改', 58, '58,60', 2, 99, '', 1),
(61, '删除', 58, '58,61', 2, 99, '', 1),
(62, '导出', 58, '58,62', 2, 99, '', 1),
(63, '供应商管理', 63, '63', 1, 99, '', 1),
(64, '新增', 63, '63,64', 2, 99, '', 1),
(65, '修改', 63, '63,65', 2, 99, '', 1),
(66, '删除', 63, '63,66', 2, 99, '', 1),
(67, '导出', 63, '63,67', 2, 99, '', 1),
(68, '商品管理', 68, '68', 1, 99, '', 1),
(69, '新增', 68, '68,69', 2, 99, '', 1),
(70, '修改', 68, '68,70', 2, 99, '', 1),
(71, '删除', 68, '68,71', 2, 99, '', 1),
(72, '导出', 68, '68,72', 2, 99, '', 1),
(73, '客户类别', 73, '73', 1, 99, '', 1),
(74, '新增', 73, '73,74', 2, 99, '', 1),
(75, '修改', 73, '73,75', 2, 99, '', 1),
(76, '删除', 73, '73,76', 2, 99, '', 1),
(77, '计量单位', 77, '77', 1, 99, '', 1),
(78, '新增', 77, '77,78', 2, 99, '', 1),
(79, '修改', 77, '77,79', 2, 99, '', 1),
(80, '删除', 77, '77,80', 2, 99, '', 1),
(81, '系统参数', 81, '81', 1, 99, '', 1),
(82, '权限设置', 82, '82', 1, 99, '', 1),
(83, '操作日志', 83, '83', 1, 99, '', 1),
(84, '数据备份', 84, '84', 1, 99, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ci_money`
--

CREATE TABLE IF NOT EXISTS `ci_money` (
  `id` int(11) NOT NULL,
  `moneyid` varchar(25) CHARACTER SET utf8 NOT NULL,
  `contanctid` smallint(6) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `needmoney` double DEFAULT NULL,
  `paidmoney` double DEFAULT NULL,
  `contactname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `ci_money`
--

INSERT INTO `ci_money` (`id`, `moneyid`, `contanctid`, `type`, `needmoney`, `paidmoney`, `contactname`, `billdate`, `remark`) VALUES
(1, 'CG201601151553325', NULL, 3, 500, NULL, 's000003 爱信精机', '2016-01-15', NULL),
(2, 'CG201601151529479', NULL, 2, 10000, NULL, 'c000006 广东前锋汽车修理厂', '2016-01-15', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ci_unit`
--

CREATE TABLE IF NOT EXISTS `ci_unit` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '客户名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='计量单位' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `ci_unit`
--

INSERT INTO `ci_unit` (`id`, `name`, `status`) VALUES
(1, '个', 1),
(2, '件', 1),
(3, '斤', 1),
(4, '包', 1),
(5, '台', 1),
(6, '箱', 1),
(7, '套', 1),
(8, '桶', 1),
(9, '辆', 1);
