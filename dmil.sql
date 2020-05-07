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

Date: 2020-05-07 13:58:53
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

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS "public"."device";
CREATE TABLE "public"."device" (
"id" int4 DEFAULT nextval('device_id_seq'::regclass) NOT NULL,
"clientid" varchar(64) COLLATE "default",
"termsn" varchar(64) COLLATE "default" NOT NULL,
"termid" varchar(64) COLLATE "default",
"termcode" varchar(64) COLLATE "default",
"termtype" int4,
"terminfo" varchar(256) COLLATE "default",
"macaddress" varchar(64) COLLATE "default",
"hardwarename" varchar(32) COLLATE "default",
"machinetype" varchar(16) COLLATE "default",
"licencecode" varchar(32) COLLATE "default",
"softwarename" varchar(64) COLLATE "default",
"erpcode" varchar(32) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"roderid" varchar(16) COLLATE "default",
"projectid" int4,
"projectname" varchar(32) COLLATE "default",
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
"deviceid" varchar(32) COLLATE "default",
"imei" varchar(64) COLLATE "default",
"udid" varchar(64) COLLATE "default",
"uuid" varchar(64) COLLATE "default",
"barcode" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of device
-- ----------------------------

-- ----------------------------
-- Table structure for offlinemsg
-- ----------------------------
DROP TABLE IF EXISTS "public"."offlinemsg";
CREATE TABLE "public"."offlinemsg" (
"id" int4 DEFAULT nextval('msg_id_seq'::regclass) NOT NULL,
"topic" varchar(64) COLLATE "default",
"message" varchar(1024) COLLATE "default",
"createtime" timestamp(6),
"moditytime" timestamp(6),
"status" int4,
"counts" int4,
"remark" varchar(256) COLLATE "default"
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
"softwarename" varchar(64) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"uploadtime" timestamp(6),
"size" varchar(16) COLLATE "default",
"customername" varchar(256) COLLATE "default",
"downstatus" int4,
"createtime" timestamp(6),
"moditytime" timestamp(6),
"uploadsoftwarename" varchar(64) COLLATE "default",
"erpcode" int4,
"filetimestamp" varchar(16) COLLATE "default",
"softwaretype" varchar(16) COLLATE "default",
"signflag" varchar(16) COLLATE "default",
"qrcode" varchar(32) COLLATE "default",
"qrpath" varchar(128) COLLATE "default"
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
"loginfo" varchar(64) COLLATE "default",
"timestamp" timestamp(6),
"userid" int4,
"userip" varchar(64) COLLATE "default",
"remark" varchar(256) COLLATE "default"
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
"id" int4 NOT NULL,
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
"remark" varchar(256) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO "public"."userinfo" VALUES ('888', null, 'admin', null, '4a78b66a0e09850c6f9c5a3d58a43205', null, '2020-04-28 03:42:22.984', '2020-04-28 03:42:22.984', '1', '0', null, null, null, null, null);

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
