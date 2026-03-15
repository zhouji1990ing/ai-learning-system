# 项目结构详细设计 V1

## 1. 设计目标

本设计用于明确项目在磁盘上的目录组织方式、模块边界和后续工程初始化方向，保证单人开发时结构清晰、职责明确、便于 AI 协助生成代码和文档。

## 2. 项目根目录

项目根目录建议为：

- ai-learning-system

放置位置：

- D:/Software Development

## 3. 顶层目录设计

### 3.1 docs

文档目录，集中保存产品、架构、设计、接口和数据库文档。

建议结构：

- product：产品需求、需求变更记录、版本规划
- architecture：系统架构、部署架构、技术选型说明
- design：详细设计、模块说明、数据流程说明
- api：后续存放接口文档
- database：后续存放数据库设计文档
- meeting：后续存放阶段记录与决策日志

### 3.2 android-client

安卓客户端目录。

建议后续初始化结构：

- app
- build-logic
- gradle
- docs

安卓内部建议模块：

- feature-auth
- feature-question-bank
- feature-practice
- feature-ai-explain
- feature-study-plan
- feature-profile
- core-network
- core-ui
- core-model

### 3.3 admin-web

后台管理前端目录。

建议后续初始化结构：

- src
- public
- mock
- docs

前端 src 建议拆分：

- api
- router
- stores
- layouts
- views
- components
- utils
- types

主要页面域建议：

- 登录
- 试卷管理
- 题目管理
- 知识点管理
- 用户学习记录
- AI 识别结果校对
- 统计看板

### 3.4 backend-springboot

Spring Boot 业务后端目录。

建议后续初始化结构：

- src/main/java
- src/main/resources
- src/test/java
- docs

Java 包结构建议：

- com.project.ailearning
  - common
  - config
  - auth
  - user
  - questionbank
  - knowledge
  - practice
  - analysis
  - studyplan
  - aigateway
  - file
  - admin

资源目录建议：

- application.yml
- application-dev.yml
- application-test.yml
- db/migration
- mapper

### 3.5 ai-service

AI 服务目录。

建议后续初始化结构：

- app
- prompts
- tests
- scripts
- docs

Python 应用层建议拆分：

- api
- services
- adapters
- tasks
- models
- schemas
- utils

AI 服务模块建议：

- explain_question
- explain_knowledge
- study_plan
- difficulty_classifier
- paper_parser
- ocr_pipeline

### 3.6 infra

基础设施目录，用于保存本地与测试环境的部署配置。

建议内容：

- docker-compose.yml
- nginx
- postgres
- redis
- minio
- monitoring

### 3.7 scripts

脚本目录，用于保存初始化、导入、迁移和维护脚本。

建议内容：

- init-env
- import-exam-data
- backup-db
- restore-db
- generate-test-data

## 4. 当前建议的工程边界

### Spring Boot 负责

- 用户、权限、题库、知识点、作答记录、掌握度、学习计划等核心业务
- 对外统一 API
- 文件元数据与任务管理
- AI 调用编排与结果落库

### AI Service 负责

- 生成型任务
- OCR 与版面分析
- 模型调用适配
- 提示词管理

### 前端负责

- 安卓端承接学生学习流程
- 后台端承接管理与校对流程

## 5. 开发顺序建议

### 第一优先级

- backend-springboot
- docs
- infra

### 第二优先级

- admin-web

### 第三优先级

- android-client
- ai-service

说明：

- 从单人开发效率角度，建议先把后端数据结构和后台管理打通，再接 AI 能力和安卓端复杂页面

## 6. 第一阶段推荐创建的后续文件

建议下一批优先补充：

- docs/database/database-design-v1.md
- docs/api/api-spec-v1.md
- backend-springboot/pom.xml
- backend-springboot/src/main/resources/application.yml
- infra/docker-compose.yml

## 7. 结论

该目录结构兼顾以下目标：

- 符合 Spring Boot 为核心业务后端的开发习惯
- 为 AI 独立能力预留清晰边界
- 便于单人开发分阶段推进
- 便于后续让 AI 工具稳定理解目录职责并持续生成代码