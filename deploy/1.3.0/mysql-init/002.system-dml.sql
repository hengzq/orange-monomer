-- ---------------------------------------
-- orange-system-permission-core  服务预置数据
-- ---------------------------------------

use orange;

-- 默认部门ID
SET @d_id := '-100';

-- 默认用户ID
SET @u_id := '-100';

-- 默认租户ID
SET @t_id := '-100';

-- 默认角色ID
SET @r_id := '-100';

BEGIN;

-- ----------------------------
-- 预置部门数据
-- ----------------------------
delete
from sys_department
where id = @d_id;

INSERT INTO sys_department (id, tenant_id, name, parent_id, sort, created_by, created_at, updated_by, updated_at)
VALUES (@d_id, @t_id, '全公司', -1, 0, @u_id, NOW(), @u_id, NOW());
-- ----------------------------
-- 用户信息表 清除所有的预置数据 用户默认密码 hengzq.cn
-- ----------------------------
delete
from sys_user
where id = @u_id;

INSERT INTO sys_user (id, tenant_id, name, email, gender, phone, login_account, login_password, created_by)
VALUES (@u_id, @t_id, '系统管理员', 'hengzq@yeah.net', '1', '17629990001', 'admin',
        '$2a$18$6Ora//VZ//HxnI64lNWYXOZx4Qp47M9.vQG72jx7u4BwGGdQquLaG', @u_id);

-- ----------------------------
-- 角色预置信息
-- ----------------------------
delete
from sys_role
where id = @r_id;

INSERT INTO sys_role (id, tenant_id, name, permission, sort, enabled, preset, remark, created_by)
VALUES (@r_id, @t_id, '系统超级管理员', 'super_admin', 1, 0, 0, '系统超级管理员-拥有所有的权限', @u_id);

-- ----------------------------
-- 用户角色绑定
-- ----------------------------
SELECT @n_id := IFNULL(MAX(id), 0) + 1
FROM sys_user_role_rl;

INSERT INTO sys_user_role_rl (id, tenant_id, user_id, role_id, created_by)
VALUES (@n_id, @t_id, @u_id, @r_id, @u_id);

COMMIT;