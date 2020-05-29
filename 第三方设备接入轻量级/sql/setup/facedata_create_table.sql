-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user_info";
CREATE TABLE "public"."tb_user_info" (
"user_id" serial NOT NULL,
"name" varchar(32) COLLATE "default",
"password" varchar(32) COLLATE "default",
"role" int4 DEFAULT 1,
"face_library_id" int4,
"depart_id" int4,
"function" int4,
"nick_name" varchar(32) COLLATE "default",
"create_time" timestamp(0),
"disable_role" int4 DEFAULT 0
)
WITH (OIDS=FALSE)
;

COMMENT ON COLUMN "public"."tb_user_info"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."tb_user_info"."name" IS '用户名';
COMMENT ON COLUMN "public"."tb_user_info"."password" IS '用户密码';
COMMENT ON COLUMN "public"."tb_user_info"."role" IS '角色';
COMMENT ON COLUMN "public"."tb_user_info"."face_library_id" IS '人脸库ID';
COMMENT ON COLUMN "public"."tb_user_info"."depart_id" IS '部门ID';
COMMENT ON COLUMN "public"."tb_user_info"."function" IS '权限';
COMMENT ON COLUMN "public"."tb_user_info"."nick_name" IS '昵称';
COMMENT ON COLUMN "public"."tb_user_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."tb_user_info"."disable_role" IS '删除标志';

-- ----------------------------
-- Primary Key structure for table tb_user_info
-- ----------------------------
ALTER TABLE "public"."tb_user_info" ADD PRIMARY KEY ("user_id");

-- ----------------------------
-- Table structure for tb_face_library
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_library";
CREATE TABLE "public"."tb_face_library" (
"face_library_id" serial NOT NULL,
"name" varchar(64) COLLATE "default",
"work_mode" int4 DEFAULT 0,
"create_time" timestamp(0),
"revno" varchar(32) COLLATE "default",
"del_flag" int4 DEFAULT 0,
"description" varchar(256) COLLATE "default"
)
WITH (OIDS=FALSE)
;

COMMENT ON COLUMN "public"."tb_face_library"."face_library_id" IS '人脸库ID';
COMMENT ON COLUMN "public"."tb_face_library"."name" IS '人脸库名称';
COMMENT ON COLUMN "public"."tb_face_library"."work_mode" IS '部署方式';
COMMENT ON COLUMN "public"."tb_face_library"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."tb_face_library"."revno" IS '修订号';
COMMENT ON COLUMN "public"."tb_face_library"."del_flag" IS '删除标志';
COMMENT ON COLUMN "public"."tb_face_library"."description" IS '描述信息';

-- ----------------------------
-- Primary Key structure for table tb_face_library
-- ----------------------------
ALTER TABLE "public"."tb_face_library" ADD PRIMARY KEY ("face_library_id");


-- ----------------------------
-- Table structure for tb_face_feature
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_feature";
CREATE TABLE "public"."tb_face_feature" (
"photo_id" serial NOT NULL,
"face_library_id" int4,
"depart_id" int4,
"face_id" int4,
"name" varchar(256) COLLATE "default",
"feature" varchar(4000) COLLATE "default" NOT NULL,
"flag" int4 DEFAULT 0,
"revno" varchar(32) COLLATE "default",
"del_flag" int4 DEFAULT 0,
"feature_ver" varchar(16)
)
WITH (OIDS=FALSE)
;

COMMENT ON COLUMN "public"."tb_face_feature"."photo_id" IS '照片ID';
COMMENT ON COLUMN "public"."tb_face_feature"."face_library_id" IS '人脸库ID';
COMMENT ON COLUMN "public"."tb_face_feature"."depart_id" IS '部门ID';
COMMENT ON COLUMN "public"."tb_face_feature"."face_id" IS '人脸ID';
COMMENT ON COLUMN "public"."tb_face_feature"."name" IS '照片名称';
COMMENT ON COLUMN "public"."tb_face_feature"."feature" IS '特征值';
COMMENT ON COLUMN "public"."tb_face_feature"."flag" IS '标志位';
COMMENT ON COLUMN "public"."tb_face_feature"."revno" IS '修订号';
COMMENT ON COLUMN "public"."tb_face_feature"."del_flag" IS '删除标志';

-- ----------------------------
-- Indexes structure for table tb_face_feature
-- ----------------------------
CREATE INDEX "index_face_feature" ON "public"."tb_face_feature" USING btree ("depart_id", "face_id");

-- ----------------------------
-- Primary Key structure for table tb_face_feature
-- ----------------------------
ALTER TABLE "public"."tb_face_feature" ADD PRIMARY KEY ("photo_id");


-- ----------------------------
-- Table structure for tb_face_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_param";
CREATE TABLE "public"."tb_face_param" (
"rec_id" serial NOT NULL,
"key" varchar(32) COLLATE "default" NOT NULL,
"value" varchar(64) COLLATE "default" NOT NULL,
"name" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Primary Key structure for table tb_face_param
-- ----------------------------
ALTER TABLE "public"."tb_face_param" ADD PRIMARY KEY ("rec_id");


-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_feature"
-- ----------------------------
ALTER TABLE "public"."tb_face_feature" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
