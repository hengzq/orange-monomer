-- ---------------------------------------
-- orange-system-dict 服务预置数据
-- sys_dict_type ID 范围 [1,100)
-- sys_dict_data ID 范围 [1*100,100*100+100)
--
-- 字典数据ID：[字典类型ID*100, 字典类型ID*100+100)
-- eg: 字典类型ID：1 字典数据ID：[100,200)
-- ---------------------------------------
use orange;

-- 默认用户ID
SET @u_id := '-100';

-- 默认租户ID
SET @t_id := '-100';

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   系统数据状态-sys_data_enable_status type ID范围 [1]  data ID范围 [100 - 200）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN;
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1, @t_id, '数据启用状态', 'sys_data_enable_status', 1, 1, '系统数据启用状态', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (100, @t_id, 1, '启用', 'true', 'sys_data_enable_status', 1, '#67c23a', 1, '启用状态', @u_id),
       (101, @t_id, 1, '禁用', 'false', 'sys_data_enable_status', 1, '#f56c6c', 1, '禁用状态', @u_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   系统操作状态-sys_operation_status type ID范围 [2]  data ID范围 [200 - 300）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (2, @t_id, '系统操作状态', 'sys_operation_status', 1, 1, '系统中操作状态', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (200, @t_id, 1, '成功', 'SUCCESS', 'sys_operation_status', 1, '#67c23a', 1, '操作成功状态', @u_id),
       (201, @t_id, 1, '失败', 'FAIL', 'sys_operation_status', 1, '#f56c6c', 1, '操作失败状态', @u_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   用户性别-sys_user_gender type ID范围 [3]  data ID范围 [300 - 400）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (3, @t_id, '用户性别', 'sys_user_gender', 1, 1, '用户性别', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (300, @t_id, 1, '男', 'MALE', 'sys_user_gender', 1, '#87d068', 1, '用户性别-男', @u_id),
       (301, @t_id, 1, '女', 'FEMALE', 'sys_user_gender', 1, '#87d068', 1, '用户性别-女', @u_id),
       (302, @t_id, 1, '未知', 'UNKNOWN', 'sys_user_gender', 1, '#83888f', 1, '用户性别-未知', @u_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   数据预设标记-sys_data_preset_status type ID范围 [4]  data ID范围 [400 - 500）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (4, @t_id, '数据预置状态', 'sys_data_preset_status', 1, 1, '数据预置标志', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (400, @t_id, 1, '是', 'true', 'sys_data_preset_status', 1, '#909399', 1, '数据预设标记-预置', @u_id),
       (401, @t_id, 1, '否', 'false', 'sys_data_preset_status', 1, '#67c23a', 1, '数据预设标记-自定义', @u_id);


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 请求方式  sys_request_method type ID范围 [5]  data ID范围 [500 - 600）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (5, @t_id, '请求方式', 'sys_request_method', 1, 1, '请求方式', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (500, @t_id, 1, 'GET', 'GET', 'sys_request_method', 1, '#409eff', 1, '请求方式-GET', @u_id),
       (501, @t_id, 1, 'HEAD', 'HEAD', 'sys_request_method', 1, '#909399', 1, '请求方式-HEAD', @u_id),
       (502, @t_id, 1, 'POST', 'POST', 'sys_request_method', 1, '#87d068', 1, '请求方式-POST', @u_id),
       (503, @t_id, 1, 'PUT', 'PUT', 'sys_request_method', 1, '#e6a23c', 1, '请求方式-PUT', @u_id),
       (504, @t_id, 1, 'PATCH', 'PATCH', 'sys_request_method', 1, '#e6a23c', 1, '请求方式-PATCH', @u_id),
       (505, @t_id, 1, 'DELETE', 'DELETE', 'sys_request_method', 1, '#f56c6c', 1, '请求方式-DELETE', @u_id),
       (506, @t_id, 1, 'OPTIONS', 'OPTIONS', 'sys_request_method', 1, '#909399', 1, '请求方式-OPTIONS',
        @u_id),
       (507, @t_id, 1, 'TRACE', 'TRACE', 'sys_request_method', 1, '#909399', 1, '请求方式-TRACE', @u_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   数据隐藏状态-sys_data_hidden_status type ID范围 [6]  data ID范围 [600 - 700）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (6, @t_id, '数据隐藏状态', 'sys_data_hidden_status', 1, 1, '数据是否隐藏 true:隐藏 false:不隐藏', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (600, @t_id, 1, '隐藏', 'true', 'sys_data_hidden_status', 1, '#909399', 1, '隐藏', @u_id),
       (601, @t_id, 2, '显示', 'false', 'sys_data_hidden_status', 1, '#67c23a', 1, '显示', @u_id);


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   登录日志类型-sys_log_login_type type ID范围 [7]  data ID范围 [700 - 800）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (7, @t_id, '登录日志类型', 'sys_log_login_type', 1, 1, '登录日志类型', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled,
                           description, created_by)
VALUES (700, @t_id, 1, '登录', 'LOGIN', 'sys_log_login_type', 1, '#409eff', 0, '登录日志类型-登录', @u_id),
       (701, @t_id, 2, '登出', 'LOGOUT', 'sys_log_login_type', 1, '#f56c6c', 0, '登录日志类型-登出', @u_id);
COMMIT;


