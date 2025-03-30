-- ---------------------------------------
-- orange-system-permission-core 组件依赖MySql表结构
-- ---------------------------------------

CREATE SCHEMA if not exists `orange` DEFAULT CHARACTER SET utf8mb4;

use orange;

-- ----------------------------
-- 部门信息表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_department`
(
    `id`          varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`   varchar(36)  NOT NULL COMMENT '租户id',
    `name`        varchar(128) NOT NULL DEFAULT '' COMMENT '名称',
    `parent_id`   varchar(36)  NOT NULL DEFAULT '-1' COMMENT '父级id,根节w点的id为-1',
    `sort`        int                   DEFAULT 0 COMMENT '显示顺序',
    `description` varchar(1024)         DEFAULT NULL COMMENT '部门描述',
    `created_by`  varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`  varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '部门表';



-- ----------------------------
-- 用户信息表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_user`
(
    `id`             varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`      varchar(36) NOT NULL COMMENT '租户id',
    `name`           varchar(64)          DEFAULT NULL COMMENT '用户名称',
    `email`          varchar(64)          DEFAULT NULL COMMENT '邮箱',
    `gender`         tinyint(1)           DEFAULT NULL COMMENT '用户性别',
    `phone`          varchar(16)          DEFAULT NULL COMMENT '手机号',
    `login_account`  varchar(64)          DEFAULT NULL COMMENT '登陆账号',
    `login_password` varchar(256)         DEFAULT NULL COMMENT '密码',
    `created_by`     varchar(36) NOT NULL COMMENT '创建人',
    `created_at`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`     varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '用户信息表';


-- ----------------------------
-- 用户部门关系表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_user_department_rl
(
    `id`            varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`     varchar(36) NOT NULL COMMENT '租户id',
    `department_id` varchar(36) NOT NULL COMMENT '用户ID',
    `user_id`       varchar(36) NOT NULL COMMENT '角色ID',
    `created_by`    varchar(36) NOT NULL COMMENT '创建人',
    `created_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`    varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '用户部门关系表';

-- ----------------------------
-- 用户角色关系表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_user_role_rl
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `user_id`    varchar(36) NOT NULL COMMENT '用户ID',
    `role_id`    varchar(36) NOT NULL COMMENT '角色ID',
    `created_by` varchar(36) NOT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '用户角色关系表';

-- ----------------------------
-- 角色信息表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_role
(
    `id`         varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36)  NOT NULL COMMENT '租户id',
    `name`       varchar(64)  NOT NULL COMMENT '角色名称',
    `permission` varchar(128) NOT NULL COMMENT '权限编码',
    `sort`       int                   DEFAULT 0 COMMENT '显示顺序',
    `enabled`    tinyint(1)            DEFAULT 1 COMMENT '启用状态 1:启用 0:禁用',
    `preset`     tinyint(1)            DEFAULT 0 COMMENT '预置状态 1:预置数据 0:自定义',
    `remark`     varchar(512)          DEFAULT NULL COMMENT '备注',
    `created_by` varchar(36)  NOT NULL COMMENT '创建人',
    `created_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '角色信息表';

-- ----------------------------
-- 角色和资源关系表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_role_resource_rl
(
    `id`            varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`     varchar(36) NOT NULL COMMENT '租户id',
    `role_id`       varchar(36) NOT NULL COMMENT '角色ID',
    `resource_id`   varchar(36)          DEFAULT NULL COMMENT '资源ID',
    `resource_type` tinyint(1)           DEFAULT NULL COMMENT '资源类型 1 菜单 2 按钮',
    `created_by`    varchar(36) NOT NULL COMMENT '创建人',
    `created_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`    varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '角色和资源关系表';

-- ----------------------------
-- 菜单管理表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_menu
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `parent_id`  varchar(36) NOT NULL DEFAULT '-1' COMMENT '父级id,根节点的id为-1',
    `name`       varchar(128)         DEFAULT NULL COMMENT '名称',
    `permission` varchar(128)         DEFAULT NULL COMMENT '权限编码,必须唯一',
    `preset`     tinyint(1)           DEFAULT 0 COMMENT '预置状态 1:预置数据 0:自定义',
    `path`       varchar(256)         DEFAULT NULL COMMENT '菜单路径',
    `icon`       varchar(64)          DEFAULT NULL COMMENT '图标',
    `hidden`     tinyint              DEFAULT 0 COMMENT '隐藏标志 1:隐藏 0:不隐藏',
    `sort`       int                  DEFAULT 0 COMMENT '显示顺序',
    `created_by` varchar(36) NOT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '菜单管理表';

-- ----------------------------
-- 按钮管理表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_button
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `menu_id`    varchar(36) NOT NULL COMMENT '菜单ID',
    `name`       varchar(128)         DEFAULT NULL COMMENT '名称',
    `permission` varchar(128)         DEFAULT NULL COMMENT '权限编码，必须唯一',
    `preset`     tinyint(1)           DEFAULT 0 COMMENT '预置状态 1:预置数据 0:自定义',
    `sort`       int                  DEFAULT 0 COMMENT '显示顺序',
    `created_by` varchar(36) NOT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '按钮管理表';

-- ----------------------------
-- 字典类型表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_dict_type
(
    `id`          varchar(36)         NOT NULL COMMENT '表的主键',
    `tenant_id`   varchar(36)         NOT NULL COMMENT '租户id',
    `name`        varchar(128)                 DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(128) UNIQUE NOT NULL COMMENT '字典类型,唯一',
    `enabled`     tinyint(1)                   DEFAULT 1 COMMENT '启用状态 1:启用 0:禁用',
    `preset`      tinyint(1)                   DEFAULT 0 COMMENT '预置状态 1:预置数据 0:自定义',
    `description` varchar(1024)                DEFAULT NULL COMMENT '描述',
    `created_by`  varchar(36)         NOT NULL COMMENT '创建人',
    `created_at`  datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`  varchar(36)                  DEFAULT NULL COMMENT '更新人',
    `updated_at`  datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='字典类型表';

-- ----------------------------
-- 字典数据表
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_dict_data
(
    `id`          bigint       NOT NULL COMMENT '表的主键',
    `tenant_id`   bigint       NOT NULL COMMENT '租户id',
    `dict_type`   varchar(128) NOT NULL COMMENT '字典类型',
    `dict_label`  varchar(100)          DEFAULT '' COMMENT '字典数据标签',
    `dict_value`  varchar(64)           DEFAULT '' COMMENT '字典数据键值',
    `show_style`  varchar(32)           DEFAULT '' COMMENT '回显样式',
    `enabled`     tinyint(1)            DEFAULT 1 COMMENT '启用状态 1:启用 0:禁用',
    `preset`      tinyint(1)            DEFAULT 0 COMMENT '预置状态 1:预置数据 0:自定义',
    `sort`        int                   DEFAULT 0 COMMENT '字典排序',
    `description` varchar(1024)         DEFAULT NULL COMMENT '描述',
    `created_by`  varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`  varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='字典数据表';


-- ----------------------------
-- 操作记录
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_operation_log
(
    `id`                 varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`          varchar(36)  NOT NULL COMMENT '租户id',
    `request_id`         varchar(64)  NOT NULL COMMENT '请求ID',
    `resource_id`        varchar(128) NOT NULL COMMENT '操作接口ID',
    `resource_name`      varchar(256) NOT NULL COMMENT '操作接口名称',
    `request_url`        varchar(512) NOT NULL COMMENT '请求URL',
    `request_method`     varchar(8)   NOT NULL COMMENT '请求方式 GET,POST,PUT,PATCH,DELETE',
    `java_method`        varchar(512) NULL COMMENT 'Java 方法名',
    `java_method_args`   text         NULL COMMENT 'Java 方法参数',
    `java_method_result` text         NULL COMMENT 'Java 方法返回结果',
    `stack_trace`        text         NULL COMMENT '异常堆栈信息',
    `user_id`            bigint(32)            DEFAULT NULL COMMENT '操作用户ID',
    `user_ip`            varchar(64)           DEFAULT '' COMMENT '用户 IP',
    `user_location`      varchar(64)           DEFAULT NULL COMMENT 'IP地址,登录地点',
    `user_agent`         varchar(128)          DEFAULT '' COMMENT 'User-Agent',
    `start_time`         datetime              DEFAULT NULL COMMENT '开始时间',
    `end_time`           datetime              DEFAULT NULL COMMENT '结束时间',
    `status`             tinyint(1)            DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
    `duration`           bigint(20)            DEFAULT NULL COMMENT '请求耗时 单位毫秒',
    `created_by`         varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`         varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='操作日志';

-- ----------------------------
-- 登录记录
-- ----------------------------
CREATE TABLE IF NOT EXISTS sys_login_log
(
    `id`            varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`     varchar(36) NOT NULL COMMENT '租户id',
    `request_id`    varchar(64)          DEFAULT '' COMMENT '请求ID',
    `account`       varchar(64)          DEFAULT '' COMMENT '用户账号',
    `type`          tinyint(1)           DEFAULT NULL COMMENT '类型,0-登陆 1-登出',
    `user_id`       bigint(32)           DEFAULT NULL COMMENT '登录用户ID',
    `user_ip`       varchar(32)          DEFAULT '' COMMENT '用户IP',
    `user_location` varchar(64)          DEFAULT NULL COMMENT '登录地点',
    `user_agent`    varchar(128)         DEFAULT '' COMMENT 'User-Agent',
    `login_time`    datetime    NOT NULL COMMENT '登录时间',
    `status`        tinyint(1)           DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
    `created_by`    varchar(36) NOT NULL COMMENT '创建人',
    `created_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`    varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`    datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='系统日志';

-- ----------------------------
-- 存储 - 对象管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `sys_storage_object`
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `mode`       varchar(64)          DEFAULT NULL COMMENT '存储方式',
    `file_name`  varchar(256)         DEFAULT NULL COMMENT '对象原名称',
    `file_path`  varchar(1024)        DEFAULT NULL COMMENT '对象新名称，包含相对路径',
    `file_type`  varchar(64)          DEFAULT null COMMENT '对象类型',
    `file_size`  bigint               DEFAULT NULL COMMENT '对象大小',
    `created_by` varchar(36)          DEFAULT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT ='存储 - 对象管理';

