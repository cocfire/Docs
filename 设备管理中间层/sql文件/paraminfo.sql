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

Date: 2020-12-31 17:49:58
*/


-- ----------------------------
-- Table structure for paraminfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."paraminfo";
CREATE TABLE "public"."paraminfo" (
"id" int4 DEFAULT nextval('param_id_seq'::regclass) NOT NULL,
"linkid" int4 NOT NULL,
"termsn" varchar(256) COLLATE "default",
"paramid" int4,
"paraminfo" varchar(1024) COLLATE "default",
"createtime" timestamp(6),
"modifytime" timestamp(6),
"status" int4,
"remark" varchar(256) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table paraminfo
-- ----------------------------
ALTER TABLE "public"."paraminfo" ADD PRIMARY KEY ("id");
