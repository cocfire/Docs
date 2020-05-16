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

Date: 2020-05-06 18:44:48
*/


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
"remark" varchar(512) COLLATE "default"
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
-- Primary Key structure for table userinfo
-- ----------------------------
ALTER TABLE "public"."userinfo" ADD PRIMARY KEY ("id");
