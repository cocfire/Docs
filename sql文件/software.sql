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

Date: 2020-05-07 19:48:06
*/


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
"qrpath" varchar(512) COLLATE "default",
"remark" varchar(1024) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of software
-- ----------------------------
INSERT INTO "public"."software" VALUES ('1', 'idr710', 'v1.0.0', '2020-05-07 17:02:04', '204800', 'idr710人脸识别测温软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '11112222', '2020050711112222', '1', 'true', '111122223333', null);
INSERT INTO "public"."software" VALUES ('2', 'idr710', 'v1.0.1', '2020-05-07 17:02:04', '204800', 'idr710人脸识别测温软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '11112222', '2020050711112222', '1', 'true', '111122223333', null);
INSERT INTO "public"."software" VALUES ('3', 'idr710', 'v1.1.0', '2020-05-07 17:02:04', '204800', 'idr710人脸识别测温软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '11112222', '2020050711112222', '1', 'true', '111122223333', null);
INSERT INTO "public"."software" VALUES ('4', 'idr710', 'v2.0.0', '2020-05-07 17:02:04', '204800', 'idr710人脸识别测温软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '11112222', '2020050711112222', '1', 'true', '111122223333', null);
INSERT INTO "public"."software" VALUES ('5', 'idrXQ', 'v1.0.0', '2020-05-07 17:02:04', '204800', 'idrXQ人脸识别软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '33334444', '2020050733334444', '1', 'true', '444455556666', null);
INSERT INTO "public"."software" VALUES ('6', 'idrXQ', 'v1.0.2', '2020-05-07 17:02:04', '204800', 'idrXQ人脸识别软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '33334444', '2020050733334444', '1', 'true', '444455556666', null);
INSERT INTO "public"."software" VALUES ('7', 'idrXQ', 'v1.3.0', '2020-05-07 17:02:04', '204800', 'idrXQ人脸识别软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '33334444', '2020050733334444', '1', 'true', '444455556666', null);
INSERT INTO "public"."software" VALUES ('8', 'idrXQ', 'v3.0.0', '2020-05-07 17:02:04', '204800', 'idrXQ人脸识别软件', null, '2020-05-07 17:03:35', '2020-05-07 17:03:38', 'program.zip', '33334444', '2020050733334444', '1', 'true', '444455556666', null);

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table software
-- ----------------------------
ALTER TABLE "public"."software" ADD PRIMARY KEY ("id");
