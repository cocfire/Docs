/*
Navicat PGSQL Data Transfer

Source Server         : 172.16.42.104
Source Server Version : 90603
Source Host           : 172.16.42.104:5432
Source Database       : dmil
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2020-08-13 15:12:57
*/


-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS "public"."programs";
CREATE TABLE "public"."programs" (
"id" int4 DEFAULT nextval('program_id_seq'::regclass) NOT NULL,
"name" varchar(256) COLLATE "default",
"type" int4,
"fileids" varchar(1024) COLLATE "default",
"timelast" varchar(1024) COLLATE "default",
"starttime" timestamp(6),
"endtime" timestamp(6),
"createtime" timestamp(6),
"modifytime" timestamp(6),
"fitmodel" varchar(1024) COLLATE "default",
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table programs
-- ----------------------------
ALTER TABLE "public"."programs" ADD PRIMARY KEY ("id");
