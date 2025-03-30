-- ---------------------------------------
-- orange-ai 服务依赖菜单
-- sys_menu ID 范围 [1000,1100)
-- sys_button ID 范围 [1*1000,100*1100)
--
-- 按钮ID范围为：[菜单ID*100, (菜单ID + 1) * 100)
-- eg: 菜单ID：1 按钮ID：[100,200)
-- ---------------------------------------
use orange;

-- 默认用户ID
SET @u_id := -100;

-- 默认租户ID
SET @t_id := -100;

-- ----------------------------
-- 系统管理-菜单和按钮数据预置
-- ----------------------------
BEGIN;


delete
from sys_menu
where id >= 1000
  and id < 1100;

delete
from sys_button
where id >= 100000
  and id < 110000;

-- ----------------------------
-- AI 体验中心
-- ----------------------------
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1000, @t_id, -1, 'AI 体验中心', 'orange-ai', 0, '', 'system-settings', 0, 20, @u_id);

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1001, @t_id, 1000, '文本模型', 'orange-ai:chat:view', 0, 'large-model/chat', 'system-people-circle', 0, 10, @u_id);

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1002, @t_id, 1000, '视觉模型', 'orange-ai:text-to-image:view', 0, 'large-model/image', 'system-people-circle', 0, 20, @u_id);


-- ----------------------------
-- AI 应用中心
-- ----------------------------
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1010, @t_id, -1, 'AI 应用中心', 'orange-ai', 0, '', 'system-settings', 0, 20, @u_id);

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1011, @t_id, 1010, 'AI 智能体', 'orange-ai:agent:view', 0, 'large-model/agent', 'system-people-circle', 0, 50, @u_id);

INSERT INTO sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (101100, @t_id, 1011, '新增', 'orange-ai:agent:add', 1, 1, @u_id),
       (101101, @t_id, 1011, '删除', 'orange-ai:agent:delete', 1, 2, @u_id),
       (101102, @t_id, 1011, '修改', 'orange-ai:agent:update', 1, 3, @u_id)
;

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1012, @t_id, 1010, 'AI 知识库', 'orange-ai:knowledge:view', 0, 'large-model/knowledge-base', 'system-people-circle', 0, 50, @u_id);

INSERT INTO sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (101200, @t_id, 1012, '知识库-新增', 'orange-ai:knowledge:add', 1, 1, @u_id),
       (101201, @t_id, 1012, '知识库-删除', 'orange-ai:knowledge:delete', 1, 2, @u_id),
       (101202, @t_id, 1012, '知识库-修改', 'orange-ai:knowledge:update', 1, 3, @u_id),

       (101210, @t_id, 1012, '文档-网页导入', 'orange-ai:knowledge-doc:add-text-to-knowledge', 1, 10, @u_id),
       (101211, @t_id, 1012, '文档-本地文档导入', 'orange-ai:knowledge-doc:batch-add-document-and-slice', 1, 11, @u_id),
       (101212, @t_id, 1012, '文档-删除', 'orange-ai:knowledge-doc:delete', 1, 12, @u_id),

       (101220, @t_id, 1012, '切片-删除', 'orange-ai:knowledge-doc-slice:delete', 1, 20, @u_id),
       (101221, @t_id, 1012, '切片-修改', 'orange-ai:knowledge-doc-slice:update', 1, 21, @u_id)
;

-- ----------------------------
-- AI 运维中心
-- ----------------------------
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1020, @t_id, -1, 'AI 运维中心', 'orange-ai', 0, '', 'system-settings', 0, 20, @u_id);

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1021, @t_id, 1020, 'AI 模型管理', 'orange-ai:model:view', 0, 'large-model/model', 'system-people-circle', 0, 20, @u_id);

INSERT INTO sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (100300, @t_id, 1021, '新增', 'orange-ai:model:add', 1, 1, @u_id),
       (100301, @t_id, 1021, '删除', 'orange-ai:model:delete', 1, 10, @u_id),
       (100302, @t_id, 1021, '修改', 'orange-ai:model:update', 1, 20, @u_id)
;

INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1022, @t_id, 1020, 'AI 会话管理', 'orange-ai:session:view', 0, 'large-model/session', 'system-people-circle', 0, 50, @u_id);

COMMIT;