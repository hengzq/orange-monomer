-- ---------------------------------------
-- orange-ai 服务预置数据
-- ---------------------------------------

use orange;

-- 默认用户ID
SET @u_id := -100;

-- 默认租户ID
SET @t_id := -100;

-- ----------------------------
-- 预置模型数据
-- ----------------------------
BEGIN;

delete
from ai_mcp_server
where id < 100000;

INSERT INTO ai_mcp_server (id, tenant_id, name, transport_protocol, connection_url, sse_endpoint, enabled, description, created_by)
VALUES ('1', @t_id, '高德地图', 'SSE', 'https://mcp.amap.com', '/sse?key=你的高德KEY', 0, '# 高德 MCP Server

- [https://lbs.amap.com/api/mcp-server/summary](https://lbs.amap.com/api/mcp-server/summary)', @u_id);


COMMIT;