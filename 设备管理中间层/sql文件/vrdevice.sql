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

Date: 2020-07-10 16:54:09
*/


-- ----------------------------
-- Table structure for vrdevice
-- ----------------------------
DROP TABLE IF EXISTS "public"."vrdevice";
CREATE TABLE "public"."vrdevice" (
"id" int4 DEFAULT nextval('vrdevice_id_seq'::regclass) NOT NULL,
"vrdeviceid" varchar(256) COLLATE "default",
"name" varchar(128) COLLATE "default",
"type" varchar(16) COLLATE "default",
"info" varchar(2048) COLLATE "default",
"remark" varchar(512) COLLATE "default",
"status" int4,
"createtime" timestamp(6),
"updatetime" timestamp(6),
"link" varchar(1024) COLLATE "default",
"version" varchar(16) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table vrdevice
-- ----------------------------
ALTER TABLE "public"."vrdevice" ADD PRIMARY KEY ("id");
