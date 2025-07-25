-- ---------------------------------------
-- orange-ai 服务预置数据
-- sys_dict_type ID 范围 [1000,1100)
-- sys_dict_data ID 范围 [1000*100,1100*100+100)
--
-- 字典数据ID：[字典类型ID*100, 字典类型ID*100+100)
-- eg: 字典类型ID：1 字典数据ID：[100,200)
-- ---------------------------------------
use orange;

-- 默认用户ID
SET @u_id := -100;

-- 默认租户ID
SET @t_id := -100;

BEGIN;

delete
from sys_dict_type
where id >= 1000
  and id < 1100;

delete
from sys_dict_data
where id >= 100000
  and id < 110000;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  图片分辨率  ai_image_resolution      type ID范围 [1000]  data ID范围 [100000 - 100100）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1000, @t_id, 'AI - 图片分辨率', 'ai_image_resolution', 1, 1, 'AI - 图片分辨率', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100000, @t_id, 1, '512*1024', '512*1024', 'ai_image_resolution', 1, '#409eff', 1, '分辨率-512*1024', @u_id),
       (100001, @t_id, 1, '768*512', '768*512', 'ai_image_resolution', 1, '#909399', 1, '分辨率-768*512', @u_id),
       (100002, @t_id, 1, '768*1024', '768*1024', 'ai_image_resolution', 1, '#87d068', 1, '分辨率-768*1024', @u_id),
       (100003, @t_id, 1, '1024*576', '1024*576', 'ai_image_resolution', 1, '#e6a23c', 1, '分辨率-1024*576', @u_id),
       (100004, @t_id, 1, '576*1024', '576*1024', 'ai_image_resolution', 1, '#e6a23c', 1, '分辨率-576*1024', @u_id),
       (100005, @t_id, 1, '1024*1024', '1024*1024', 'ai_image_resolution', 1, '#f56c6c', 1, '分辨率-1024*1024', @u_id);


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  会话来源  ai_session_source      type ID范围 [1001]  data ID范围 [100100 - 100200）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1001, @t_id, 'AI - 会话来源', 'ai_session_source', 1, 1, 'AI - 图片分辨率', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100100, @t_id, 1, '智能体', 'AGENT', 'ai_session_source', 1, '#409eff', 1, '会话来源-智能体', @u_id),
       (100101, @t_id, 1, '智能体调试', 'AGENT_DEBUG', 'ai_session_source', 1, '#909399', 1, '会话来源-智能体调试', @u_id),
       (100102, @t_id, 1, '体验中心-聊天会话', 'CHAT_EXPERIENCE', 'ai_session_source', 1, '#87d068', 1, '会话来源-体验中心-聊天会话', @u_id);



-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  知识库文档切片标识符  ai_knowledge_base_doc_slice_identifier      type ID范围 [1002]  data ID范围 [100200 - 100300）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1002, @t_id, 'AI - 知识库文档切片标识符', 'ai_knowledge_base_doc_slice_identifier', 1, 1, 'AI - 知识库文档切片标识符', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100200, @t_id, 1, '句号', 'FULL_STOP', 'ai_knowledge_base_doc_slice_identifier', 1, '#409eff', 1, '知识库文档切片标识符-句号', @u_id),
       (100201, @t_id, 1, '逗号', 'COMMA', 'ai_knowledge_base_doc_slice_identifier', 1, '#909399', 1, '知识库文档切片标识符-逗号', @u_id);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  知识库文档状态  ai_knowledge_doc_status      type ID范围 [1003]  data ID范围 [100300 - 100400）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1003, @t_id, 'AI - 知识库文档状态', 'ai_knowledge_doc_status', 1, 1, 'AI - 知识库文档切片标识符', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100300, @t_id, 1, '解析中', 'PARSING', 'ai_knowledge_doc_status', 1, '#409eff', 1, '知识库文档状态-解析中', @u_id),
       (100301, @t_id, 2, '解析失败', 'PARSE_FAILED', 'ai_knowledge_doc_status', 1, '#909399', 1, '知识库文档状态-解析失败', @u_id),
       (100302, @t_id, 3, '待向量化', 'EMB_PENDING', 'ai_knowledge_doc_status', 1, '#909399', 1, '知识库文档状态-待向量化', @u_id),
       (100303, @t_id, 4, '向量化中', 'EMB_PROCESSING', 'ai_knowledge_doc_status', 1, '#909399', 1, '知识库文档状态-向量化中', @u_id),
       (100304, @t_id, 5, '向量化失败', 'EMB_FAILED', 'ai_knowledge_doc_status', 1, '#909399', 1, '知识库文档状态-向量化失败', @u_id),
       (100305, @t_id, 6, '成功', 'SUCCESS', 'ai_knowledge_doc_status', 1, '#909399', 1, '知识库文档状态-成功', @u_id)
;



-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  MCP SERVER 传输协议  ai_mcp_server_transport_protocol      type ID范围 [1004]  data ID范围 [100400 - 100500）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1004, @t_id, 'AI - MCP SERVER 传输协议', 'ai_mcp_server_transport_protocol', 1, 1, 'AI - MCP SERVER 传输协议', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100400, @t_id, 1, 'SSE', 'SSE', 'ai_mcp_server_transport_protocol', 1, '#409eff', 1, 'SSE', @u_id)
;



-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  应用类型  ai_app_type      type ID范围 [1005]  data ID范围 [100500 - 100600）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1005, @t_id, 'AI - 应用类型', 'ai_app_type', 1, 1, 'AI - 应用类型', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100500, @t_id, 1, '智能体', 'AGENT', 'ai_app_type', 1, '#409eff', 1, 'AGENT', @u_id)
#        (100501, @t_id, 1, '对话流', 'CHAT_FLOW', 'ai_app_type', 1, '#409eff', 1, 'CHAT_FLOW', @u_id),
#        (100502, @t_id, 1, '工作流', 'WORK_FLOW', 'ai_app_type', 1, '#409eff', 1, 'WORK_FLOW', @u_id)
;


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  应用类型  ai_app_status      type ID范围 [1006]  data ID范围 [100600 - 100700）
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 新增字典类型
INSERT INTO sys_dict_type (id, tenant_id, name, dict_type, enabled, preset, description, created_by)
VALUES (1006, @t_id, 'AI - 应用类型', 'ai_app_status', 1, 1, 'AI - 应用状态', @u_id);

-- 新增字典数据
INSERT INTO sys_dict_data (id, tenant_id, sort, dict_label, dict_value, dict_type, preset, show_style, enabled, description, created_by)
VALUES (100600, @t_id, 1, '草稿', 'DRAFT', 'ai_app_status', 1, '#0003', 1, '草稿', @u_id),
       (100601, @t_id, 1, '已发布', 'PUBLISHED', 'ai_app_status', 1, '#5cb300', 1, '已发布', @u_id),
       (100602, @t_id, 1, '已发布编辑中', 'PUBLISHED_EDITING', 'ai_app_status', 1, '#409eff', 1, '已发布编辑中', @u_id)
;

COMMIT;


