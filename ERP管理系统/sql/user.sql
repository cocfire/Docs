/*
Navicat PGSQL Data Transfer

Source Server         : 172.16.43.94
Source Server Version : 90603
Source Host           : 172.16.43.94:5432
Source Database       : bmerp
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2021-01-28 17:43:38
*/


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
"id" int4 DEFAULT nextval('user_id_seq'::regclass) NOT NULL,
"openid" int4,
"nicname" varchar(128) COLLATE "default",
"realname" varchar(128) COLLATE "default",
"phone" varchar(32) COLLATE "default",
"email" varchar(128) COLLATE "default",
"photopath" varchar(256) COLLATE "default",
"password" varchar(128) COLLATE "default",
"oldpassword" varchar(128) COLLATE "default",
"createtime" timestamp(6),
"modifytime" timestamp(6),
"status" int4,
"type" int4,
"logintimes" int8,
"lastloginip" varchar(128) COLLATE "default",
"lastlogintime" timestamp(6),
"companyid" int4,
"groupid" int4,
"remark" varchar(512) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON COLUMN "public"."user"."id" IS '系统内部编号';
COMMENT ON COLUMN "public"."user"."openid" IS '可公开的绑定的编号';
COMMENT ON COLUMN "public"."user"."nicname" IS '用户昵称';
COMMENT ON COLUMN "public"."user"."realname" IS '真实姓名';
COMMENT ON COLUMN "public"."user"."phone" IS '联系电话';
COMMENT ON COLUMN "public"."user"."email" IS '电子邮件';
COMMENT ON COLUMN "public"."user"."password" IS '当前密码';
COMMENT ON COLUMN "public"."user"."oldpassword" IS '最近的旧密码';
COMMENT ON COLUMN "public"."user"."createtime" IS '创建时间';
COMMENT ON COLUMN "public"."user"."modifytime" IS '修改时间';
COMMENT ON COLUMN "public"."user"."status" IS '账户状态：
0-不可用；
1-可用；
2-限制使用；
3-已失效；
4-已注销；';
COMMENT ON COLUMN "public"."user"."type" IS '账户类型：
0-管理员账户；
1-个人账户；
2-企业账户；
3-vip账户；';
COMMENT ON COLUMN "public"."user"."logintimes" IS '登录次数';
COMMENT ON COLUMN "public"."user"."lastloginip" IS '最后登录IP';
COMMENT ON COLUMN "public"."user"."lastlogintime" IS '最后登录时间';
COMMENT ON COLUMN "public"."user"."companyid" IS '公司编号';
COMMENT ON COLUMN "public"."user"."groupid" IS '分组编号';
COMMENT ON COLUMN "public"."user"."remark" IS '备注';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD PRIMARY KEY ("id");
