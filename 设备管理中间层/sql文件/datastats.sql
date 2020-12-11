/*
Navicat PGSQL Data Transfer

Source Server         : 172.16.43.94
Source Server Version : 90603
Source Host           : 172.16.43.94:5432
Source Database       : dmil
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2020-12-11 10:27:54
*/


-- ----------------------------
-- Table structure for datastats
-- ----------------------------
DROP TABLE IF EXISTS "public"."datastats";
CREATE TABLE "public"."datastats" (
"id" int4 DEFAULT nextval('data_id_seq'::regclass) NOT NULL,
"linktable" varchar(32) COLLATE "default",
"linkid" int4,
"linkinfo" varchar(128) COLLATE "default",
"infoa" int4,
"infob" varchar(1024) COLLATE "default",
"stats" varchar(1024) COLLATE "default",
"modifytime" timestamp(6),
"createtime" timestamp(0),
"remark" varchar(512) COLLATE "default",
"companyid" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table datastats
-- ----------------------------
ALTER TABLE "public"."datastats" ADD PRIMARY KEY ("id");
