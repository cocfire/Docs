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

Date: 2020-05-20 18:09:11
*/


-- ----------------------------
-- Sequence structure for device_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."device_id_seq";
CREATE SEQUENCE "public"."device_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."device_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for msg_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."msg_id_seq";
CREATE SEQUENCE "public"."msg_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."msg_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for software_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."software_id_seq";
CREATE SEQUENCE "public"."software_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."software_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for syslog_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."syslog_id_seq";
CREATE SEQUENCE "public"."syslog_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."syslog_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_id_seq";
CREATE SEQUENCE "public"."user_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1000
 CACHE 1;
SELECT setval('"public"."user_id_seq"', 1000, true);

-- ----------------------------
-- Sequence structure for menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."menu_id_seq";
CREATE SEQUENCE "public"."menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."menu_id_seq"', 10, true);

-- ----------------------------
-- Sequence structure for devicesw_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."devicesw_id_seq";
CREATE SEQUENCE "public"."devicesw_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."devicesw_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for vrdevice_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."vrdevice_id_seq";
CREATE SEQUENCE "public"."vrdevice_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."vrdevice_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for file_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."file_id_seq";
CREATE SEQUENCE "public"."file_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."file_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for program_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."program_id_seq";
CREATE SEQUENCE "public"."program_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."program_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for data_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."data_id_seq";
CREATE SEQUENCE "public"."data_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."data_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for config_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."config_id_seq";
CREATE SEQUENCE "public"."config_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."config_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for param_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."param_id_seq";
CREATE SEQUENCE "public"."param_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."param_id_seq"', 1, true);

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS "public"."device";
CREATE TABLE "public"."device" (
"id" int4 DEFAULT nextval('device_id_seq'::regclass) NOT NULL,
"clientid" varchar(256) COLLATE "default",
"termsn" varchar(256) COLLATE "default" NOT NULL,
"termid" varchar(64) COLLATE "default",
"termcode" varchar(64) COLLATE "default",
"termtype" int4,
"terminfo" varchar(256) COLLATE "default",
"macaddress" varchar(64) COLLATE "default",
"hardwarename" varchar(32) COLLATE "default",
"machinetype" varchar(64) COLLATE "default",
"licencecode" varchar(32) COLLATE "default",
"softwarename" varchar(64) COLLATE "default",
"erpcode" varchar(32) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"orderid" varchar(16) COLLATE "default",
"projectid" int4,
"projectname" varchar(32) COLLATE "default",
"companyid" int4,
"companyname" varchar(256) COLLATE "default",
"clientname" varchar(64) COLLATE "default",
"clientcode" varchar(32) COLLATE "default",
"contact" varchar(32) COLLATE "default",
"address" varchar(256) COLLATE "default",
"telno" varchar(32) COLLATE "default",
"remark" varchar(512) COLLATE "default",
"status" int4,
"createtime" timestamp(6),
"moditytime" timestamp(6),
"updatetime" timestamp(6),
"link" varchar(1024) COLLATE "default",
"termmodel" varchar(64) COLLATE "default",
"lanip" varchar(32) COLLATE "default",
"wifiip" varchar(32) COLLATE "default",
"emqversion" varchar(16) COLLATE "default",
"deviceid" varchar(256) COLLATE "default",
"imei" varchar(256) COLLATE "default",
"udid" varchar(256) COLLATE "default",
"uuid" varchar(256) COLLATE "default",
"barcode" varchar(32) COLLATE "default",
"facelibrid" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."device"."facelibrid" IS '人脸库id';

-- ----------------------------
-- Records of device
-- ----------------------------

-- ----------------------------
-- Table structure for offlinemsg
-- ----------------------------
DROP TABLE IF EXISTS "public"."offlinemsg";
CREATE TABLE "public"."offlinemsg" (
"id" int4 DEFAULT nextval('msg_id_seq'::regclass) NOT NULL,
"topic" varchar(512) COLLATE "default",
"message" varchar(10240) COLLATE "default",
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
-- Records of offlinemsg
-- ----------------------------

-- ----------------------------
-- Table structure for software
-- ----------------------------
DROP TABLE IF EXISTS "public"."software";
CREATE TABLE "public"."software" (
"id" int4 DEFAULT nextval('software_id_seq'::regclass) NOT NULL,
"softwarename" varchar(256) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"uploadtime" timestamp(6),
"size" varchar(16) COLLATE "default",
"customername" varchar(512) COLLATE "default",
"downstatus" int4,
"createtime" timestamp(6),
"moditytime" timestamp(6),
"uploadsoftwarename" varchar(64) COLLATE "default",
"erpcode" varchar(32) COLLATE "default",
"filetimestamp" varchar(16) COLLATE "default",
"softwaretype" varchar(16) COLLATE "default",
"signflag" varchar(16) COLLATE "default",
"qrcode" varchar(32) COLLATE "default",
"qrpath" varchar(512) COLLATE "default",
"fitmodel" varchar(10240) COLLATE "default",
"remark" varchar(1024) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of software
-- ----------------------------

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS "public"."syslog";
CREATE TABLE "public"."syslog" (
"id" int4 DEFAULT nextval('syslog_id_seq'::regclass) NOT NULL,
"option" varchar(128) COLLATE "default",
"type" int4,
"loginfo" varchar(10240) COLLATE "default",
"timestamp" timestamp(6),
"userid" int4,
"userip" varchar(64) COLLATE "default",
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of syslog
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."userinfo";
CREATE TABLE "public"."userinfo" (
"id" int4 DEFAULT nextval('user_id_seq'::regclass) NOT NULL,
"openid" int4,
"username" varchar(64) COLLATE "default",
"realname" varchar(64) COLLATE "default",
"password" varchar(128) COLLATE "default",
"phone" varchar(32) COLLATE "default",
"createtime" timestamp(6),
"modifytime" timestamp(6),
"status" int4,
"counts" int4,
"lastloginip" varchar(64) COLLATE "default",
"lastlogintime" timestamp(6),
"company" varchar(128) COLLATE "default",
"project" varchar(128) COLLATE "default",
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;


-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO "public"."userinfo" VALUES ('888', null, 'admin', null, '4a78b66a0e09850c6f9c5a3d58a43205', null, '2020-04-28 03:42:22.984', '2020-05-19 16:56:05.319', '1', '0', '0:0:0:0:0:0:0:1', '2020-05-19 16:56:05.319', null, '0', null);


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
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for devicesw
-- ----------------------------
DROP TABLE IF EXISTS "public"."devicesw";
CREATE TABLE "public"."devicesw" (
"id" int4 DEFAULT nextval('devicesw_id_seq'::regclass) NOT NULL,
"deviceid" int4,
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
-- Records of devicesw
-- ----------------------------

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
-- Records of vrdevice
-- ----------------------------

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
"fitmodel" varchar(10240) COLLATE "default",
"remark" varchar(512) COLLATE "default",
"userid" int4
)
WITH (OIDS=FALSE)

;
-- ----------------------------
-- Records of fileinfo
-- ----------------------------

-- ----------------------------
-- Table structure for programs
-- ----------------------------
DROP TABLE IF EXISTS "public"."programs";
CREATE TABLE "public"."programs" (
"id" int4 DEFAULT nextval('program_id_seq'::regclass) NOT NULL,
"name" varchar(256) COLLATE "default",
"type" int4,
"fileids" varchar(10240) COLLATE "default",
"timelast" varchar(10240) COLLATE "default",
"starttime" timestamp(6),
"endtime" timestamp(6),
"createtime" timestamp(6),
"modifytime" timestamp(6),
"fitmodel" varchar(10240) COLLATE "default",
"remark" varchar(10240) COLLATE "default",
"createuser" int4,
"companyid" int4,
"projectid" int4
)
WITH (OIDS=FALSE)

;
-- ----------------------------
-- Records of programs
-- ----------------------------

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
-- Primary Key structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table offlinemsg
-- ----------------------------
ALTER TABLE "public"."offlinemsg" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table software
-- ----------------------------
ALTER TABLE "public"."software" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table syslog
-- ----------------------------
ALTER TABLE "public"."syslog" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table userinfo
-- ----------------------------
ALTER TABLE "public"."userinfo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table devicesw
-- ----------------------------
ALTER TABLE "public"."devicesw" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vrdevice
-- ----------------------------
ALTER TABLE "public"."vrdevice" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fileinfo
-- ----------------------------
ALTER TABLE "public"."fileinfo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table programs
-- ----------------------------
ALTER TABLE "public"."programs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table datastats
-- ----------------------------
ALTER TABLE "public"."datastats" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table config
-- ----------------------------
ALTER TABLE "public"."config" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table paraminfo
-- ----------------------------
ALTER TABLE "public"."paraminfo" ADD PRIMARY KEY ("id");