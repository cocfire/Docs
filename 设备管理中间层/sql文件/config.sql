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

Date: 2020-12-31 17:49:51
*/


-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS "public"."config";
CREATE TABLE "public"."config" (
"id" int4 DEFAULT nextval('config_id_seq'::regclass) NOT NULL,
"name" varchar(256) COLLATE "default",
"type" int4,
"configid" int4,
"configinfo" varchar(255) COLLATE "default",
"createtime" timestamp(6),
"modifytime" timestamp(0),
"status" int4,
"remark" varchar(256) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table config
-- ----------------------------
ALTER TABLE "public"."config" ADD PRIMARY KEY ("id");
