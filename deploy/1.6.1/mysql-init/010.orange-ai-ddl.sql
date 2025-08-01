-- ---------------------------------------
-- orange-ai 服务依赖MySql表结构
-- ---------------------------------------
CREATE SCHEMA if not exists `orange` DEFAULT CHARACTER SET utf8mb4;

use orange;

-- ----------------------------
-- 模型管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_model`
(
    `id`          varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`   varchar(36)  NOT NULL COMMENT '租户id',
    `platform`    varchar(128) NOT NULL COMMENT '模型所属平台',
    `name`        varchar(128) NOT NULL COMMENT '自定义模型名称',
    `model_name`  varchar(256) NOT NULL COMMENT '原始模型名称',
    `model_type`  varchar(256) NOT NULL COMMENT '模型类型',
    `enabled`     tinyint(1)            DEFAULT 1 COMMENT '启用状态 1 启用 0 禁用',
    `sort`        int                   DEFAULT 1 COMMENT '显示顺序',
    `base_url`    varchar(1024)         DEFAULT NULL COMMENT '基础URL路径：eg:ollama路径http://localhost:11434',
    `api_key`     varchar(1024)         DEFAULT NULL COMMENT '模型密钥KEY',
    `description` text                  DEFAULT NULL COMMENT '模型描述',
    `created_by`  varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`  varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '模型管理';


-- ----------------------------
-- 文生图管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_text_to_image`
(
    `id`         varchar(36)   NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36)   NOT NULL COMMENT '租户id',
    `user_id`    varchar(36)   NOT NULL COMMENT '用户id',
    `platform`   varchar(128)  NOT NULL COMMENT '模型所属平台',
    `model_code` varchar(128)  NOT NULL COMMENT '模型编码',
    `prompt`     varchar(1024) NOT NULL COMMENT '提示词',
    `quantity`   SMALLINT               DEFAULT 1 COMMENT '生成图片数量',
    `width`      SMALLINT      NOT NULL COMMENT '生成图片宽度',
    `height`     SMALLINT      NOT NULL COMMENT '生成图片高度',
    `urls`       text          NOT NULL COMMENT '生成图片ULR地址,多个以","分割存储',
    `created_by` varchar(36)   NOT NULL COMMENT '创建人',
    `created_at` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)            DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '文生图管理';


-- ----------------------------
-- 知识库管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_kb`
(
    `id`                     varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`              varchar(36)  NOT NULL COMMENT '租户id',
    `name`                   varchar(128) NOT NULL COMMENT '知识库名称',
    `embedding_model_id`     varchar(36)  NOT NULL COMMENT '嵌入式模型Id',
    `enabled`                boolean               DEFAULT TRUE COMMENT '启用状态 true:启用 false:禁用',
    `sort`                   int                   DEFAULT 1 COMMENT '显示顺序',
    `description`            text                  DEFAULT NULL COMMENT '知识库描述',
    `vector_collection_name` varchar(128)          DEFAULT NULL COMMENT '知识库对应向量表名称',
    `created_by`             varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`             varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`             datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '知识库管理';


-- ----------------------------
-- 知识库管理 - 文档
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_kb_doc`
(
    `id`          varchar(36)   NOT NULL COMMENT '表的主键',
    `tenant_id`   varchar(36)   NOT NULL COMMENT '租户id',
    `base_id`     varchar(36)   NOT NULL COMMENT '知识库ID',
    `file_name`   varchar(1024) NOT NULL COMMENT '文件名',
    `file_path`   varchar(1024)          DEFAULT NULL COMMENT '文件存储路径',
    `file_size`   bigint                 DEFAULT NULL COMMENT '文件大小',
    `file_type`   varchar(32)            DEFAULT NULL COMMENT '文件类型',
    `file_status` varchar(32)            DEFAULT NULL COMMENT '文件状态',
    `created_by`  varchar(36)   NOT NULL COMMENT '创建人',
    `created_at`  datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`  varchar(36)            DEFAULT NULL COMMENT '更新人',
    `updated_at`  datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '知识库管理 - 文档';

