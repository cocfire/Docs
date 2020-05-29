-- --------------------------------------------------------------
-- 2020-04-23
-- update tb_term_face,add:revno\status\update_status\create_time
-- update tb_menu record,车辆记录更改为记录管理
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
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (1, 0, 0, 'mod_face_only', '(0001)仅刷脸提示', '请刷脸', '请刷脸') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (2, 0, 0, 'mod_card_only', '(0002)仅刷卡提示','请刷卡', '请刷卡') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (3, 0, 0, 'mod_face_or_card', '(0003)刷脸刷卡提示','请刷脸或刷卡', '请刷脸或刷卡') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (4, 0, 0, 'auth_emp_wel', '(0004)授权员工验证通过提示', '%s您好', '%s您好') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (5, 0, 0, 'unauth_emp_wel', '(0005)未授权员工验证通过提示','%s欢迎来访', '%s欢迎来访') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (6, 0, 0, 'auth_visitor_wel', '(0006)授权访客验证通过提示','%s欢迎来访', '%s欢迎来访') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (7, 0, 0, 'unauth_visitor_wel', '(0007)未授权访客验证通过提示','%s欢迎来访', '%s欢迎来访') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (8, 0, 0, 'cmp_timeout', '(0008)比对超时提示','比对超时', '比对超时') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (9, 0, 0, 'cmp_unpass', '(0009)比对不通过提示','比对不通过', '比对不通过') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (10, 0, 0, 'cmp_pphoto', '(0010)人照比对提示','请刷脸进行比对', '请刷脸进行比对') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (11, 0, 0, 'cmp_pcard', '(0011)人证比对提示','请刷脸进行比对', '请刷脸进行比对') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (12, 0, 0, 'unauth_emp_tip', '(0012)未授权员工选择被访人提示','%s未授权', '%s未授权') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (13, 0, 0, 'unauth_visitor_face_only_tip','(0013)未授权访客刷脸刷证提示', '%s您未登记', '%s您未登记') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (14, 0, 0, 'unauth_visitor_face_tip', '(0014)未授权访客刷脸提示','%s请刷身份证', '%s请刷身份证') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (15, 0, 0, 'unauth_visitor_empcard_tip','(0015)未授权访客刷员工卡提示', '%s请刷身份证', '%s请刷身份证') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (16, 0, 0, 'unauth_visitor_idcard_tip', '(0016)未授权访客刷身份证提示','%s未授权', '%s未授权') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
INSERT INTO "public"."tb_hint_text" (rec_id, face_library_id, term_id, hint_key, hint_name, hint_sound_text, hint_text) VALUES (17, 0, 0, 'cmp_unmatch', '(0017)人证比对不匹配提示','%s请使用本人身份证', '%s请使用本人身份证') ON CONFLICT(rec_id) do UPDATE set hint_name=excluded.hint_name,hint_sound_text=excluded.hint_sound_text,hint_text =excluded.hint_text;
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
INSERT INTO "public"."tb_menu" VALUES ('10', '0', '员工管理', '员工管理', '1', null, '0', '1', '1');
INSERT INTO "public"."tb_menu" VALUES ('20', '0', '访客管理', '访客管理', '2', null, '0', '2', '2');
INSERT INTO "public"."tb_menu" VALUES ('30', '0', '考勤管理', '考勤管理', '3', null, '0', '3', '3');
INSERT INTO "public"."tb_menu" VALUES ('40', '0', '设备管理', '设备管理', '4', null, '0', '4', '4');
INSERT INTO "public"."tb_menu" VALUES ('50', '0', '用户管理', '用户管理', '5', null, '0', '5', '0');
INSERT INTO "public"."tb_menu" VALUES ('60', '0', '角色管理', '角色管理', '6', null, '0', '6', '0');
INSERT INTO "public"."tb_menu" VALUES ('70', '0', '公司管理', '公司管理', '7', null, '0', '7', '0');
INSERT INTO "public"."tb_menu" VALUES ('80', '0', '创建公司', '创建公司', '7', null, '-1', '1', '0');
INSERT INTO "public"."tb_menu" VALUES ('91', '0', '记录管理', '记录管理', '5', null, '0', '0', '5');
INSERT INTO "public"."tb_menu" VALUES ('90', '0', '系统设置', '系统设置', '5', null, '0', '0', '6');
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
-- update Records of pl_system
-- ----------------------------
INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES ('19', '1', 'max_organizational_structure', '6', '最大组织结构')  ON CONFLICT(rec_id)  do UPDATE set value=excluded.value;

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
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_addr_wb', server_ip, 'WebService比对服务器地址');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_port_wb', '8950', 'WebService比对服务器端口');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_uname_wb', '', 'WebService比对服务器用户名');
		
		new_rec_id := new_rec_id+1;
		INSERT INTO "public"."pl_system" ("rec_id", "face_library_id", "key", "value", "name") VALUES (new_rec_id, '1', 'net_comp_server_pwd_wb', '', 'WebService比对服务器密码');
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
