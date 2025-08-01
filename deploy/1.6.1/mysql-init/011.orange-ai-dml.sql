-- ---------------------------------------
-- orange-ai 服务预置数据
-- ---------------------------------------

use orange;

-- 默认用户ID
SET @u_id := -100;

-- 默认租户ID
SET @t_id := -100;


BEGIN;

-- ----------------------------
-- MCP Server  start
-- ----------------------------
delete
from ai_mcp_server
where id < 10000;

INSERT INTO ai_mcp_server (id, tenant_id, name, transport_protocol, connection_url, sse_endpoint, enabled, description, created_by)
VALUES ('1', @t_id, 'orange-monomer', 'SSE', 'http://orange-monomer:8080', '/sse', 0, '', @u_id),
       ('100', @t_id, '高德地图', 'SSE', 'https://mcp.amap.com', '/sse?key=高德KEY', 0, '', @u_id);

-- ----------------------------
-- MCP Server  end
-- ----------------------------


-- ----------------------------
-- 初始化 应用  start
-- ----------------------------
delete
from ai_app
where id < 10000;

INSERT INTO ai_app (id, tenant_id, app_type, app_status, draft_version_id, published_version_id, created_by)
VALUES ('1', @t_id, 'AGENT', 'PUBLISHED', '', '1', @u_id);

delete
from ai_app_version
where id < 10000;
INSERT INTO ai_app_version (id, tenant_id, app_id, name, system_prompt, description, model_id, model_config, base_ids, base_config, mcp_ids,
                            version_status, publish_by, publish_at, created_by)
VALUES ('1', @t_id, '1', 'Orange AI 助手', '', 'Orange AI 助手', null, null, null, null, null, 'PUBLISHED', @u_id, null, @u_id);


-- ----------------------------
-- 初始化 应用  end
-- ----------------------------

COMMIT;