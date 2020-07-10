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

Date: 2020-06-24 11:38:49
*/


-- ----------------------------
-- Table structure for devicesw
-- ----------------------------
DROP TABLE IF EXISTS "public"."devicesw";
CREATE TABLE "public"."devicesw" (
"id" int4 DEFAULT nextval('devicesw_id_seq'::regclass) NOT NULL,
"softwarename" varchar(64) COLLATE "default",
"erpcode" varchar(32) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"remark" varchar(512) COLLATE "default",
"status" int4,
"createtime" timestamp(6),
"moditytime" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table devicesw
-- ----------------------------
ALTER TABLE "public"."devicesw" ADD PRIMARY KEY ("id");
