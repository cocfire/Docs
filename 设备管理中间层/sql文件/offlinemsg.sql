/*
Navicat PGSQL Data Transfer

Source Server         : 172.16.42.124
Source Server Version : 90603
Source Host           : 172.16.42.124:5432
Source Database       : dmil
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2020-05-16 15:56:36
*/


-- ----------------------------
-- Table structure for offlinemsg
-- ----------------------------
DROP TABLE IF EXISTS "public"."offlinemsg";
CREATE TABLE "public"."offlinemsg" (
"id" int4 DEFAULT nextval('msg_id_seq'::regclass) NOT NULL,
"topic" varchar(512) COLLATE "default",
"message" varchar(2048) COLLATE "default",
"createtime" timestamp(6),
"moditytime" timestamp(6),
"status" int4,
"counts" int4,
"remark" varchar(1024) COLLATE "default",
"clientid" varchar(256) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table offlinemsg
-- ----------------------------
ALTER TABLE "public"."offlinemsg" ADD PRIMARY KEY ("id");
