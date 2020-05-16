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

Date: 2020-05-16 16:01:59
*/


-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS "public"."syslog";
CREATE TABLE "public"."syslog" (
"id" int4 DEFAULT nextval('syslog_id_seq'::regclass) NOT NULL,
"option" varchar(128) COLLATE "default",
"type" int4,
"loginfo" varchar(64) COLLATE "default",
"timestamp" timestamp(6),
"userid" int4,
"userip" varchar(64) COLLATE "default",
"remark" varchar(1024) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table syslog
-- ----------------------------
ALTER TABLE "public"."syslog" ADD PRIMARY KEY ("id");