-- ----------------------------
-- 知识库管理 - 文档切片
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_kb_doc_chunk`
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `base_id`    varchar(36) NOT NULL COMMENT '知识库ID',
    `doc_id`     varchar(36) NOT NULL COMMENT '文档ID',
    `emb_status` varchar(36) NOT NULL COMMENT '向量化状态',
    `text`       text                 DEFAULT NULL COMMENT '段落内容',
    `created_by` varchar(36) NOT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '知识库管理 - 文档切片';

-- ----------------------------
-- 应用表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_app`
(
    `id`                   varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`            varchar(36) NOT NULL COMMENT '租户id',
    `app_type`             varchar(36) NOT NULL COMMENT '应用类型',
    `app_status`           varchar(36)          DEFAULT NULL COMMENT '应用状态：DRAFT：草稿，PUBLISHED：已发布，PUBLISHED_EDITING:已发布编辑中',
    `draft_version_id`     varchar(36)          DEFAULT NULL COMMENT '草稿版ID',
    `published_version_id` varchar(36)          DEFAULT NULL COMMENT '发布版ID',
    `created_by`           varchar(36) NOT NULL COMMENT '创建人',
    `created_at`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`           varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '应用表';

-- ----------------------------
-- 应用 - 版本管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_app_version`
(
    `id`             varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`      varchar(36)  NOT NULL COMMENT '租户id',
    `app_id`         varchar(36)  NOT NULL COMMENT '应用ID',
    `name`           varchar(128) NOT NULL COMMENT '应用名称',
    `system_prompt`  text                  DEFAULT NULL COMMENT '系统提示词',
    `description`    varchar(2048)         DEFAULT NULL COMMENT '应用描述',
    `model_id`       varchar(36)           DEFAULT NULL COMMENT '模型ID',
    `model_config`   text                  DEFAULT NULL COMMENT '模型相关配置，JSON 字符串存储',
    `base_ids`       varchar(1024)         DEFAULT NULL COMMENT '关联知识库IDS, 多一个以","分割',
    `base_config`    text                  DEFAULT NULL COMMENT '知识库相关配置, JSON 字符串存储',
    `mcp_ids`        varchar(1024)         DEFAULT NULL COMMENT '关联MCP 服务IDS，多一个以","分割',
    `version_status` varchar(36)           DEFAULT NULL COMMENT '版本状态 DRAFT：草稿，PUBLISHED：已发布',
    `publish_by`     varchar(36)           DEFAULT NULL COMMENT '发布人',
    `publish_at`     datetime              DEFAULT NULL COMMENT '发布时间',
    `created_by`     varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`     varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '应用表 - 版本管理';


-- ----------------------------
-- 应用 - 模型管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_app_model`
(
    `id`             varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`      varchar(36) NOT NULL COMMENT '租户id',
    `app_id`         varchar(36) NOT NULL COMMENT '应用ID',
    `app_version_id` varchar(36) NOT NULL COMMENT '应用版本ID',
    `model_id`       varchar(36)          DEFAULT NULL COMMENT '模型ID',
    `created_by`     varchar(36) NOT NULL COMMENT '创建人',
    `created_at`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`     varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at`     datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '应用 - 模型管理';


-- ----------------------------
-- 聊天会话管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_session`
(
    `id`             varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`      varchar(36)  NOT NULL COMMENT '租户id',
    `user_id`        varchar(36)  NOT NULL COMMENT '用户id',
    `model_id`       varchar(36)           DEFAULT NULL COMMENT '模型ID',
    `name`           varchar(128) NOT NULL COMMENT '会话名称',
    `session_type`   varchar(64)           DEFAULT NULL COMMENT '会话类型',
    `association_id` varchar(36)           DEFAULT NULL COMMENT '关联ID，eg:智能体ID等',
    `created_by`     varchar(36)           DEFAULT NULL COMMENT '创建人',
    `created_at`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`     varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`     datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '聊天会话管理';

-- ----------------------------
-- 聊天会话消息管理
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_session_message`
(
    `id`         varchar(36) NOT NULL COMMENT '表的主键',
    `tenant_id`  varchar(36) NOT NULL COMMENT '租户id',
    `parent_id`  varchar(36) NOT NULL COMMENT '父级ID -1表示顶级',
    `session_id` varchar(36) NOT NULL COMMENT '会话id',
    `role`       varchar(32) NOT NULL COMMENT '消息类型',
    `content`    text                 DEFAULT NULL COMMENT '会话内容',
    `created_by` varchar(36)          DEFAULT NULL COMMENT '创建人',
    `created_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by` varchar(36)          DEFAULT NULL COMMENT '更新人',
    `updated_at` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = '聊天会话记录管理';

-- ----------------------------
-- MCP Server
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_mcp_server`
(
    `id`                 varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`          varchar(36)  NOT NULL COMMENT '租户id',
    `name`               varchar(512) NOT NULL COMMENT '服务名称',
    `transport_protocol` varchar(36)  NOT NULL COMMENT '传输协议，SSE，STDIO',
    `connection_url`     varchar(1024)         DEFAULT NULL COMMENT 'SSE协议时，服务端连接地址',
    `sse_endpoint`       varchar(1024)         DEFAULT NULL COMMENT 'SSE协议端点',
    `enabled`            tinyint(1)            DEFAULT 1 COMMENT '启用状态 1 启用 0 禁用',
    `description`        varchar(2048)         DEFAULT NULL COMMENT '描述',
    `created_by`         varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`         varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = 'MCP Server';

-- ----------------------------
-- Prompt模板
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ai_prompt_template`
(
    `id`               varchar(36)  NOT NULL COMMENT '表的主键',
    `tenant_id`        varchar(36)  NOT NULL COMMENT '租户id',
    `name`             varchar(512) NOT NULL COMMENT '模板名称',
    `template_type`    varchar(36)  NOT NULL COMMENT '模板类型',
    `template_content` text                  DEFAULT NULL COMMENT '完整的模板内容',
    `created_by`       varchar(36)  NOT NULL COMMENT '创建人',
    `created_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_by`       varchar(36)           DEFAULT NULL COMMENT '更新人',
    `updated_at`       datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB COMMENT = 'Prompt模板';