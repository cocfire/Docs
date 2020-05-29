-- ----------------------------------------------------------
-- 2020-04-21
-- update tb_guest_record,add:temperature\mask\pic_id
--												update face_id not null,foreign key
-- update tb_face_record,add:temperature\mask\pic_id
-- update tb_face_picture face_id is allow null
-- 2019-12-10
-- update terminal model define
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.6 2019-10-24 for FaceGateServerLite
-- create table:tb_car_info,tb_area,tb_car_area,tb_car_record,
--              tb_centry,tb_park_port,tb_platform_access
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.5 2019-07-22 for FaceGateServerLite
-- ALTER TABLE tb_param_def
-- 2019-09-05
-- ALTER TABLE tb_hint_text
-- ALTER table tb_menu,add pc_client,web_client
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.4 2019-07-22 for FaceGateServerLite
-- ALTER TABLE tb_face_feature: add version,
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.3 2019-07-02 for FaceGateServerLite
-- create table :tb_param_def
-- Init data for table tb_hint_text
-- Init data for table tb_param_def
-- ALTER TABLE tb_hint_text DROP CONSTRAINT "tb_hint_text_face_library_id_fkey",
-- DROP CONSTRAINT "tb_hint_text_term_id_fkey";
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.2 2019-05-16 for FaceGateServerLite
-- modify tb_face_picture:add width,height
-- ----------------------------------------------------------
-- face gate database V2.0.1 2019-04-30 for FaceGateServerLite
-- init table data:tb_library_param
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.0 2019-04-22 for FaceGateServerLite
-- create table :tb_face_picture
-- create table :tb_term_depart
-- update table:tb_terminal_info,add soft_ver,ip_addr,term_model,term_business,last_report_time
-- create table :tb_library_param
-- create table :tb_visit_reason
-- update table:tb_face_book,add reason_id
-- update table:tb_visit_record,add reason_id
-- create table :tb_face_feature
-- create table tb_face_attend
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.16 2018-12-13
-- create table :tb_image_record
-- alert some char to varchar 
-- alert size of name from 32 to 64 
-- create table:tb_conf_param
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.14 2018-09-21
-- create table :tb_face_photo
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.13 2018-08-17
-- modify tb_face_info:add openid,leader_id, attribute
-- modify tb_face_guest:add openid
-- add table tb_bat_visit\tb_bat_term\tb_face_info_record
-- modify tb_visit_record:add status, bat_id, update_time
-- modify tb_term_face:add visit_id, DROP foreign key:face_id
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.12 2018-05-10
-- modify tb_network_param:add net_name
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.11 2018-05-08
-- add table tb_user_term
-- modify tb_face_info:add agency/valid_date
-- modify tb_face_guest:add agency/
-- modify tb_user_info:add name/face_id/password_time/is_init_password
-- modify tb_param:param_value size 256
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.10 2018-04-20
-- modify table tb_menu:add COLUMN "business_id",remove "status"
-- modify tb_user_role_rec_id_seq&tb_role_menu_rec_id_seq start with 100
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.9 2018-03-14
-- create table tb_business
-- create table tb_menu
-- create table tb_role
-- create table tb_role_menu
-- create table tb_user_role
-- create table tb_user_depart
-- create table tb_oplog
-- modify table tb_user_info:add COLUMN "create_time"/"update_time"
-- modify table tb_face_library:add COLUMN "business_id"
-- tb_param add foreign key: face_library_id\term_id
-- tb_hint_text add foreign key: face_library_id\term_id
-- tb_user_info DROP foreign key:face_library_id 
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.8 2018-03-06
-- tb_conference_info add: barcode\url\enable_browse\auth_level
-- tb_face_info add: label_id
-- create table:tb_face_label
-- create table:tb_group
-- create table:tb_group_face
-- modify tb_param:remove param_value "NOT NULL"
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.7 2018-02-02
-- modify tb_face_record:add conf_id,rec_type,add index
-- modify tb_guest_record:add rec_type
-- modify tb_conference_info:alert"logo" size 65535
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.6 2018-01-16
-- modify tb_face_department,depart_name change to 128
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.5 2018-01-08
-- modify tb_face_info:remove idcard "NOT NULL"
--        tb_conf_face:add term_id
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.4 2017-12-29
-- modify tb_face_record:add report_time
--        tb_guest_record:add report_time
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.3 2017-12-27
-- modify tb_face_library:add english_name\pinyin_name
--														legal_person\company_tax
--														company_no\trade\contact_person
--														tel\email\addr
-- add TABLE:tb_conf_face\tb_conf_term\tb_conference_info
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V1.0.2 2017-11-22
-- modify tb_face_guest:add position
-- modify tb_face_book:add employee_id、visit_num、content
-- modify tb_visit_record:add employee_id、visit_num、content
-- ----------------------------------------------------------
-- Create face gate database V1.0.1 2017-11-16
-- modify tb_face_record and tb_guest_record
-- ----------------------------------------------------------


-- ----------------------------
-- Table structure for pl_system
-- ----------------------------
DROP TABLE IF EXISTS "public"."pl_system";
CREATE TABLE "public"."pl_system" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"key" varchar(32) COLLATE "default" NOT NULL,
"value" varchar(32) COLLATE "default",
"name" varchar(32) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table pl_system
-- ----------------------------
ALTER TABLE "public"."pl_system" ADD PRIMARY KEY ("rec_id");

CREATE INDEX "index_pl_system_library_id" ON "public"."pl_system" USING btree ("face_library_id");

