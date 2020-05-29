-- --------------------------------------------------------------
-- 2020-04-23
-- update tb_term_face,add:revno\status\update_status\create_time
-- update tb_menu record,������¼����Ϊ��¼����
--
-- 2020-04-21
-- update tb_guest_record,add:temperature\mask\pic_id
--												update face_id not null,foreign key
-- update tb_face_record,add:temperature\mask\pic_id
-- update tb_face_picture face_id is allow null
-- 2019-12-10
-- update terminal model define
-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- face gate database V2.0.6 2019-10-24 for FaceGateServerLite V1.2.0
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

ALTER TABLE "public"."pl_system"
ALTER "value" TYPE varchar(32) COLLATE "default";

-- ----------------------------
-- Table structure for tb_face_feature
-- ----------------------------
ALTER TABLE "public"."tb_face_feature"
ADD COLUMN IF NOT EXISTS "feature_ver" varchar(16);


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
-- Primary Key structure for table tb_param_def
-- ----------------------------
ALTER TABLE "public"."tb_param_def" ADD PRIMARY KEY ("rec_id");

-- ----------------------------
-- Init data for tb_param_def
-- ----------------------------
INSERT INTO "public"."tb_param_def" VALUES (1, 0, '1036�Ƿ���ƿ���', 'is_control_door', '1', '���ſ��Ʋ���', 'OPTION', 'N','{"set":[{"display":"��","value":"0","control":""},{"display":"�Ž�","value":"1","control":"switch_mode,lock_type"}]}');
INSERT INTO "public"."tb_param_def" VALUES (2, 0, '1004����ģʽ', 'switch_mode', 'TCP', '���ſ��Ʋ���', 'OPTION', 'Y','{"set":[{"display":"�̵���","value":"TCP","control":"switch_ip,switch_cmd_on,switch_cmd_off,switch_ctrmod,switch_param,lock_type"},{"display":"IO","value":"IO","control":"lock_type"}]}');
INSERT INTO "public"."tb_param_def" VALUES (3, 0, '1032������', 'lock_type', 'PULSE', '���ſ��Ʋ���', 'OPTION','Y', '{"set":[{"display":"������","value":"PULSE","control":""},{"display":"������","value":"SWITCH","control":"switch_delay"}]}');
INSERT INTO "public"."tb_param_def" VALUES (4, 0, '1005����̵���ip', 'switch_ip', '', '���ſ��Ʋ���', 'TEXT', 'Y','');
INSERT INTO "public"."tb_param_def" VALUES (5, 0, '1031�̵�������ģʽ', 'switch_ctrmod', 'SWITCH', '���ſ��Ʋ���', 'OPTION', 'Y', '{"set":[{"display":"����ģʽ","value":"SWITCH","control":""},{"display":"�㴥ģʽ","value":"TOUCH","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (6, 0, '1020�̵���������', 'switch_cmd_on', 'RELAY1=ON', '���ſ��Ʋ���', 'OPTION', 'Y', '{"set":[{"display":"RELAY1=ON","value":"RELAY1=ON","control":""},{"display":"RELAY2=ON","value":"RELAY2=ON","control":""},{"display":"RELAY3=ON","value":"RELAY3=ON","control":""},{"display":"RELAY4=ON","value":"RELAY4=ON","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (7, 0, '1021�̵���������', 'switch_cmd_off', 'RELAY1=OFF', '���ſ��Ʋ���', 'OPTION', 'Y', '{"set":[{"display":"RELAY1=OFF","value":"RELAY1=OFF","control":""},{"display":"RELAY2=OFF","value":"RELAY2=OFF","control":""},{"display":"RELAY3=OFF","value":"RELAY3=OFF","control":""},{"display":"RELAY4=OFF","value":"RELAY4=OFF","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (8, 0, '1035�̵�������', 'switch_param', '1000,3', '���ſ��Ʋ���', 'TEXT', 'Y','');
INSERT INTO "public"."tb_param_def" VALUES (9, 0, '1019���ų���ʱ��', 'switch_delay', '4000', '���ſ��Ʋ���', 'NUMBER', 'Y', '{"set":[{"display":"","value":"100","control":""},{"display":"","value":"1000","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (10, 0, '1001������ʱʱ��', 'timeout_readcard', '5000', '�������', 'NUMBER', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (11, 0, '1002����Ϣ��ʾʱ��', 'timeout_cardinfo', '1000', '�������', 'NUMBER', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (12, 0, '1003�ȶԽ����ʾʱ��', 'timeout_result', '2000', '�������', 'NUMBER', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (13, 0, '1058NTPʱ��ͬ��������', 'ntp_server', '', '�������', 'TEXT', 'N', '');
INSERT INTO "public"."tb_param_def" VALUES (14, 0, '1022����ͷ�ֱ���', 'camera_res', '640x480', '�������', 'OPTION', 'N', '{"set":[{"display":"1280x720","value":"1280x720","control":""},{"display":"640x480","value":"640x480","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (15, 0, '1026�ϴ�URL', 'report_url', '', 'Ӧ�ò���', 'TEXT', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (16, 0, '1038�������', 'heartbeat_interval', '20000', 'Ӧ�ò���', 'NUMBER', 'N','');
INSERT INTO "public"."tb_param_def" VALUES (17, 0, '1006 1:n�ȶ�ģʽ', 'cmp_mod_1vn', 'local', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"����","value":"local","control":""},{"display":"����","value":"net","control":""},{"display":"����Ӧ","value":"auto","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (18, 0, '1007 1:1�ȶ�ģʽ', 'cmp_mod_1v1', 'local', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"����","value":"local","control":""},{"display":"����","value":"net","control":""},{"display":"����Ӧ","value":"auto","control":""}]}');
INSERT INTO "public"."tb_param_def" VALUES (19, 0, '1008ʶ��ʽ', 'detect_mode', 'card_and_face', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"��ˢ��","value":"card_only","control":""},{"display":"��ˢ��","value":"face_only","control":""},{"display":"ˢ����ˢ��","value":"card_and_face","control":""}]}');   
INSERT INTO "public"."tb_param_def" VALUES (20, 0, '1009����1:1�ȶ�', 'need_face_compare', '1', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"��","value":"1","control":""},{"display":"��","value":"0","control":""}]}');   
INSERT INTO "public"."tb_param_def" VALUES (21, 0, '1030Ȩ�޵ȼ�', 'auth_level', '0', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"δ��ȨԱ����ÿ�������","value":"0","control":""},{"display":"δ��ȨԱ����ÿͲ�������","value":"1","control":""}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (22, 0, '1037����ͳ�ƿ���', 'attend_statistics_ctrl', '0', 'Ӧ�ò���', 'OPTION', 'N', '{"set":[{"display":"��ͳ�Ʋ�����ʾ","value":"0","control":""},{"display":"����ͳ�Ʋ���ʾ","value":"1","control":""}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (23, 0, '1041ҵ������', 'business_config', '{"is_check_termface":true,"visit_select_emp":true,"is_visit_use_idcard":false}', 'Ӧ�ò���', 'JSON', 'N', '{"set":[{"key":"is_check_termface","name":"���Ȩ�ޱ�","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"visit_select_emp","name":"�ÿ͵Ǽ�ѡ�񱻷���","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"is_visit_use_idcard","name":"ˢ���֤ÿ����֤�ȶ�","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]}]}'); 
INSERT INTO "public"."tb_param_def" VALUES (24, 0, '1083�������', 'detect_config', '{"quality":true,"whitescreen":true,"ledlight":true,"position":true,"brightness":true,"clarity":true,"live":"none"}', 'Ӧ�ò���', 'JSON', 'N', '{"set":[{"key":"quality","name":"����","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"whitescreen","name":"��������","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"ledlight","name":"LED�Ʋ���","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"position","name":"λ��","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"brightness","name":"����","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"clarity","name":"������","type":"OPTION", "value_type":"BOOL","set":[{"display":"��","value":"true","control":""},{"display":"��","value":"false","control":""}]},{"key":"live","name":"����","type":"OPTION", "value_type":"TEXT","set":[{"display":"�޻���","value":"none","control":""},{"display":"��Ĭ����","value":"silent","control":""},{"display":"˫Ŀ����","value":"dualcam","control":""}]}]}'); 


-- ----------------------------
-- Table structure for tb_hint_text
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_hint_text" (
"rec_id" int4 NOT NULL  PRIMARY KEY,
"face_library_id" int4,
"term_id" int4,
"hint_key" varchar(32) COLLATE "default" NOT NULL,
"hint_name" varchar(128) COLLATE "default",
"hint_sound_text" varchar(32) COLLATE "default" NOT NULL,
"hint_text" varchar(32) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)
;

ALTER TABLE "public"."tb_hint_text"
ADD COLUMN IF NOT EXISTS "hint_name" varchar(128);

-- ----------------------------
-- Init data for table tb_hint_text
-- ----------------------------
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (1, 0, 0, 'mod_face_only', '(0001)��ˢ����ʾ', '��ˢ��', '��ˢ��') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (2, 0, 0, 'mod_card_only', '(0002)��ˢ����ʾ','��ˢ��', '��ˢ��') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (3, 0, 0, 'mod_face_or_card', '(0003)ˢ��ˢ����ʾ','��ˢ����ˢ��', '��ˢ����ˢ��') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (4, 0, 0, 'auth_emp_wel', '(0004)��ȨԱ����֤ͨ����ʾ', '%s����', '%s����') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (5, 0, 0, 'unauth_emp_wel', '(0005)δ��ȨԱ����֤ͨ����ʾ','%s��ӭ����', '%s��ӭ����') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (6, 0, 0, 'auth_visitor_wel', '(0006)��Ȩ�ÿ���֤ͨ����ʾ','%s��ӭ����', '%s��ӭ����') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (7, 0, 0, 'unauth_visitor_wel', '(0007)δ��Ȩ�ÿ���֤ͨ����ʾ','%s��ӭ����', '%s��ӭ����') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (8, 0, 0, 'cmp_timeout', '(0008)�ȶԳ�ʱ��ʾ','�ȶԳ�ʱ', '�ȶԳ�ʱ') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (9, 0, 0, 'cmp_unpass', '(0009)�ȶԲ�ͨ����ʾ','�ȶԲ�ͨ��', '�ȶԲ�ͨ��') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (10, 0, 0, 'cmp_pphoto', '(0010)���ձȶ���ʾ','��ˢ�����бȶ�', '��ˢ�����бȶ�') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (11, 0, 0, 'cmp_pcard', '(0011)��֤�ȶ���ʾ','��ˢ�����бȶ�', '��ˢ�����бȶ�') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (12, 0, 0, 'unauth_emp_tip', '(0012)δ��ȨԱ��ѡ�񱻷�����ʾ','%sδ��Ȩ', '%sδ��Ȩ') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (13, 0, 0, 'unauth_visitor_face_only_tip','(0013)δ��Ȩ�ÿ�ˢ��ˢ֤��ʾ', '%s��δ�Ǽ�', '%s��δ�Ǽ�') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (14, 0, 0, 'unauth_visitor_face_tip', '(0014)δ��Ȩ�ÿ�ˢ����ʾ','%s��ˢ���֤', '%s��ˢ���֤') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (15, 0, 0, 'unauth_visitor_empcard_tip','(0015)δ��Ȩ�ÿ�ˢԱ������ʾ', '%s��ˢ���֤', '%s��ˢ���֤') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (16, 0, 0, 'unauth_visitor_idcard_tip', '(0016)δ��Ȩ�ÿ�ˢ���֤��ʾ','%sδ��Ȩ', '%sδ��Ȩ') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (17, 0, 0, 'cmp_unmatch', '(0017)��֤�ȶԲ�ƥ����ʾ','%s��ʹ�ñ������֤', '%s��ʹ�ñ������֤') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
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
-- Records of tb_menu
-- ----------------------------
INSERT INTO "public"."tb_menu" VALUES ('10', '0', 'Ա������', 'Ա������', '1', null, '0', '1', '1');
INSERT INTO "public"."tb_menu" VALUES ('20', '0', '�ÿ͹���', '�ÿ͹���', '2', null, '0', '2', '2');
INSERT INTO "public"."tb_menu" VALUES ('30', '0', '���ڹ���', '���ڹ���', '3', null, '0', '3', '3');
INSERT INTO "public"."tb_menu" VALUES ('40', '0', '�豸����', '�豸����', '4', null, '0', '4', '4');
INSERT INTO "public"."tb_menu" VALUES ('50', '0', '�û�����', '�û�����', '5', null, '0', '5', '0');
INSERT INTO "public"."tb_menu" VALUES ('60', '0', '��ɫ����', '��ɫ����', '6', null, '0', '6', '0');
INSERT INTO "public"."tb_menu" VALUES ('70', '0', '��˾����', '��˾����', '7', null, '0', '7', '0');
INSERT INTO "public"."tb_menu" VALUES ('80', '0', '������˾', '������˾', '7', null, '-1', '1', '0');
INSERT INTO "public"."tb_menu" VALUES ('91', '0', '��¼����', '��¼����', '5', null, '0', '0', '5');
INSERT INTO "public"."tb_menu" VALUES ('90', '0', 'ϵͳ����', 'ϵͳ����', '5', null, '0', '0', '6');
INSERT INTO "public"."tb_menu" VALUES ('10001', '10', 'Ա������', 'Ա������', '1', null, '0', '11', '0');
INSERT INTO "public"."tb_menu" VALUES ('10002', '10', '���Ա��', '���Ա��', '2', null, '0', '12', '13');
INSERT INTO "public"."tb_menu" VALUES ('10003', '10', '�޸�Ա��', '�༭Ա����Ϣ', '3', null, '0', '13', '15');
INSERT INTO "public"."tb_menu" VALUES ('10004', '10', 'Ա����ְ', 'Ա����ְ', '4', null, '0', '14', '16');
INSERT INTO "public"."tb_menu" VALUES ('10005', '10', '�鿴��ְԱ��', '�鿴��ְԱ��', '5', null, '0', '15', '17');
INSERT INTO "public"."tb_menu" VALUES ('10006', '10', '��������Ա��', '�����ϴ�', '6', null, '0', '16', '12');
INSERT INTO "public"."tb_menu" VALUES ('10007', '10', '�鿴Ա���б�', '�鿴Ա���б�', '1', null, '0', '0', '11');
INSERT INTO "public"."tb_menu" VALUES ('10008', '10', '�鿴Ա������', '�鿴Ա������', '0', null, '0', '0', '14');
INSERT INTO "public"."tb_menu" VALUES ('20001', '20', '�ÿ�ԤԼ', '�ÿ�ԤԼ', '1', null, '0', '21', '0');
INSERT INTO "public"."tb_menu" VALUES ('20002', '20', '�ÿ͵Ǽ�', '�ÿ͵Ǽ�', '2', null, '0', '22', '22');
INSERT INTO "public"."tb_menu" VALUES ('20003', '20', '�����ÿ͵Ǽ�', '�����ÿ͵Ǽ�', '3', null, '0', '23', '0');
INSERT INTO "public"."tb_menu" VALUES ('20004', '20', '�鿴�ÿ��б�', '�鿴�ÿ��б�', '1', null, '0', '0', '21');
INSERT INTO "public"."tb_menu" VALUES ('20005', '20', '�鿴�ÿ�����', '�鿴�ÿ�����', '1', null, '0', '0', '23');
INSERT INTO "public"."tb_menu" VALUES ('20006', '20', '�༭�ÿ���Ϣ', '�༭�ÿ���Ϣ', '4', null, '0', '0', '24');
INSERT INTO "public"."tb_menu" VALUES ('20007', '20', 'ȡ������', 'ȡ������', '5', null, '0', '0', '25');
INSERT INTO "public"."tb_menu" VALUES ('20008', '20', '�ÿ��뿪', '�ÿ��뿪', '6', null, '0', '0', '26');
INSERT INTO "public"."tb_menu" VALUES ('20009', '20', '�鿴������ʷ', '�鿴������ʷ', '7', null, '0', '0', '27');
INSERT INTO "public"."tb_menu" VALUES ('30001', '30', '����', '�������ڼ�¼', '1', null, '0', '31', '32');
INSERT INTO "public"."tb_menu" VALUES ('30002', '30', '�鿴�����б�', '�鿴�����б�', '1', null, '0', '0', '31');
INSERT INTO "public"."tb_menu" VALUES ('30004', '30', '�鿴��������', '�鿴��������', '3', null, '0', '0', '33');
INSERT INTO "public"."tb_menu" VALUES ('40001', '40', '�޸���Ϣ', '��Ͻ����', '1', null, '0', '41', '43');
INSERT INTO "public"."tb_menu" VALUES ('40002', '40', '���¿�ͨ', '���¿�ͨ', '2', null, '0', '42', '0');
INSERT INTO "public"."tb_menu" VALUES ('40003', '40', 'Ȩ������', 'Ȩ������', '3', null, '0', '43', '44');
INSERT INTO "public"."tb_menu" VALUES ('40004', '40', 'ɾ���豸', 'ɾ���豸', '4', null, '0', '44', '47');
INSERT INTO "public"."tb_menu" VALUES ('40005', '40', '��������', '��������', '5', null, '0', '45', '45');
INSERT INTO "public"."tb_menu" VALUES ('40006', '40', '����豸', '����豸', '6', null, '0', '46', '0');
INSERT INTO "public"."tb_menu" VALUES ('40007', '40', '�鿴�豸�б�', '�鿴�豸�б�', '1', null, '0', '0', '41');
INSERT INTO "public"."tb_menu" VALUES ('40008', '40', '�鿴��ͨ��ά��', '�鿴��ͨ��ά��', '2', null, '0', '0', '42');
INSERT INTO "public"."tb_menu" VALUES ('40009', '40', '����ͣ���豸', '����ͣ���豸', '2', null, '0', '0', '46');
INSERT INTO "public"."tb_menu" VALUES ('50001', '50', '�����û�', '�����û�', '1', null, '0', '51', '0');
INSERT INTO "public"."tb_menu" VALUES ('50002', '50', 'ɾ���û�', 'ɾ���û�', '2', null, '0', '52', '0');
INSERT INTO "public"."tb_menu" VALUES ('50003', '50', '��������', '��������', '3', null, '0', '53', '0');
INSERT INTO "public"."tb_menu" VALUES ('60001', '60', '������ɫ', '������ɫ', '1', null, '0', '61', '0');
INSERT INTO "public"."tb_menu" VALUES ('60002', '60', 'ɾ����ɫ', 'ɾ����ɫ', '2', null, '0', '62', '0');
INSERT INTO "public"."tb_menu" VALUES ('70001', '70', '���빫������', '���빫������', '1', null, '0', '71', '0');
INSERT INTO "public"."tb_menu" VALUES ('70002', '70', '��������', '��������', '2', null, '0', '72', '0');
INSERT INTO "public"."tb_menu" VALUES ('70003', '70', 'ɾ������', 'ɾ������', '3', null, '0', '73', '0');
INSERT INTO "public"."tb_menu" VALUES ('70004', '70', '�޸Ĳ���', '�޸Ĳ���', '4', null, '0', '74', '0');
INSERT INTO "public"."tb_menu" VALUES ('70005', '70', '��������', '��������', '5', null, '0', '75', '0');
INSERT INTO "public"."tb_menu" VALUES ('70006', '70', 'ɾ������', 'ɾ������', '6', null, '0', '76', '0');
INSERT INTO "public"."tb_menu" VALUES ('70007', '70', '�޸�����', '�޸�����', '7', null, '0', '77', '0');
INSERT INTO "public"."tb_menu" VALUES ('70008', '70', '�����ص�', '�����ص�', '8', null, '0', '78', '0');
INSERT INTO "public"."tb_menu" VALUES ('70009', '70', 'ɾ���ص�', 'ɾ���ص�', '9', null, '0', '79', '0');
INSERT INTO "public"."tb_menu" VALUES ('70010', '70', '�޸ĵص�', '�޸ĵص�', '10', null, '0', '710', '0');
INSERT INTO "public"."tb_menu" VALUES ('90001', '90', '���Ź���', '���Ź���', '1', null, '0', '0', '91');
INSERT INTO "public"."tb_menu" VALUES ('90002', '90', '�û�����', '�û�����', '2', null, '0', '0', '92');
INSERT INTO "public"."tb_menu" VALUES ('90003', '90', '��ɫ����', '��ɫ����', '3', null, '0', '0', '93');
INSERT INTO "public"."tb_menu" VALUES ('90004', '90', 'ҵ�����', 'ҵ�����', '4', null, '0', '0', '94');
INSERT INTO "public"."tb_menu" VALUES ('90005', '90', '��������', '��������', '5', null, '0', '0', '95');
INSERT INTO "public"."tb_menu" VALUES ('90006', '90', 'Ӧ�ò���', 'Ӧ�ò���', '6', null, '0', '0', '96');
INSERT INTO "public"."tb_menu" VALUES ('9000101', '90001', '��Ӳ���', '��Ӳ���', '1', null, '0', '0', '911');
INSERT INTO "public"."tb_menu" VALUES ('9000102', '90001', '�༭������Ϣ', '�༭������Ϣ', '2', null, '0', '0', '912');
INSERT INTO "public"."tb_menu" VALUES ('9000103', '90001', 'ɾ������', 'ɾ������', '3', null, '0', '0', '913');
INSERT INTO "public"."tb_menu" VALUES ('9000201', '90002', '����û�', '����û�', '1', null, '0', '0', '921');
INSERT INTO "public"."tb_menu" VALUES ('9000202', '90002', '�༭�û���Ϣ', '�༭�û���Ϣ', '2', null, '0', '0', '922');
INSERT INTO "public"."tb_menu" VALUES ('9000203', '90002', '�����û�����', '�����û�����', '3', null, '0', '0', '923');
INSERT INTO "public"."tb_menu" VALUES ('9000204', '90002', 'ɾ���û�', 'ɾ���û�', '4', null, '0', '0', '924');
INSERT INTO "public"."tb_menu" VALUES ('9000301', '90003', '��ӽ�ɫ', '��ӽ�ɫ', '1', null, '0', '0', '931');
INSERT INTO "public"."tb_menu" VALUES ('9000302', '90003', '�༭��ɫ��Ϣ', '�༭��ɫ��Ϣ', '2', null, '0', '0', '932');
INSERT INTO "public"."tb_menu" VALUES ('9000303', '90003', 'ɾ����ɫ', 'ɾ����ɫ', '3', null, '0', '0', '933');

-- ----------------------------
-- update Records of pl_system
-- ----------------------------
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('19', '1', 'max_organizational_structure', '6', '�����֯�ṹ')  ON CONFLICT(rec_id)  do UPDATE set value=excluded.value;

CREATE OR REPLACE FUNCTION INSERT_COMP_WEBSERVICE_PARAM()
  RETURNS INTEGER AS $is_insert$
DECLARE
 exist_param int :=0;
 new_rec_id int:= 1;
 server_ip text;
 is_insert integer:= 0;
BEGIN
	SELECT rec_id from "public"."pl_system" WHERE face_library_id = 1 and key = 'net_comp_server_addr_wb' into exist_param;
	IF exist_param is NULL THEN
		SELECT value from pl_system where face_library_id = 1 and key = 'comm_server_ip' into server_ip;
		SELECT max(rec_id)+1 from pl_system into new_rec_id;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_addr_wb', server_ip, 'WebService�ȶԷ�������ַ');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_port_wb', '8950', 'WebService�ȶԷ������˿�');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_uname_wb', '', 'WebService�ȶԷ������û���');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_pwd_wb', '', 'WebService�ȶԷ���������');
		is_insert = 1;
 END IF;
	RETURN is_insert;
END
$is_insert$
  LANGUAGE 'plpgsql' VOLATILE COST 100;
SELECT INSERT_COMP_WEBSERVICE_PARAM();

-----------------------------------------------------------------------------------
-- ----------------------------
-- Triggers structure for table tb_face_record
-- ----------------------------
--��������������
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

-- ----------------------------
-- Table structure for tb_car_info
-- ----------------------------
CREATE TABLE  IF NOT EXISTS "public"."tb_car_info" (
"rec_id" int4 NOT NULL PRIMARY KEY,
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
-- Table structure for tb_area
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_area" (
"rec_id" int4 NOT NULL PRIMARY KEY,
"face_library_id" int4,
"area_id" int4,
"area_name" varchar(64) COLLATE "default",
"spaces_num" int4,
"surplus_num" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for tb_car_area
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_car_area" (
"rec_id" int4 NOT NULL PRIMARY KEY,
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
-- SEQUENCE for tb_car_record
-- ----------------------------
CREATE SEQUENCE IF NOT EXISTS "public"."tb_car_record_rec_id_seq"
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START WITH 1
 CACHE 1;

ALTER TABLE "public"."tb_car_record_rec_id_seq" OWNER TO "plsy";

-- ----------------------------
-- Table structure for tb_car_record
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_car_record" (
"rec_id" int4 DEFAULT nextval('tb_car_record_rec_id_seq'::regclass) NOT NULL PRIMARY KEY,
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

ALTER TABLE "public"."tb_car_record"
ADD COLUMN IF NOT EXISTS "plate_type" varchar(255);

-- ----------------------------
-- Table structure for tb_centry
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_centry" (
"rec_id" int4 NOT NULL PRIMARY KEY,
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
-- Table structure for tb_park_port
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_park_port" (
"rec_id" int4 NOT NULL PRIMARY KEY,
"face_library_id" int4,
"port_id" int4,
"port_name" varchar(64) COLLATE "default",
"centry_id" int4,
"port_type" int4,
"area_id" int4
)
WITH (OIDS=FALSE)

;

ALTER TABLE "public"."tb_park_port"
ADD COLUMN IF NOT EXISTS "area_id" int4;

-- ----------------------------
-- Table structure for tb_platform_access
-- ----------------------------
CREATE TABLE IF NOT EXISTS "public"."tb_platform_access" (
"access_id" int4 NOT NULL PRIMARY KEY,
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
-- Table structure for tb_guest_record
-- ----------------------------
ALTER TABLE "public"."tb_guest_record"
ADD COLUMN IF NOT EXISTS "temperature" varchar(64),
ADD COLUMN IF NOT EXISTS "mask" int4 default (0),
ADD COLUMN IF NOT EXISTS "pic_id" int4  default (0)
;

ALTER TABLE "public"."tb_guest_record"
DROP CONSTRAINT IF EXISTS "tb_guest_record_face_id_fkey";

ALTER TABLE "public"."tb_face_record"
ADD COLUMN IF NOT EXISTS "temperature" varchar(64),
ADD COLUMN IF NOT EXISTS "mask" int4 default (0),
ADD COLUMN IF NOT EXISTS "pic_id" int4  default (0)
;

ALTER TABLE "public"."tb_face_picture"
ALTER "face_id" TYPE int4;

-- ----------------------------
-- Table structure for tb_term_face
-- ----------------------------
ALTER TABLE "public"."tb_term_face"
ADD COLUMN IF NOT EXISTS "revno" varchar(32) default(202004230000000000),
ADD COLUMN IF NOT EXISTS "status" int4 default (0),
ADD COLUMN IF NOT EXISTS "update_status" int4 default (0),
DROP CONSTRAINT IF EXISTS "tb_term_face_face_id_fkey";


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

---------------------------------------
-- update terminal model define
---------------------------------------
DELETE from tb_term_model;
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
