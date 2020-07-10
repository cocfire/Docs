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

Date: 2020-06-10 18:34:48
*/


-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
"id" int4 DEFAULT nextval('menu_id_seq'::regclass) NOT NULL,
"name" varchar(1024) COLLATE "default",
"rank" int4,
"pid" int4,
"menuorder" varchar(255) COLLATE "default",
"path" varchar(255) COLLATE "default",
"createtime" timestamp(6),
"modifytime" timestamp(6),
"status" int4,
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD PRIMARY KEY ("id");
