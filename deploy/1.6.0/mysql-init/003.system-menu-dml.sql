-- ---------------------------------------
-- orange-system-permission-core 服务依赖菜单
-- sys_menu ID 范围 [1,100)
-- sys_button ID 范围 [1*100,100*100)
--
-- 按钮ID范围为：[菜单ID*100, (菜单ID + 1) * 100)
-- eg: 菜单ID：1 按钮ID：[100,200)
-- ---------------------------------------
use orange;

-- 默认用户ID
SET @u_id := '-100';

-- 默认租户ID
SET @t_id := '-100';

-- ----------------------------
-- 系统管理-菜单和按钮数据预置
-- ----------------------------
BEGIN;

delete
from sys_menu
where id >= 1
  and id < 100;

delete
from sys_button
where id >= 100
  and id < 10000;

-- 系统管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (1, @t_id, -1, '系统管理', 'system', 0, '', 'system-settings', 0, 20, @u_id);

-- 部门管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (2, @t_id, 1, '部门管理', 'system:department:view', 0, 'system/department', 'system-people-circle', 0, 20,
        @u_id);

insert into sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (200, @t_id, 2, '新增', 'system:department:add', 1, 1, @u_id),
       (210, @t_id, 2, '删除', 'system:department:delete', 1, 10, @u_id),
       (220, @t_id, 2, '修改', 'system:department:update', 1, 20, @u_id)
;

-- 用户管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (3, @t_id, 1, '用户管理', 'system:user:view', 0, 'system/user', 'system-person-circle', 0,
        30, @u_id);

insert into sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (300, @t_id, 3, '新增', 'system:user:add', 0, 1, @u_id),
       (310, @t_id, 3, '删除', 'system:user:delete', 0, 10, @u_id),
       (320, @t_id, 3, '修改', 'system:user:update', 0, 20, @u_id),
       (321, @t_id, 3, '修改密码', 'system:user:update-password', 0, 21, @u_id),
       (322, @t_id, 3, '重置密码', 'system:user:reset-password', 0, 22, @u_id),
       (323, @t_id, 3, '分配角色', 'system:permission:assign-roles-to-one-user', 0, 23, @u_id)
;

-- 菜单管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (4, @t_id, 1, '菜单管理', 'system:menu:view', 0, 'system/menu', 'system-list-circle', 0,
        40, @u_id);

insert into sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (400, @t_id, 4, '新增', 'system:menu:add', 1, 1, @u_id),
       (410, @t_id, 4, '删除', 'system:menu:delete', 1, 10, @u_id),
       (420, @t_id, 4, '修改', 'system:menu:update', 1, 20, @u_id),
       (430, @t_id, 4, '按钮-新增', 'system:button:add', 1, 30, @u_id),
       (440, @t_id, 4, '按钮-删除', 'system:button:delete', 1, 40, @u_id),
       (450, @t_id, 4, '按钮-修改', 'system:button:update', 1, 50, @u_id)
;

-- 角色管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (5, @t_id, 1, '角色管理', 'system:role:view', 0, 'system/role', 'system-people', 0, 50,
        @u_id);

insert into sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (500, @t_id, 5, '新增', 'system:role:add', 1, 1, @u_id),
       (510, @t_id, 5, '删除', 'system:role:delete', 1, 10, @u_id),
       (520, @t_id, 5, '修改', 'system:role:update', 1, 20, @u_id),
       (521, @t_id, 5, '分配菜单', 'system:permission:assign-resources-to-one-role', 1, 21, @u_id)
;

-- ----------------------------
-- 看板-菜单
-- ----------------------------
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (20, @t_id, -1, '首页', 'dashboard', 0, 'board/home', 'system-home', 0, 1, @u_id);

-- ----------------------------
-- 系统工具-菜单
-- ----------------------------
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (30, @t_id, -1, '系统工具', 'system:tools', 0, '', 'system-apps', 0, 1000, @u_id),
       (31, @t_id, 30, '图标', 'system:tools:icon', 0, 'tools/icon', 'system-images', 0, 1, @u_id);


INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (40, @t_id, 1, '字典管理', 'system:dict:view', 0, 'system/dict', 'system-library', 0, 60, @u_id);

INSERT INTO sys_button (id, tenant_id, menu_id, name, permission, preset, sort, created_by)
values (4000, @t_id, 40, '新增', 'system:dict-type:add', 0, 1, @u_id),
       (4001, @t_id, 40, '删除', 'system:dict-type:delete', 0, 10, @u_id),
       (4002, @t_id, 40, '修改', 'system:dict-type:update', 0, 20, @u_id),
       (4050, @t_id, 40, '数据-新增', 'system:dict-data:add', 0, 100, @u_id),
       (4052, @t_id, 40, '数据-删除', 'system:dict-data:delete', 0, 120, @u_id),
       (4053, @t_id, 40, '数据-修改', 'system:dict-data:update', 0, 130, @u_id)
;

-- 日志管理
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (50, @t_id, -1, '日志管理', 'system:log', 0, '', 'system-reader', 0, 120, @u_id);

-- 登录日志
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (51, @t_id, 50, '登陆日志', 'system:login-log:view', 0, 'system-log/login', 'system-reader', 0,
        10, @u_id);

-- 操作日志
INSERT INTO sys_menu (id, tenant_id, parent_id, name, permission, preset, path, icon, hidden, sort, created_by)
VALUES (52, @t_id, 50, '操作日志', 'system:operation-log:view', 0, 'system-log/operation', 'system-reader', 0, 20,
        @u_id);

COMMIT;
