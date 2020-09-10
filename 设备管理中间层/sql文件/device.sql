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

Date: 2020-05-16 15:58:31
*/


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
"machinetype" varchar(16) COLLATE "default",
"licencecode" varchar(32) COLLATE "default",
"softwarename" varchar(64) COLLATE "default",
"erpcode" varchar(32) COLLATE "default",
"softwareversion" varchar(32) COLLATE "default",
"orderid" varchar(16) COLLATE "default",
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
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table device
-- ----------------------------
ALTER TABLE "public"."device" ADD PRIMARY KEY ("id");