-- ----------------------------
-- Table structure for tb_bat_term
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_bat_term";
CREATE TABLE "public"."tb_bat_term" (
"rec_id" int4 NOT NULL,
"face_library_id" int4 NOT NULL,
"bat_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"create_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_bat_term
-- ----------------------------
ALTER TABLE "public"."tb_bat_term" ADD PRIMARY KEY ("rec_id");

CREATE INDEX "index_bat_term_library_id" ON "public"."tb_bat_term" USING btree ("face_library_id");
CREATE INDEX "index_bat_term_bat_id" ON "public"."tb_bat_term" USING btree ("bat_id");

-- ----------------------------
-- Table structure for tb_bat_visit
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_bat_visit";
CREATE TABLE "public"."tb_bat_visit" (
"bat_id" int4 NOT NULL,
"face_library_id" int4,
"face_id" int4,
"title" varchar(128) COLLATE "default",
"reason_id" int4,
"create_time" timestamp(0),
"start_time" timestamp(0),
"end_time" timestamp(0),
"remark" varchar(32) COLLATE "default",
"status" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_bat_visit
-- ----------------------------
ALTER TABLE "public"."tb_bat_visit" ADD PRIMARY KEY ("bat_id");

CREATE INDEX "index_bat_visit_bat_id" ON "public"."tb_bat_visit" USING btree ("bat_id");
CREATE INDEX "index_bat_visit_library_id" ON "public"."tb_bat_visit" USING btree ("face_library_id");

-- ----------------------------
-- Table structure for tb_book_term
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_book_term";
CREATE TABLE "public"."tb_book_term" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"book_id" int4,
"term_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_book_term
-- ----------------------------
ALTER TABLE "public"."tb_book_term" ADD PRIMARY KEY ("rec_id");

CREATE INDEX "index_book_term_library_id" ON "public"."tb_book_term" USING btree ("face_library_id");
CREATE INDEX "index_book_term_book_id" ON "public"."tb_book_term" USING btree ("book_id");

-- ----------------------------
-- Table structure for tb_business
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_business";
CREATE TABLE "public"."tb_business" (
"business_id" int4 NOT NULL,
"name" varchar(32) NOT NULL,
"remark" varchar(1024),
"status" int4 NOT NULL
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Primary Key structure for table tb_business
-- ----------------------------
ALTER TABLE "public"."tb_business" ADD PRIMARY KEY ("business_id");

-- ----------------------------
-- SEQUENCE for tb_conf_face
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_conf_face_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_conf_face_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_conf_face_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_conf_face
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_conf_face";
CREATE TABLE "public"."tb_conf_face" (
"rec_id" int4 DEFAULT nextval('tb_conf_face_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"conf_id" int4 NOT NULL,
"attribute" int4 NOT NULL,
"face_id" int4 NOT NULL,
"create_time" timestamp,
"term_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_conf_face
-- ----------------------------
ALTER TABLE "public"."tb_conf_face" ADD PRIMARY KEY ("rec_id");

CREATE INDEX "index_conf_face_library_id" ON "public"."tb_conf_face" USING btree ("face_library_id");
CREATE INDEX "index_conf_face_conf_id" ON "public"."tb_conf_face" USING btree ("conf_id");

-- ----------------------------
-- Table structure for tb_conf_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_conf_param";
CREATE TABLE "public"."tb_conf_param" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"conf_id" int4,
"param_key" varchar(32) COLLATE "default" NOT NULL,
"param_value" varchar(65535) COLLATE "default",
"param_name" varchar(64) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_conf_param
-- ----------------------------
ALTER TABLE "public"."tb_conf_param" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_conf_term
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_conf_term_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_conf_term_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_conf_term_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_conf_term
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_conf_term";
CREATE TABLE "public"."tb_conf_term" (
"rec_id" int4 DEFAULT nextval('tb_conf_term_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"conf_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"create_time" timestamp(0)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_conf_term
-- ----------------------------
ALTER TABLE "public"."tb_conf_term" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_conference_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_conference_info";
CREATE TABLE "public"."tb_conference_info" (
"conf_id" int4 NOT NULL,
"parent_conf_id" int4,
"face_library_id" int4 NOT NULL,
"name" varchar(40) COLLATE "default" NOT NULL,
"addr" varchar(64) COLLATE "default" NOT NULL,
"host" varchar(40) COLLATE "default",
"term_layout" int4,
"background" varchar(2097152) COLLATE "default",
"logo" varchar(65535) COLLATE "default",
"update_time" timestamp(6),
"create_time" timestamp(6),
"start_time" timestamp(6),
"end_time" timestamp(6),
"sign_timespan" varchar(255) COLLATE "default",
"need_face_compare" int4,
"status" int4,
"revno" varchar(32) COLLATE "default",
"barcode" varchar(65535) COLLATE "default",
"url" varchar(255) COLLATE "default",
"enable_browse" int4,
"auth_level" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_conference_info
-- ----------------------------
ALTER TABLE "public"."tb_conference_info" ADD PRIMARY KEY ("conf_id");

-- ----------------------------
-- Table structure for tb_face_book
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_book";
CREATE TABLE "public"."tb_face_book" (
"book_id" int4 NOT NULL,
"face_library_id" int4,
"attribute" int4,
"face_id" int4,
"name" varchar(64) COLLATE "default",
"idcard" varchar(20) COLLATE "default",
"company" varchar(64) COLLATE "default",
"tel" varchar(32) COLLATE "default",
"sex" int4,
"employee" varchar(64) COLLATE "default",
"depart_id" int4,
"visit_time" timestamp(0),
"expire_time" timestamp(0),
"create_time" timestamp(0),
"revno" varchar(32) COLLATE "default",
"is_auth" int4,
"del_flag" int4,
"employee_id" int4 NOT NULL,
"visit_num" int4,
"content" varchar(64) COLLATE "default",
"status" int4,
"reason_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_book
-- ----------------------------
ALTER TABLE "public"."tb_face_book" ADD PRIMARY KEY ("book_id");

-- ----------------------------
-- Table structure for tb_face_department
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_department" CASCADE;
CREATE TABLE "public"."tb_face_department" (
"depart_id" int4 NOT NULL,
"parent_depart_id" int4,
"face_library_id" int4,
"depart_name" varchar(128) COLLATE "default" NOT NULL,
"create_time" timestamp(0),
"del_flag" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_department
-- ----------------------------
ALTER TABLE "public"."tb_face_department" ADD PRIMARY KEY ("depart_id");

-- ----------------------------
-- Table structure for tb_face_feature
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_feature";
CREATE TABLE "public"."tb_face_feature" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"attribute" int4,
"face_id" int4,
"pic_id" int4,
"feature" varchar(6200) COLLATE "default" NOT NULL,
"feature_ver" varchar(16) COLLATE "default"
)
WITH (OIDS=FALSE)

;
-- ----------------------------
-- Primary Key structure for table tb_face_feature
-- ----------------------------
ALTER TABLE "public"."tb_face_feature" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Indexes structure for table tb_face_feature
-- ----------------------------
CREATE INDEX "index_face_feature_library_id" ON "public"."tb_face_feature" USING btree ("face_library_id");

-- ----------------------------
-- Table structure for tb_face_guest
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_guest";
CREATE TABLE "public"."tb_face_guest" (
"face_id" int4 NOT NULL,
"face_library_id" int4,
"name" varchar(64) COLLATE "default",
"idcard" varchar(18) COLLATE "default",
"face_info_url" char(256) COLLATE "default",
"empcard" varchar(32) COLLATE "default",
"company" varchar(128) COLLATE "default",
"nickname" varchar(32) COLLATE "default",
"englishname" varchar(32) COLLATE "default",
"nation" varchar(32) COLLATE "default",
"birth" varchar(32) COLLATE "default",
"sex" int4,
"tel" varchar(32) COLLATE "default",
"addr" varchar(255) COLLATE "default",
"visit_time" timestamp(0),
"image_type" int4,
"photo_feature" varchar(6200) COLLATE "default",
"idcard_feature" varchar(6200) COLLATE "default",
"idwlt" varchar(1600) COLLATE "default",
"revno" varchar(32) COLLATE "default",
"status" int4,
"idcard_cid" varchar(32) COLLATE "default",
"position" varchar(32) COLLATE "default",
"agency" varchar(255) COLLATE "default",
"valid_date" varchar(32) COLLATE "default",
"openid" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Indexes structure for table tb_face_guest
-- ----------------------------
CREATE INDEX "index_face_guest_idcard" ON "public"."tb_face_guest" USING btree ("idcard");
CREATE INDEX "index_face_guest_library_id" ON "public"."tb_face_guest" USING btree ("face_library_id");

-- ----------------------------
-- Primary Key structure for table tb_face_guest
-- ----------------------------
ALTER TABLE "public"."tb_face_guest" ADD PRIMARY KEY ("face_id");

-- ---------------------------- 
-- Table structure for tb_face_info 
-- ---------------------------- 
DROP TABLE IF EXISTS "public"."tb_face_info" CASCADE; 
CREATE TABLE "public"."tb_face_info" ( 
"face_id" int4 NOT NULL, 
"face_library_id" int4,
"name" varchar(64) COLLATE "default",
"idcard" varchar(18) COLLATE "default",
"face_info_url" varchar(256) COLLATE "default",
"empcard" varchar(32) COLLATE "default", 
"depart_id" int4, 
"nickname" varchar(32) COLLATE "default",
"englishname" varchar(32) COLLATE "default",
"nation" varchar(32) COLLATE "default",
"birth" varchar(32) COLLATE "default", 
"sex" int4, 
"tel" varchar(32) COLLATE "default", 
"addr" varchar(255) COLLATE "default", 
"create_time" timestamp(0), 
"image_type" int4, 
"photo_feature" varchar(6200) COLLATE "default", 
"idcard_feature" varchar(6200) COLLATE "default", 
"idwlt" varchar(1600) COLLATE "default", 
"revno" varchar(32) COLLATE "default", 
"status" int4, 
"idcard_cid" varchar(32) COLLATE "default", 
"employee_id" varchar(16) COLLATE "default", 
"position" varchar(32) COLLATE "default", 
"label_id" int4,
"agency" varchar(255) COLLATE "default",
"valid_date" varchar(32) COLLATE "default",
"openid" varchar(32) COLLATE "default", 
"leader_id" int4, 
"attribute" int4, 
"email" varchar(256) COLLATE "default" 
) 
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Indexes structure for table tb_face_info
-- ----------------------------
CREATE INDEX "index_face_info_idcard" ON "public"."tb_face_info" USING btree ("idcard");
CREATE INDEX "index_face_info_library_id" ON "public"."tb_face_info" USING btree ("face_library_id");

-- ----------------------------
-- Primary Key structure for table tb_face_info
-- ----------------------------
ALTER TABLE "public"."tb_face_info" ADD PRIMARY KEY ("face_id");

-- ----------------------------
-- Table structure for tb_face_info_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_info_record";
CREATE TABLE "public"."tb_face_info_record" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"attribute" int4,
"face_id" int4,
"openid" varchar(32) COLLATE "default",
"name" varchar(64) COLLATE "default",
"nickname" varchar(32) COLLATE "default",
"tel" varchar(32) COLLATE "default",
"image_type" int4,
"photo_feature" varchar(6200) COLLATE "default",
"create_time" timestamp(0),
"status" int4,
"approver_id" int4,
"update_time" timestamp(0),
"approve_time" timestamp(0)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_info_record
-- ----------------------------
ALTER TABLE "public"."tb_face_info_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_face_label
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_label" CASCADE;
CREATE TABLE "public"."tb_face_label" (
"label_id" int4 NOT NULL,
"face_library_id" int4,
"attribute" int4,
"label_name" varchar(128) COLLATE "default" NOT NULL,
"create_time" timestamp(0),
"update_time" timestamp(0)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_label
-- ----------------------------
ALTER TABLE "public"."tb_face_label" ADD PRIMARY KEY ("label_id");

-- ----------------------------
-- Table structure for tb_face_library
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_library" CASCADE;
CREATE TABLE "public"."tb_face_library" (
"face_library_id" int4 NOT NULL,
"name" varchar(64) COLLATE "default",
"net_mode" int4,
"create_time" varchar(32) COLLATE "default",
"update_time" varchar(32) COLLATE "default",
"net_library_id" int4,
"del_flag" int4,
"description" varchar(255) COLLATE "default",
"english_name" varchar(256) COLLATE "default",
"pinyin_name" varchar(256) COLLATE "default",
"legal_person" varchar(32) COLLATE "default",
"company_tax" varchar(32) COLLATE "default",
"company_no" varchar(32) COLLATE "default",
"trade" varchar(32) COLLATE "default",
"contact_person" varchar(32) COLLATE "default",
"tel" varchar(32) COLLATE "default",
"email" varchar(320) COLLATE "default",
"addr" varchar(256) COLLATE "default",
"business_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_library
-- ----------------------------
ALTER TABLE "public"."tb_face_library" ADD PRIMARY KEY ("face_library_id");

-- ----------------------------
-- SEQUENCE for tb_face_photo
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_face_photo_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_face_photo_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_face_photo_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_face_photo
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_photo";
CREATE TABLE "public"."tb_face_photo" (
"rec_id" int4 DEFAULT nextval('tb_face_photo_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"attribute" int4 NOT NULL,
"face_id" int4 NOT NULL,
"photo_id" int4 NOT NULL,
"create_time" timestamp
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_photo
-- ----------------------------
ALTER TABLE "public"."tb_face_photo" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_face_picture
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_face_picture_pic_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_face_picture_pic_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_face_picture_pic_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_face_picture
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_picture";
CREATE TABLE "public"."tb_face_picture" (
"pic_id" int4 DEFAULT nextval('tb_face_picture_pic_id_seq'::regclass) NOT NULL,
"photo_id" int4 NOT NULL,
"face_library_id" int4 NOT NULL,
"attribute" int4 NOT NULL,
"face_id" int4 NULL,
"type" int4 NOT NULL,
"size" int4 NOT NULL,
"width" int4,
"height" int4,
"create_time" timestamp,
"pic_data" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_picture
-- ----------------------------
ALTER TABLE "public"."tb_face_picture" ADD PRIMARY KEY ("pic_id");

CREATE INDEX "index_face_picture_library_id" ON "public"."tb_face_picture" USING btree ("face_library_id");
CREATE INDEX "index_face_picture_attribute" ON "public"."tb_face_picture" USING btree ("attribute");
CREATE INDEX "index_face_picture_face_id" ON "public"."tb_face_picture" USING btree ("face_id");
CREATE INDEX "index_face_picture_type" ON "public"."tb_face_picture" USING btree ("type");

-- ----------------------------
-- SEQUENCE for tb_face_record
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_face_record_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_face_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_face_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_face_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_record";
CREATE TABLE "public"."tb_face_record" (
"rec_id" int4 DEFAULT nextval('tb_face_record_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4,
"face_id" int4,
"term_id" int4,
"compare_result" int4,
"compare_score" float,
"preview_photo_path" varchar(128) COLLATE "default",
"create_time" timestamp(0),
"report_time" timestamp(0),
"conf_id" int4,
"rec_type" int4,
"temperature" varchar(64),
"mask" int4,
"pic_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_record
-- ----------------------------
ALTER TABLE "public"."tb_face_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_group" CASCADE;
CREATE TABLE "public"."tb_group" (
"group_id" int4 NOT NULL,
"face_library_id" int4,
"group_name" varchar(128) COLLATE "default" NOT NULL,
"create_time" timestamp(0),
"update_time" timestamp(0)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_group
-- ----------------------------
ALTER TABLE "public"."tb_group" ADD PRIMARY KEY ("group_id");

-- ----------------------------
-- SEQUENCE for tb_group_face
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_group_face_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_group_face_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_group_face_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_group_face
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_group_face";
CREATE TABLE "public"."tb_group_face" (
"rec_id" int4 DEFAULT nextval('tb_group_face_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"group_id" int4 NOT NULL,
"attribute" int4 NOT NULL,
"face_id" int4 NOT NULL,
"create_time" timestamp,
"update_time" timestamp(0)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_group_face
-- ----------------------------
ALTER TABLE "public"."tb_group_face" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_guest_record
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_guest_record_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_guest_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_guest_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_guest_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_guest_record";
CREATE TABLE "public"."tb_guest_record" (
"rec_id" int4 DEFAULT nextval('tb_guest_record_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4,
"face_id" int4,
"name" varchar(64) COLLATE "default",
"idcard" varchar(20) COLLATE "default",
"term_id" int4,
"compare_result" int4,
"compare_score" float,
"preview_photo_path" varchar(128) COLLATE "default",
"create_time" timestamp(0),
"report_time" timestamp(0),
"rec_type" int4,
"temperature" varchar(64),
"mask" int4,
"pic_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_guest_record
-- ----------------------------
ALTER TABLE "public"."tb_guest_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_hint_text
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_hint_text";
CREATE TABLE "public"."tb_hint_text" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"term_id" int4,
"hint_key" varchar(32) COLLATE "default" NOT NULL,
"hint_name" varchar(128) COLLATE "default",
"hint_sound_text" varchar(32) COLLATE "default" NOT NULL,
"hint_text" varchar(32) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
-- ----------------------------
-- Primary Key structure for table tb_hint_text
-- ----------------------------
ALTER TABLE "public"."tb_hint_text" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_image_record
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_image_record_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_image_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_image_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_image_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_image_record";
CREATE TABLE "public"."tb_image_record" (
"rec_id" int4 DEFAULT nextval('tb_image_record_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"attribute" int4 NOT NULL,
"face_id" int4 NOT NULL,
"idcard" varchar(20) COLLATE "default",
"term_id" int4,
"create_time" timestamp
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_image_record
-- ----------------------------
ALTER TABLE "public"."tb_image_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_library_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_library_param";
CREATE TABLE "public"."tb_library_param" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"param_key" varchar(32) COLLATE "default" NOT NULL,
"param_value" varchar(4096) COLLATE "default",
"param_name" varchar(128) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_library_param
-- ----------------------------
ALTER TABLE "public"."tb_library_param" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_menu";
CREATE TABLE "public"."tb_menu" (
"menu_id" int4 NOT NULL,
"parent_id" int4,
"name" varchar(32) COLLATE "default" NOT NULL,
"name_web" varchar(32) COLLATE "default",
"order_index" int4 NOT NULL,
"remark" varchar(1024) COLLATE "default",
"business_id" int4,
"pc_client" int4,
"web_client" int4,
PRIMARY KEY ("menu_id")
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tb_network_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_network_param";
CREATE TABLE "public"."tb_network_param" (
"net_id" int4 NOT NULL,
"face_library_id" int4,
"net_name" varchar(32) COLLATE "default" NOT NULL,
"net_type" int4,
"net_connect" int4,
"net_ip" varchar(16) COLLATE "default",
"net_gw" varchar(16) COLLATE "default",
"net_mask" varchar(16) COLLATE "default",
"net_dns1" varchar(16) COLLATE "default",
"wifi_ssid" varchar(32) COLLATE "default",
"wifi_password" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_network_param
-- ----------------------------
ALTER TABLE "public"."tb_network_param" ADD PRIMARY KEY ("net_id");

-- ----------------------------
-- Table structure for tb_position_depart
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_position_depart";
CREATE TABLE "public"."tb_position_depart" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"position_id" int4,
"depart_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tb_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_param";
CREATE TABLE "public"."tb_param" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"term_id" int4,
"param_key" varchar(32) COLLATE "default" NOT NULL,
"param_value" varchar(4096) COLLATE "default",
"param_name" varchar(32) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_param
-- ----------------------------
ALTER TABLE "public"."tb_param" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Primary Key structure for table tb_position_depart
-- ----------------------------
ALTER TABLE "public"."tb_position_depart" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_position_network
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_position_network";
CREATE TABLE "public"."tb_position_network" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"position_id" int4,
"net_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_position_network
-- ----------------------------
ALTER TABLE "public"."tb_position_network" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_role
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_role_role_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_role_role_id_seq"
 INCREMENT BY 1
 MINVALUE 100
 MAXVALUE 9223372036854775807
 START WITH 100
 CACHE 1;

ALTER TABLE "public"."tb_role_role_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_role";
CREATE TABLE "public"."tb_role" (
"role_id" int4 NOT NULL,
"face_library_id" int4,
"role_name" varchar(32) COLLATE "default" NOT NULL,
"remark" varchar(1024) COLLATE "default",
"create_time" timestamp(0),
"update_time" timestamp(0),
PRIMARY KEY ("role_id")
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- SEQUENCE for tb_role_menu
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_role_menu_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_role_menu_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 100
 MAXVALUE 9223372036854775807
 START WITH 100
 CACHE 1;

ALTER TABLE "public"."tb_role_menu_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_role_menu";
CREATE TABLE "public"."tb_role_menu" (
"rec_id" int4 DEFAULT nextval('tb_role_menu_rec_id_seq'::regclass) NOT NULL,
"role_id" int4 NOT NULL,
"menu_id" int4 NOT NULL,
"create_time" timestamp,
PRIMARY KEY ("rec_id")
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Table structure for tb_term_depart
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_term_depart";
CREATE TABLE "public"."tb_term_depart" (
"rec_id" int4 NOT NULL,
"face_library_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"depart_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_term_depart
-- ----------------------------
ALTER TABLE "public"."tb_term_depart" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_term_face
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_term_face_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_term_face_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_term_face_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_term_face
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_term_face";
CREATE TABLE "public"."tb_term_face" (
"rec_id" int4 DEFAULT nextval('tb_term_face_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4,
"face_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"expire_begin" timestamp(0),
"expire_end" timestamp(0),
"attribute" int4 NOT NULL,
"create_time" timestamp(0),
"visit_id" int4 NOT NULL,
"revno" varchar(32) COLLATE "default",
"status" int4 NOT NULL,
"update_status" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_term_face
-- ----------------------------
ALTER TABLE "public"."tb_term_face" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_term_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_term_message";
CREATE TABLE "public"."tb_term_message" (
"msg_id" int4 NOT NULL,
"face_library_id" int4,
"pc_id" int4,
"term_id" int4,
"msg_type" int4,
"msg_name" varchar(32) COLLATE "default",
"msg_content" varchar(256) COLLATE "default",
"create_time" timestamp(0),
"revno" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_term_message
-- ----------------------------
ALTER TABLE "public"."tb_term_message" ADD PRIMARY KEY ("msg_id");

-- ----------------------------
-- Table structure for tb_term_model
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_term_model";
CREATE TABLE "public"."tb_term_model" (
"term_model" int4 NOT NULL,
"model_name" varchar(64) COLLATE "default" NOT NULL,
PRIMARY KEY ("term_model")
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Table structure for tb_term_position
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_term_position";
CREATE TABLE "public"."tb_term_position" (
"position_id" int4 NOT NULL,
"face_library_id" int4,
"position_name" varchar(32) COLLATE "default" NOT NULL,
"position_desc" varchar(64) COLLATE "default",
"del_flag" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_term_position
-- ----------------------------
ALTER TABLE "public"."tb_term_position" ADD PRIMARY KEY ("position_id");

-- ----------------------------
-- Table structure for tb_terminal_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_terminal_info" CASCADE;
CREATE TABLE "public"."tb_terminal_info" (
"term_id" int4 NOT NULL,
"face_library_id" int4,
"term_name" varchar(32) COLLATE "default",
"term_code" varchar(40) COLLATE "default",
"term_sn" varchar(40) COLLATE "default",
"term_position" varchar(32) COLLATE "default",
"position_id" int4,
"depart_id" int4,
"greet_depart_inner" varchar(32) COLLATE "default",
"greet_depart_outter" varchar(32) COLLATE "default",
"greet_guest" varchar(32) COLLATE "default",
"create_time" timestamp(0),
"auth_code" varchar(16) COLLATE "default",
"term_type" int4,
"term_licence" varchar(128) COLLATE "default",
"del_flag" int4,
"soft_ver" varchar(255) COLLATE "default",
"ip_addr" varchar(32) COLLATE "default",
"term_model" int4,
"term_business" int4,
"last_report_time" timestamp(0)
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Primary Key structure for table tb_terminal_info
-- ----------------------------
ALTER TABLE "public"."tb_terminal_info" ADD PRIMARY KEY ("term_id");

-- ----------------------------
-- SEQUENCE for tb_user_depart
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_user_depart_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_user_depart_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_user_depart_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_user_depart
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user_depart";
CREATE TABLE "public"."tb_user_depart" (
"rec_id" int4 DEFAULT nextval('tb_user_depart_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"user_id" int4 NOT NULL,
"depart_id" int4 NOT NULL,
"create_time" timestamp,
PRIMARY KEY ("rec_id")
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user_info";
CREATE TABLE "public"."tb_user_info" (
"user_id" int4 NOT NULL,
"face_library_id" int4,
"user_name" varchar(32) COLLATE "default" NOT NULL,
"user_password" varchar(32) COLLATE "default" NOT NULL,
"user_role" int4,
"user_function" int4,
"disable_role" int4,
"create_time" timestamp(6),
"update_time" timestamp(6),
"name" varchar(64) COLLATE "default",
"face_id" int4,
"password_time" timestamp(6),
"is_init_password" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_user_info
-- ----------------------------
ALTER TABLE "public"."tb_user_info" ADD PRIMARY KEY ("user_id");

-- ----------------------------
-- SEQUENCE for tb_user_role
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_user_role_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_user_role_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 100
 MAXVALUE 9223372036854775807
 START WITH 100
 CACHE 1;

ALTER TABLE "public"."tb_user_role_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user_role";
CREATE TABLE "public"."tb_user_role" (
"rec_id" int4 DEFAULT nextval('tb_user_role_rec_id_seq'::regclass) NOT NULL,
"user_id" int4 NOT NULL,
"role_id" int4 NOT NULL,
"create_time" timestamp,
PRIMARY KEY ("rec_id")
)
WITH (OIDS=FALSE)
;

-- ----------------------------
-- SEQUENCE for tb_user_term
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_user_term_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_user_term_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_user_term_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_user_term
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user_term";
CREATE TABLE "public"."tb_user_term" (
"rec_id" int4 DEFAULT nextval('tb_user_term_rec_id_seq'::regclass) NOT NULL,
"user_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"create_time" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tb_user_term
-- ----------------------------
ALTER TABLE "public"."tb_user_term" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_visit_reason
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_visit_reason" CASCADE;
CREATE TABLE "public"."tb_visit_reason" (
"reason_id" int4 NOT NULL,
"face_library_id" int4,
"reason" varchar(255) COLLATE "default" NOT NULL,
"create_time" timestamp(0),
"update_time" timestamp(0),
"del_flag" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_visit_reason
-- ----------------------------
ALTER TABLE "public"."tb_visit_reason" ADD PRIMARY KEY ("reason_id");

-- ----------------------------
-- SEQUENCE for tb_visit_record
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_visit_record_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_visit_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_visit_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_visit_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_visit_record";
CREATE TABLE "public"."tb_visit_record" (
"rec_id" int4 DEFAULT nextval('tb_visit_record_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4,
"attribute" int4,
"face_id" int4,
"name" varchar(64) COLLATE "default",
"idcard" varchar(20) COLLATE "default",
"term_id" int4,
"employee" varchar(64) COLLATE "default" NOT NULL,
"depart_id" int4,
"visit_time" timestamp(0),
"expire_time" timestamp(0),
"create_time" timestamp(0),
"employee_id" int4 NOT NULL,
"visit_num" int4,
"content" varchar(64) COLLATE "default",
"status" int4,
"bat_id" int4,
"update_time" timestamp(0),
"reason_id" int4,
"record_mode" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_visit_record
-- ----------------------------
ALTER TABLE "public"."tb_visit_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Sequence structure for tb_face_attend_rec_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_face_attend_rec_id_seq";
CREATE SEQUENCE "public"."tb_face_attend_rec_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;
 
 -- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER TABLE "public"."tb_face_attend_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_face_attend
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_face_attend";
CREATE TABLE "public"."tb_face_attend" (
"rec_id" int4 DEFAULT nextval('tb_face_attend_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4 NOT NULL,
"face_id" int4 NOT NULL,
"term_id" int4 NOT NULL,
"first_time" timestamp,
"last_time" timestamp(6),
"last_term_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_face_attend
-- ----------------------------
ALTER TABLE "public"."tb_face_attend" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
--ALTER SEQUENCE "public"."tb_face_attend_rec_id_seq" OWNED BY "tb_face_attend"."rec_id";

-- ----------------------------
-- Indexes structure for table tb_face_attend
-- ----------------------------
CREATE INDEX "index_face_attend_create_time" ON "public"."tb_face_attend" USING btree ("first_time" DESC NULLS LAST);
CREATE INDEX "index_face_attend_library_id" ON "public"."tb_face_attend" USING btree ("face_library_id");

-- ----------------------------
-- Table structure for tb_param_def
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_param_def";
CREATE TABLE "public"."tb_param_def" (
"rec_id" int4 NOT NULL,
"business_id" int4,
"param_name" varchar(128) COLLATE "default",
"param_key" varchar(32) COLLATE "default" NOT NULL,
"param_value" varchar(4096) COLLATE "default",
"param_sheet" varchar(256) COLLATE "default",
"type" varchar(32) COLLATE "default" NOT NULL,
"display_controlled" char(1) COLLATE "default" NOT NULL,
"set" varchar(4096) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_library_param
-- ----------------------------
ALTER TABLE "public"."tb_param_def" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_car_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_car_info";
CREATE TABLE "public"."tb_car_info" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"plate_id" varchar(64) COLLATE "default" NOT NULL,
"model" varchar(32) COLLATE "default",
"color" varchar(32) COLLATE "default",
"plate_type" int4,
"attribute" int4,
"owner_id" int4,
"remark" varchar(256) COLLATE "default",
"expire_begin" timestamp,
"expire_end" timestamp,
"create_time" timestamp,
"update_time" timestamp,
"status" int4,
"revno" varchar(32) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_car_info
-- ----------------------------
ALTER TABLE "public"."tb_car_info" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_area";
CREATE TABLE "public"."tb_area" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"area_id" int4,
"area_name" varchar(64) COLLATE "default",
"spaces_num" int4,
"surplus_num" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_area
-- ----------------------------
ALTER TABLE "public"."tb_area" ADD PRIMARY KEY ("rec_id");


-- ----------------------------
-- Table structure for tb_car_area
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_car_area";
CREATE TABLE "public"."tb_car_area" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"plate_id" varchar(64) COLLATE "default" NOT NULL,
"area_id" int4,
"expire_begin" timestamp,
"expire_end" timestamp,
"create_time" timestamp,
"visit_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_car_area
-- ----------------------------
ALTER TABLE "public"."tb_car_area" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- SEQUENCE for tb_car_record
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tb_car_record_rec_id_seq" CASCADE;
CREATE SEQUENCE "public"."tb_car_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_car_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_car_record
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_car_record";
CREATE TABLE "public"."tb_car_record" (
"rec_id" int4 DEFAULT nextval('tb_car_record_rec_id_seq'::regclass) NOT NULL,
"face_library_id" int4,
"park_id" int4,
"plate_id" varchar(64) COLLATE "default" NOT NULL,
"cario_id" int4,
"port_id_in" int4,
"access_time_in" timestamp,
"port_id_out" int4,
"access_time_out" timestamp,
"create_time" timestamp,
"update_time" timestamp,
"plate_type" varchar(255)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_car_record
-- ----------------------------
ALTER TABLE "public"."tb_car_record" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_centry
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_centry";
CREATE TABLE "public"."tb_centry" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"area_id" int4,
"centry_id" int4,
"centry_name" varchar(64) COLLATE "default",
"port_id" int4,
"port_name" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_centry
-- ----------------------------
ALTER TABLE "public"."tb_centry" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_park_port
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_park_port";
CREATE TABLE "public"."tb_park_port" (
"rec_id" int4 NOT NULL,
"face_library_id" int4,
"port_id" int4,
"port_name" varchar(64) COLLATE "default",
"centry_id" int4,
"port_type" int4,
"area_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_park_port
-- ----------------------------
ALTER TABLE "public"."tb_park_port" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Table structure for tb_platform_access
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_platform_access";
CREATE TABLE "public"."tb_platform_access" (
"access_id" int4 NOT NULL,
"face_library_id" int4,
"access_name" varchar(64) COLLATE "default",
"soft_ver" varchar(40) COLLATE "default",
"ip_addr" varchar(32) COLLATE "default",
"create_time" timestamp,
"last_report_time" timestamp
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Primary Key structure for table tb_platform_access
-- ----------------------------
ALTER TABLE "public"."tb_platform_access" ADD PRIMARY KEY ("access_id");

-------------------------------------------------------------------------------------------------------------------------
-- ----------------------------
-- Foreign Key structure for table "public"."pl_system"
-- ----------------------------
--ALTER TABLE "public"."pl_system" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_bat_term"
-- ----------------------------
ALTER TABLE "public"."tb_bat_term" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_bat_term" ADD FOREIGN KEY ("bat_id") REFERENCES "public"."tb_bat_visit" ("bat_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_bat_term" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_bat_visit"
-- ----------------------------
ALTER TABLE "public"."tb_bat_visit" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_bat_visit" ADD FOREIGN KEY ("face_id") REFERENCES "public"."tb_face_info" ("face_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_book_term"
-- ----------------------------
ALTER TABLE "public"."tb_book_term" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_book_term" ADD FOREIGN KEY ("book_id") REFERENCES "public"."tb_face_book" ("book_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_book_term" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_conf_face"
-- ----------------------------
ALTER TABLE "public"."tb_conf_face" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_conf_face" ADD FOREIGN KEY ("conf_id") REFERENCES "public"."tb_conference_info" ("conf_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_conf_face" ADD FOREIGN KEY ("face_id") REFERENCES "public"."tb_face_info" ("face_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_conf_param"
-- ----------------------------
ALTER TABLE "public"."tb_conf_param" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_conf_param" ADD FOREIGN KEY ("conf_id") REFERENCES "public"."tb_conference_info" ("conf_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_conf_term"
-- ----------------------------
ALTER TABLE "public"."tb_conf_term" ADD FOREIGN KEY ("conf_id") REFERENCES "public"."tb_conference_info" ("conf_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_conf_term" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_conf_term" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_conference_info"
-- ----------------------------
ALTER TABLE "public"."tb_conference_info" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_conference_info"
-- ----------------------------
ALTER TABLE "public"."tb_conference_info" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_attend"
-- ----------------------------
ALTER TABLE "public"."tb_face_attend" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_book"
-- ----------------------------
ALTER TABLE "public"."tb_face_book" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_department"
-- ----------------------------
ALTER TABLE "public"."tb_face_department" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_feature"
-- ----------------------------
ALTER TABLE "public"."tb_face_feature" ADD FOREIGN KEY ("pic_id") REFERENCES "public"."tb_face_picture" ("pic_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_face_feature" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_guest"
-- ----------------------------
ALTER TABLE "public"."tb_face_guest" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_info"
-- ----------------------------
ALTER TABLE "public"."tb_face_info" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_info_record"
-- ----------------------------
ALTER TABLE "public"."tb_face_info_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_face_info_record" ADD FOREIGN KEY ("face_id") REFERENCES "public"."tb_face_info" ("face_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_label"
-- ----------------------------
ALTER TABLE "public"."tb_face_label" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_photo"
-- ----------------------------
ALTER TABLE "public"."tb_face_photo" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_feature"
-- ----------------------------
ALTER TABLE "public"."tb_face_feature" ADD FOREIGN KEY ("pic_id") REFERENCES "public"."tb_face_picture" ("pic_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_face_feature" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_face_record"
-- ----------------------------
ALTER TABLE "public"."tb_face_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_face_record" ADD FOREIGN KEY ("face_id") REFERENCES "public"."tb_face_info" ("face_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_group"
-- ----------------------------
ALTER TABLE "public"."tb_group" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_group_face"
-- ----------------------------
ALTER TABLE "public"."tb_group_face" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_group_face" ADD FOREIGN KEY ("group_id") REFERENCES "public"."tb_group" ("group_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_guest_record"
-- ----------------------------
ALTER TABLE "public"."tb_guest_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_image_record"
-- ----------------------------
ALTER TABLE "public"."tb_image_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_network_param"
-- ----------------------------
ALTER TABLE "public"."tb_network_param" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_param"
-- ----------------------------
ALTER TABLE "public"."tb_param" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_param" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_position_depart"
-- ----------------------------
ALTER TABLE "public"."tb_position_depart" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_position_depart" ADD FOREIGN KEY ("position_id") REFERENCES "public"."tb_term_position" ("position_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_position_depart" ADD FOREIGN KEY ("depart_id") REFERENCES "public"."tb_face_department" ("depart_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_position_network"
-- ----------------------------
ALTER TABLE "public"."tb_position_network" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_position_network" ADD FOREIGN KEY ("position_id") REFERENCES "public"."tb_term_position" ("position_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_position_network" ADD FOREIGN KEY ("net_id") REFERENCES "public"."tb_network_param" ("net_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_position_depart"
-- ----------------------------
ALTER TABLE "public"."tb_term_depart" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_term_depart" ADD FOREIGN KEY ("depart_id") REFERENCES "public"."tb_face_department" ("depart_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_term_depart" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_term_face"
-- ----------------------------
ALTER TABLE "public"."tb_term_face" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."tb_term_face" ADD FOREIGN KEY ("term_id") REFERENCES "public"."tb_terminal_info" ("term_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_term_message"
-- ----------------------------
ALTER TABLE "public"."tb_term_message" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_term_position"
-- ----------------------------
ALTER TABLE "public"."tb_term_position" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_terminal_info"
-- ----------------------------
ALTER TABLE "public"."tb_terminal_info" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_visit_record"
-- ----------------------------
ALTER TABLE "public"."tb_visit_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_car_info"
-- ----------------------------
ALTER TABLE "public"."tb_car_info" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_area"
-- ----------------------------
ALTER TABLE "public"."tb_area" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_car_area"
-- ----------------------------
ALTER TABLE "public"."tb_car_area" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_car_record"
-- ----------------------------
ALTER TABLE "public"."tb_car_record" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_centry"
-- ----------------------------
ALTER TABLE "public"."tb_centry" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."tb_park_port"
-- ----------------------------
ALTER TABLE "public"."tb_park_port" ADD FOREIGN KEY ("face_library_id") REFERENCES "public"."tb_face_library" ("face_library_id") ON DELETE CASCADE ON UPDATE CASCADE;

-----------------------------------------------------------------------------------
-- ----------------------------
-- Triggers structure for table tb_face_record
-- ----------------------------
--创建触发器函数
create or replace function process_face_attend() returns trigger as $face_attend_trigger$
declare
   exist_rec_id int := 0;
	 cdate text; 
   ctime timestamp;
	 exist_rec record;
	 c_first_time timestamp;
	 c_last_time timestamp;
	 i_first_term_id int := 0;
   i_last_term_id int := 0;

begin
   if (TG_OP = 'INSERT') then
     select new.create_time into ctime;
		 select to_char(new.create_time, 'YYYY-MM-DD') into cdate;
		 exist_rec := null;
     select * from tb_face_attend where face_id = new.face_id and to_char(first_time, 'YYYY-MM-DD') = cdate into exist_rec ;
     if exist_rec is null then
				insert into tb_face_attend values (nextval('tb_face_attend_rec_id_seq'), new.face_library_id, new.face_id, new.term_id, ctime, ctime, 0);
		 else
				begin
					c_first_time := exist_rec.first_time;
					i_first_term_id := exist_rec.term_id;
				
					if (exist_rec.last_term_id = 0) then
						begin
						c_last_time := c_first_time;
						i_last_term_id := i_first_term_id;
						end;
					else
						begin
						c_last_time := exist_rec.last_time;
						i_last_term_id := exist_rec.last_term_id;
						end;
					end if;
					
					if (new.create_time < c_first_time) then
						c_first_time := new.create_time;
						i_first_term_id := new.term_id;
					end if;

					if (new.create_time > c_last_time) then
						c_last_time := new.create_time;
						i_last_term_id := new.term_id;
					end if;

					update "public"."tb_face_attend" set "first_time"=c_first_time, "term_id"=i_first_term_id, "last_time"=c_last_time, "last_term_id"=i_last_term_id WHERE ("rec_id" = exist_rec.rec_id);
					--update "public"."tb_face_attend" set "first_time"=c_first_time, "term_id"=first_term_id, "last_time"=c_last_time WHERE ("rec_id" = exist_rec.rec_id);
				end;
     end if;
     return new;
   end if;
   return null;
end;
$face_attend_trigger$ language plpgsql;

--创建触发器
create trigger update_face_attend
after insert on "public"."tb_face_record"
for each row execute procedure process_face_attend();
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--init data
-----------------------------------------------------------------------------------
-- ----------------------------
-- Init data for table tb_user_info
-- ----------------------------
INSERT INTO tb_user_info(user_id, face_library_id, user_name, user_password, disable_role, create_time, update_time) VALUES (1,0,'plsy','LyaF/sKJeM2oKfU9aQJmMg==', 0, '2018-03-15 14:41:06','2018-03-15 14:41:06');

-- ----------------------------
-- Init data for table tb_role
-- ----------------------------
INSERT INTO tb_role(role_id,face_library_id,role_name,remark,create_time,update_time) VALUES (1,0,'超级管理员',NULL,'2018-03-15 14:41:06','2018-03-15 14:41:06');
INSERT INTO tb_role(role_id,face_library_id,role_name,remark,create_time,update_time) VALUES (2,0,'公司管理员',NULL,'2018-03-15 14:41:06','2018-03-15 14:41:06');

-- ----------------------------
-- Init data for table tb_user_role
-- ----------------------------
INSERT INTO tb_user_role(rec_id, user_id, role_id,create_time) VALUES (1, 1, 1,'2018-03-15 14:41:06');

-- ----------------------------
-- Init data for table tb_business
-- ----------------------------
INSERT INTO tb_business(business_id,name,remark,status) VALUES (0,'门禁考勤',NULL,0);
INSERT INTO tb_business(business_id,name,remark,status) VALUES (3,'会议签到',NULL,0);

-- ----------------------------
-- Init data for table tb_menu
-- ----------------------------
-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO "public"."tb_menu" VALUES ('10', '0', '员工管理', '员工管理', '1', null, '0', '1', '1');
INSERT INTO "public"."tb_menu" VALUES ('20', '0', '访客管理', '访客管理', '2', null, '0', '2', '2');
INSERT INTO "public"."tb_menu" VALUES ('30', '0', '考勤管理', '考勤管理', '3', null, '0', '3', '3');
INSERT INTO "public"."tb_menu" VALUES ('40', '0', '设备管理', '设备管理', '4', null, '0', '4', '4');
INSERT INTO "public"."tb_menu" VALUES ('50', '0', '用户管理', '用户管理', '5', null, '0', '5', '0');
INSERT INTO "public"."tb_menu" VALUES ('60', '0', '角色管理', '角色管理', '6', null, '0', '6', '0');
INSERT INTO "public"."tb_menu" VALUES ('70', '0', '公司管理', '公司管理', '7', null, '0', '7', '0');
INSERT INTO "public"."tb_menu" VALUES ('80', '0', '创建公司', '创建公司', '7', null, '-1', '1', '0');
INSERT INTO "public"."tb_menu" VALUES ('91', '0', '记录管理', '记录管理', '5', null, '0', '0', '5');
INSERT INTO "public"."tb_menu" VALUES ('90', '0', '系统设置', '系统设置', '5', null, '0', '0', '5');
INSERT INTO "public"."tb_menu" VALUES ('10001', '10', '员工设置', '员工设置', '1', null, '0', '11', '0');
INSERT INTO "public"."tb_menu" VALUES ('10002', '10', '添加员工', '添加员工', '2', null, '0', '12', '13');
INSERT INTO "public"."tb_menu" VALUES ('10003', '10', '修改员工', '编辑员工信息', '3', null, '0', '13', '15');
INSERT INTO "public"."tb_menu" VALUES ('10004', '10', '员工离职', '员工离职', '4', null, '0', '14', '16');
INSERT INTO "public"."tb_menu" VALUES ('10005', '10', '查看离职员工', '查看离职员工', '5', null, '0', '15', '17');
INSERT INTO "public"."tb_menu" VALUES ('10006', '10', '批量导入员工', '批量上传', '6', null, '0', '16', '12');
INSERT INTO "public"."tb_menu" VALUES ('10007', '10', '查看员工列表', '查看员工列表', '1', null, '0', '0', '11');
INSERT INTO "public"."tb_menu" VALUES ('10008', '10', '查看员工详情', '查看员工详情', '0', null, '0', '0', '14');
INSERT INTO "public"."tb_menu" VALUES ('20001', '20', '访客预约', '访客预约', '1', null, '0', '21', '0');
INSERT INTO "public"."tb_menu" VALUES ('20002', '20', '访客登记', '访客登记', '2', null, '0', '22', '22');
INSERT INTO "public"."tb_menu" VALUES ('20003', '20', '批量访客登记', '批量访客登记', '3', null, '0', '23', '0');
INSERT INTO "public"."tb_menu" VALUES ('20004', '20', '查看访客列表', '查看访客列表', '1', null, '0', '0', '21');
INSERT INTO "public"."tb_menu" VALUES ('20005', '20', '查看访客详情', '查看访客详情', '1', null, '0', '0', '23');
INSERT INTO "public"."tb_menu" VALUES ('20006', '20', '编辑访客信息', '编辑访客信息', '4', null, '0', '0', '24');
INSERT INTO "public"."tb_menu" VALUES ('20007', '20', '取消来访', '取消来访', '5', null, '0', '0', '25');
INSERT INTO "public"."tb_menu" VALUES ('20008', '20', '访客离开', '访客离开', '6', null, '0', '0', '26');
INSERT INTO "public"."tb_menu" VALUES ('20009', '20', '查看来访历史', '查看来访历史', '7', null, '0', '0', '27');
INSERT INTO "public"."tb_menu" VALUES ('30001', '30', '导出', '导出考勤记录', '1', null, '0', '31', '32');
INSERT INTO "public"."tb_menu" VALUES ('30002', '30', '查看考勤列表', '查看考勤列表', '1', null, '0', '0', '31');
INSERT INTO "public"."tb_menu" VALUES ('30004', '30', '查看考勤详情', '查看考勤详情', '3', null, '0', '0', '33');
INSERT INTO "public"."tb_menu" VALUES ('40001', '40', '修改信息', '管辖部门', '1', null, '0', '41', '43');
INSERT INTO "public"."tb_menu" VALUES ('40002', '40', '重新开通', '重新开通', '2', null, '0', '42', '0');
INSERT INTO "public"."tb_menu" VALUES ('40003', '40', '权限配置', '权限配置', '3', null, '0', '43', '44');
INSERT INTO "public"."tb_menu" VALUES ('40004', '40', '删除设备', '删除设备', '4', null, '0', '44', '47');
INSERT INTO "public"."tb_menu" VALUES ('40005', '40', '参数配置', '参数设置', '5', null, '0', '45', '45');
INSERT INTO "public"."tb_menu" VALUES ('40006', '40', '添加设备', '添加设备', '6', null, '0', '46', '0');
INSERT INTO "public"."tb_menu" VALUES ('40007', '40', '查看设备列表', '查看设备列表', '1', null, '0', '0', '41');
INSERT INTO "public"."tb_menu" VALUES ('40008', '40', '查看开通二维码', '查看开通二维码', '2', null, '0', '0', '42');
INSERT INTO "public"."tb_menu" VALUES ('40009', '40', '启用停用设备', '启用停用设备', '2', null, '0', '0', '46');
INSERT INTO "public"."tb_menu" VALUES ('50001', '50', '新增用户', '新增用户', '1', null, '0', '51', '0');
INSERT INTO "public"."tb_menu" VALUES ('50002', '50', '删除用户', '删除用户', '2', null, '0', '52', '0');
INSERT INTO "public"."tb_menu" VALUES ('50003', '50', '密码重置', '密码重置', '3', null, '0', '53', '0');
INSERT INTO "public"."tb_menu" VALUES ('60001', '60', '新增角色', '新增角色', '1', null, '0', '61', '0');
INSERT INTO "public"."tb_menu" VALUES ('60002', '60', '删除角色', '删除角色', '2', null, '0', '62', '0');
INSERT INTO "public"."tb_menu" VALUES ('70001', '70', '导入公共参数', '导入公共参数', '1', null, '0', '71', '0');
INSERT INTO "public"."tb_menu" VALUES ('70002', '70', '新增部门', '新增部门', '2', null, '0', '72', '0');
INSERT INTO "public"."tb_menu" VALUES ('70003', '70', '删除部门', '删除部门', '3', null, '0', '73', '0');
INSERT INTO "public"."tb_menu" VALUES ('70004', '70', '修改部门', '修改部门', '4', null, '0', '74', '0');
INSERT INTO "public"."tb_menu" VALUES ('70005', '70', '新增网络', '新增网络', '5', null, '0', '75', '0');
INSERT INTO "public"."tb_menu" VALUES ('70006', '70', '删除网络', '删除网络', '6', null, '0', '76', '0');
INSERT INTO "public"."tb_menu" VALUES ('70007', '70', '修改网络', '修改网络', '7', null, '0', '77', '0');
INSERT INTO "public"."tb_menu" VALUES ('70008', '70', '新增地点', '新增地点', '8', null, '0', '78', '0');
INSERT INTO "public"."tb_menu" VALUES ('70009', '70', '删除地点', '删除地点', '9', null, '0', '79', '0');
INSERT INTO "public"."tb_menu" VALUES ('70010', '70', '修改地点', '修改地点', '10', null, '0', '710', '0');
INSERT INTO "public"."tb_menu" VALUES ('90001', '90', '部门管理', '部门管理', '1', null, '0', '0', '91');
INSERT INTO "public"."tb_menu" VALUES ('90002', '90', '用户管理', '用户管理', '2', null, '0', '0', '92');
INSERT INTO "public"."tb_menu" VALUES ('90003', '90', '角色管理', '角色管理', '3', null, '0', '0', '93');
INSERT INTO "public"."tb_menu" VALUES ('90004', '90', '业务参数', '业务参数', '4', null, '0', '0', '94');
INSERT INTO "public"."tb_menu" VALUES ('90005', '90', '公共参数', '公共参数', '5', null, '0', '0', '95');
INSERT INTO "public"."tb_menu" VALUES ('90006', '90', '应用参数', '应用参数', '6', null, '0', '0', '96');
INSERT INTO "public"."tb_menu" VALUES ('9000101', '90001', '添加部门', '添加部门', '1', null, '0', '0', '911');
INSERT INTO "public"."tb_menu" VALUES ('9000102', '90001', '编辑部门信息', '编辑部门信息', '2', null, '0', '0', '912');
INSERT INTO "public"."tb_menu" VALUES ('9000103', '90001', '删除部门', '删除部门', '3', null, '0', '0', '913');
INSERT INTO "public"."tb_menu" VALUES ('9000201', '90002', '添加用户', '添加用户', '1', null, '0', '0', '921');
INSERT INTO "public"."tb_menu" VALUES ('9000202', '90002', '编辑用户信息', '编辑用户信息', '2', null, '0', '0', '922');
INSERT INTO "public"."tb_menu" VALUES ('9000203', '90002', '重置用户密码', '重置用户密码', '3', null, '0', '0', '923');
INSERT INTO "public"."tb_menu" VALUES ('9000204', '90002', '删除用户', '删除用户', '4', null, '0', '0', '924');
INSERT INTO "public"."tb_menu" VALUES ('9000301', '90003', '添加角色', '添加角色', '1', null, '0', '0', '931');
INSERT INTO "public"."tb_menu" VALUES ('9000302', '90003', '编辑角色信息', '编辑角色信息', '2', null, '0', '0', '932');
INSERT INTO "public"."tb_menu" VALUES ('9000303', '90003', '删除角色', '删除角色', '3', null, '0', '0', '933');

-- ----------------------------
-- Init data for table tb_role_menu
-- ----------------------------
INSERT INTO tb_role_menu(rec_id, role_id, menu_id, create_time) VALUES (1, 1, 80,'2018-03-15 14:41:06');

-- ----------------------------
-- Init data for table tb_term_model
-- ----------------------------
INSERT INTO tb_term_model(term_model,model_name) VALUES (1, 'iDR410');
INSERT INTO tb_term_model(term_model,model_name) VALUES (2, 'iDR500');
INSERT INTO tb_term_model(term_model,model_name) VALUES (3, 'iDR420');
INSERT INTO tb_term_model(term_model,model_name) VALUES (7, 'iDR600');
INSERT INTO tb_term_model(term_model,model_name) VALUES (10, 'iDR700-RZY');
INSERT INTO tb_term_model(term_model,model_name) VALUES (15, 'iDR700-RZF');
INSERT INTO tb_term_model(term_model,model_name) VALUES (16, 'iDR710');
INSERT INTO tb_term_model(term_model,model_name) VALUES (18, 'iDR700-RYY');
INSERT INTO tb_term_model(term_model,model_name) VALUES (19, 'iDR720');
INSERT INTO tb_term_model(term_model,model_name) VALUES (20, 'iDR610');
INSERT INTO tb_term_model(term_model,model_name) VALUES (21, 'iDR700-RYF');
INSERT INTO tb_term_model(term_model,model_name) VALUES (22, 'iDR700-HHF');
INSERT INTO tb_term_model(term_model,model_name) VALUES (23, 'iDR810-SAT');
INSERT INTO tb_term_model(term_model,model_name) VALUES (100, 'FACE_CHECK');

-- ----------------------------
-- Init data for table tb_visit_reason
-- ----------------------------
INSERT INTO "public"."tb_visit_reason" VALUES ('1', '0', '合作洽谈', null, null, null);
INSERT INTO "public"."tb_visit_reason" VALUES ('2', '0', '面试', null, null, null);
INSERT INTO "public"."tb_visit_reason" VALUES ('3', '0', '会议', null, null, null);

-- ----------------------------
-- Init data for table tb_library_param
-- ----------------------------
INSERT INTO "public"."tb_library_param" VALUES ('1', '0', 'face_info_input_mod', '1', '9000员工信息录入方式限制');
INSERT INTO "public"."tb_library_param" VALUES ('2', '0', 'is_need_employee_card', '0', '9001是否必须添加工牌号');
INSERT INTO "public"."tb_library_param" VALUES ('3', '0', 'life_photo_max_size', '100', '9002比对照片文件大小上限（kB）');
INSERT INTO "public"."tb_library_param" VALUES ('4', '0', 'is_need_visit_cmp', '1', '9003访客登记是否需要人证比对');
INSERT INTO "public"."tb_library_param" VALUES ('5', '0', 'is_need_visit_tel', '1', '9004访客登记是否需要填写手机号');
INSERT INTO "public"."tb_library_param" VALUES ('6', '0', 'is_need_visit_photo', '1', '9005访客登记是否需要上传照片');
INSERT INTO "public"."tb_library_param" VALUES ('7', '0', 'is_need_visit_idcard', '1', '9006访客登记是否需要填写身份证号');
INSERT INTO "public"."tb_library_param" VALUES ('8', '0', 'auto_refresh_interval', '10', '界面自动刷新间隔时间');

-- ----------------------------
-- Init data for table pl_system
-- ----------------------------
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('1', '1', 'net_similarity_1vn', '0.7', '网络1：n人照阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('2', '1', 'net_similarity_1vn_pcard', '0.45', '网络1：n人证阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('3', '1', 'net_similarity_pcard', '0.45', '网络1：1人证阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('4', '1', 'net_similarity_pphoto', '0.7', '网络1：1人照阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('5', '1', 'local_similarity_1vn', '0.6', '本地1：n人照阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('6', '1', 'local_similarity_1vn_pcard', '0.45', '本地1：n人证阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('7', '1', 'local_similarity_pcard', '0.45', '本地1：1人证阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('8', '1', 'local_similarity_pphoto', '0.6', '本地1：1人照阈值');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('9', '1', 'net_servport', '5672', '比对服务器端口');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('10', '1', 'net_serv_uname', 'admin', '比对服务器用户名');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('11', '1', 'net_serv_pwd', 'admin', '比对服务器密码');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('12', '1', 'cnt_cmp_succ', '1', '连续比对通过的个数');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('13', '1', 'bgr_interval', '0', '取预览帧间隔时间');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('14', '1', 'auto_restart', '1', '是否异常退出自动重启');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('15', '1', 'timeout_compare', '4000', '比对超时时间');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('16', '1', 'platform_conn_timeout', '20', '连接服务端的超时时间');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('17', '1', 'comm_server_port', '4567', '通信服务器端口号');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('18', '1', 'net_library_id', '1', '网络比对人脸库id');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('19', '1', 'max_organizational_structure', '6', '最大组织结构');

INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('20', '1', 'comm_server_ip', '', '通信服务器ip地址');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('21', '1', 'heartbeat_server_ip', '', '心跳服务器ip地址');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('22', '1', 'net_servip', '', '比对服务器ip地址');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('23', '1', 'net_comp_server_addr_wb', '', 'WebService比对服务器地址');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('24', '1', 'net_comp_server_port_wb', '8950', 'WebService比对服务器端口');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('25', '1', 'net_comp_server_uname_wb', '', 'WebService比对服务器用户名');
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('26', '1', 'net_comp_server_pwd_wb', '', 'WebService比对服务器密码');

-- ----------------------------
-- Init data for table tb_hint_text
-- ----------------------------
INSERT INTO "public"."tb_hint_text" VALUES (1, 0, 0, 'mod_face_only', '(0001)仅刷脸提示', '请刷脸', '请刷脸');
INSERT INTO "public"."tb_hint_text" VALUES (2, 0, 0, 'mod_card_only', '(0002)仅刷卡提示','请刷卡', '请刷卡');
INSERT INTO "public"."tb_hint_text" VALUES (3, 0, 0, 'mod_face_or_card', '(0003)刷脸刷卡提示','请刷脸或刷卡', '请刷脸或刷卡');
INSERT INTO "public"."tb_hint_text" VALUES (4, 0, 0, 'auth_emp_wel', '(0004)授权员工验证通过提示', '%s您好', '%s您好');
INSERT INTO "public"."tb_hint_text" VALUES (5, 0, 0, 'unauth_emp_wel', '(0005)未授权员工验证通过提示','%s欢迎来访', '%s欢迎来访');
INSERT INTO "public"."tb_hint_text" VALUES (6, 0, 0, 'auth_visitor_wel', '(0006)授权访客验证通过提示','%s欢迎来访', '%s欢迎来访');
INSERT INTO "public"."tb_hint_text" VALUES (7, 0, 0, 'unauth_visitor_wel', '(0007)未授权访客验证通过提示','%s欢迎来访', '%s欢迎来访');
INSERT INTO "public"."tb_hint_text" VALUES (8, 0, 0, 'cmp_timeout', '(0008)比对超时提示','比对超时', '比对超时');
INSERT INTO "public"."tb_hint_text" VALUES (9, 0, 0, 'cmp_unpass', '(0009)比对不通过提示','比对不通过', '比对不通过');
INSERT INTO "public"."tb_hint_text" VALUES (10, 0, 0, 'cmp_pphoto', '(0010)人照比对提示','请刷脸进行比对', '请刷脸进行比对');
INSERT INTO "public"."tb_hint_text" VALUES (11, 0, 0, 'cmp_pcard', '(0011)人证比对提示','请刷脸进行比对', '请刷脸进行比对');
INSERT INTO "public"."tb_hint_text" VALUES (12, 0, 0, 'unauth_emp_tip', '(0012)未授权员工选择被访人提示','%s未授权', '%s未授权');
INSERT INTO "public"."tb_hint_text" VALUES (13, 0, 0, 'unauth_visitor_face_only_tip','(0013)未授权访客刷脸刷证提示', '%s您未登记', '%s您未登记');
INSERT INTO "public"."tb_hint_text" VALUES (14, 0, 0, 'unauth_visitor_face_tip', '(0014)未授权访客刷脸提示','%s请刷身份证', '%s请刷身份证');
INSERT INTO "public"."tb_hint_text" VALUES (15, 0, 0, 'unauth_visitor_empcard_tip','(0015)未授权访客刷员工卡提示', '%s请刷身份证', '%s请刷身份证');
INSERT INTO "public"."tb_hint_text" VALUES (16, 0, 0, 'unauth_visitor_idcard_tip', '(0016)未授权访客刷身份证提示','%s未授权', '%s未授权');
INSERT INTO "public"."tb_hint_text" VALUES (17, 0, 0, 'cmp_unmatch', '(0017)人证比对不匹配提示','%s请使用本人身份证', '%s请使用本人身份证');

-- ----------------------------
-- Init data for table tb_param_def
-- ----------------------------
INSERT INTO "public"."tb_param_def" VALUES (1, 0, '1036是否控制开门', 'is_control_door', '1', '开门控制参数', 'OPTION', 'N','{"set":[{"display":"否","value":"0","control":""},{"display":"门禁","value":"1","control":"switch_mode,lock_type"}]}');
INSERT INTO "public"."tb_param_def" VALUES (2, 0, '1004开门模式', 'switch_mode', 'TCP', '开门控制参数', 'OPTION', 'Y','{"set":[{"display":"继电器","value":"TCP","control":"switch_ip,switch_cmd_on,switch_cmd_off,switch_ctrmod,switch_param,lock_type"},{"display":"IO","value":"IO","control":"lock_type"}]}');
INSERT INTO "public"."tb_param_def" VALUES (3, 0, '1032锁类型', 'lock_type', 'PULSE', '开门控制参数', 'OPTION','Y', '{"set":[{"display":"脉冲锁","value":"PULSE","control":""},{"display":"开关锁","value":"SWITCH","control":"switch_delay"}]}');
INSERT INTO "public"."tb_param_def" VALUES (4, 0, '1005网络继电器ip', 'switch_ip', '', '开门控制参数', 'TEXT', 'Y','');
INSERT INTO "public"."tb_param_def" VALUES (5, 0, '1031继电器工作模式', 'switch_ctrmod', 'SWITCH', '开门控制参数', 'OPTION', 'Y', '{"set":[{"display":"开关模式","value":"SWITCH","control":""},{"display":"点触模式","value":"TOUCH","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (6, 0, '1020继电器开命令', 'switch_cmd_on', 'RELAY1=ON', '开门控制参数', 'OPTION', 'Y', '{"set":[{"display":"RELAY1=ON","value":"RELAY1=ON","control":""},{"display":"RELAY2=ON","value":"RELAY2=ON","control":""},{"display":"RELAY3=ON","value":"RELAY3=ON","control":""},{"display":"RELAY4=ON","value":"RELAY4=ON","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (7, 0, '1021继电器关命令', 'switch_cmd_off', 'RELAY1=OFF', '开门控制参数', 'OPTION', 'Y', '{"set":[{"display":"RELAY1=OFF","value":"RELAY1=OFF","control":""},{"display":"RELAY2=OFF","value":"RELAY2=OFF","control":""},{"display":"RELAY3=OFF","value":"RELAY3=OFF","control":""},{"display":"RELAY4=OFF","value":"RELAY4=OFF","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (8, 0, '1035继电器参数', 'switch_param', '1000,3', '开门控制参数', 'TEXT', 'Y','');
INSERT INTO "public"."tb_param_def" VALUES (9, 0, '1019开门持续时间', 'switch_delay', '4000', '开门控制参数', 'NUMBER', 'Y', '{"set":[{"display":"","value":"100","control":""},{"display":"","value":"1000","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (10, 0, '1001读卡超时时间', 'timeout_readcard', '5000', '软件参数', 'NUMBER', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (11, 0, '1002卡信息显示时间', 'timeout_cardinfo', '1000', '软件参数', 'NUMBER', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (12, 0, '1003比对结果显示时间', 'timeout_result', '2000', '软件参数', 'NUMBER', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (13, 0, '1058NTP时钟同步服务器', 'ntp_server', '', '软件参数', 'TEXT', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (14, 0, '1022摄像头分辨率', 'camera_res', '640x480', '软件参数', 'OPTION', 'N', '{"set":[{"display":"1280x720","value":"1280x720","control":""},{"display":"640x480","value":"640x480","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (15, 0, '1026上传URL', 'report_url', '', '应用参数', 'TEXT', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (16, 0, '1038心跳间隔', 'heartbeat_interval', '20000', '应用参数', 'NUMBER', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (17, 0, '1006 1:n比对模式', 'cmp_mod_1vn', 'local', '应用参数', 'OPTION', 'N', '{"set":[{"display":"本地","value":"local","control":""},{"display":"网络","value":"net","control":""},{"display":"自适应","value":"auto","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (18, 0, '1007 1:1比对模式', 'cmp_mod_1v1', 'local', '应用参数', 'OPTION', 'N', '{"set":[{"display":"本地","value":"local","control":""},{"display":"网络","value":"net","control":""},{"display":"自适应","value":"auto","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (19, 0, '1008识别方式', 'detect_mode', 'card_and_face', '应用参数', 'OPTION', 'N', '{"set":[{"display":"仅刷卡","value":"card_only","control":""},{"display":"仅刷脸","value":"face_only","control":""},{"display":"刷卡或刷脸","value":"card_and_face","control":""}]}');   
INSERT INTO "public"."tb_param_def" VALUES (20, 0, '1009人脸1:1比对', 'need_face_compare', '1', '应用参数', 'OPTION', 'N', '{"set":[{"display":"是","value":"1","control":""},{"display":"否","value":"0","control":""}]}');   
INSERT INTO "public"."tb_param_def" VALUES (21, 0, '1030权限等级', 'auth_level', '0', '应用参数', 'OPTION', 'N', '{"set":[{"display":"未授权员工或访客允许开门","value":"0","control":""},{"display":"未授权员工或访客不允许开门","value":"1","control":""}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (22, 0, '1037人数统计控制', 'attend_statistics_ctrl', '0', '应用参数', 'OPTION', 'N', '{"set":[{"display":"不统计并不显示","value":"0","control":""},{"display":"离线统计并显示","value":"1","control":""}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (23, 0, '1041业务配置', 'business_config', '{"is_check_termface":true,"visit_select_emp":true,"is_visit_use_idcard":false}', '应用参数', 'JSON', 'N', '{"set":[{"key":"is_check_termface","name":"检查权限表","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"visit_select_emp","name":"访客登记选择被访人","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"is_visit_use_idcard","name":"刷身份证每次人证比对","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (24, 0, '1083检测配置', 'detect_config', '{"quality":true,"whitescreen":true,"ledlight":true,"position":true,"brightness":true,"clarity":true,"live":"none"}', '应用参数', 'JSON', 'N', '{"set":[{"key":"quality","name":"质量","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"whitescreen","name":"白屏补光","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"ledlight","name":"LED灯补光","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"position","name":"位置","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"brightness","name":"亮度","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"clarity","name":"清晰度","type":"OPTION", "value_type":"BOOL","set":[{"display":"是","value":"true","control":""},{"display":"否","value":"false","control":""}]},{"key":"live","name":"活体","type":"OPTION", "value_type":"TEXT","set":[{"display":"无活体","value":"none","control":""},{"display":"静默活体","value":"silent","control":""},{"display":"双目活体","value":"dualcam","control":""}]}]}'); 
