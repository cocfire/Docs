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

Date: 2020-08-13 15:12:49
*/


-- ----------------------------
-- Table structure for fileinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."fileinfo";
CREATE TABLE "public"."fileinfo" (
"id" int4 DEFAULT nextval('file_id_seq'::regclass) NOT NULL,
"filename" varchar(128) COLLATE "default",
"filesize" varchar(32) COLLATE "default",
"filetype" int4,
"filepath" varchar(512) COLLATE "default",
"uploadname" varchar(128) COLLATE "default",
"uploadtime" timestamp(6),
"downstatus" int4,
"md5size" varchar(32) COLLATE "default",
"fitmodel" varchar(1024) COLLATE "default",
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table fileinfo
-- ----------------------------
ALTER TABLE "public"."fileinfo" ADD PRIMARY KEY ("id");
