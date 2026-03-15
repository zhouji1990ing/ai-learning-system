# 系统架构文档 V1

## 1. 架构目标

本架构面向单人开发、可逐步扩展的 AI 学习系统，要求在保证开发效率的前提下，兼顾后续题库规模增长、AI 能力增强和客户端扩展。

考虑到当前开发者个人熟悉 Java 技术栈，核心业务后端采用 Spring Boot；同时考虑 AI、OCR、文档解析等能力更适合 Python 生态，因此采用“Spring Boot 业务服务 + Python AI 服务”的双服务架构。

## 2. 架构原则

- 核心业务统一收敛到 Spring Boot 后端
- AI 能力独立封装为单独服务，避免模型与业务代码强耦合
- 前后端与 AI 服务之间以清晰 API 边界通信
- 优先单体应用，避免过早微服务化
- 先支持 MVP，再逐步扩展复杂 OCR 与拍照批改能力

## 3. 总体系统组成

### 3.1 客户端层

- 安卓客户端：学生端主入口，负责题库浏览、做题、学习计划、AI 讲解、拍照上传
- 后台管理端：供内容和运营人员管理试卷、题目、知识点、解析、用户学习数据

### 3.2 业务服务层

- Spring Boot 业务后端：系统核心服务

职责：

- 用户认证与权限控制
- 题库、试卷、题目、答案、解析管理
- 用户做题记录与错题本
- 知识点掌握度计算
- 学习计划持久化与状态管理
- 文件元数据管理
- 统一调用 AI 服务并保存结果

### 3.3 AI 能力层

- Python AI Service

职责：

- 题目讲解生成
- 知识点解释生成
- 薄弱点分析文本生成
- 学习计划生成
- 题目难度辅助分类
- 试卷 OCR 与结构化解析

### 3.4 数据与基础设施层

- PostgreSQL：主业务数据库
- Redis：缓存、会话、异步任务消息介质
- MinIO 或 OSS：图片、PDF、试卷资源存储
- Docker Compose：本地与测试环境部署编排

## 4. 技术栈选型

### 4.1 安卓客户端

- Kotlin
- Jetpack Compose
- MVVM
- Retrofit + OkHttp
- Room
- CameraX

说明：

- 安卓端后续可做原生工程初始化，但当前文档阶段先完成目录规划

### 4.2 后台管理端

- Vue 3
- TypeScript
- Vite
- Element Plus
- Pinia
- Axios

说明：

- 后台以表单、列表、审核、校对、统计为主，Vue 生态更适合快速搭建管理界面

### 4.3 Spring Boot 业务后端

- Java 21
- Spring Boot 3
- Spring Web
- Spring Security
- Spring Validation
- Spring Data JPA 或 MyBatis-Plus
- PostgreSQL Driver
- Redis Client
- Flyway
- OpenAPI

### 4.4 AI 服务

- Python 3.11+
- FastAPI
- Pydantic
- Celery
- Redis
- OpenCV
- PaddleOCR 或第三方 OCR 能力
- 大模型 API 适配层

## 5. 模块划分

## 5.1 Spring Boot 后端模块

- auth：认证、授权、用户信息
- user-profile：学生资料、学习偏好
- question-bank：试卷、题目、选项、答案、解析
- knowledge-point：知识点体系与题目映射
- practice：练习、提交、批改、错题记录
- analysis：掌握度分析、薄弱点计算
- study-plan：学习计划、任务编排、完成状态
- ai-gateway：调用 AI 服务的统一入口
- file-center：文件上传、资源元数据
- admin-console：后台专用管理接口

## 5.2 AI 服务模块

- explain-question：题目讲解
- explain-knowledge：知识点解释
- analyze-weakness：薄弱点分析描述
- generate-plan：学习计划生成
- classify-difficulty：难度辅助分类
- parse-paper：试卷识别与结构化
- prompt-management：提示词模板管理
- model-adapter：模型供应商适配

## 6. 核心数据流

### 6.1 学生做题流程

1. 安卓端请求试卷或题目数据
2. Spring Boot 返回题目内容和作答配置
3. 学生提交答案
4. Spring Boot 完成客观题判定并写入作答记录
5. Spring Boot 计算知识点表现并更新掌握度
6. 如用户请求讲解，则 Spring Boot 调用 AI Service
7. AI Service 返回结构化讲解结果
8. Spring Boot 落库并返回给客户端

### 6.2 学习计划流程

1. Spring Boot 先基于学习记录计算薄弱知识点
2. Spring Boot 构造结构化输入调用 AI Service
3. AI Service 生成 3 到 5 日计划建议
4. Spring Boot 将计划转化为可执行任务并保存
5. 安卓端展示每日计划与状态

### 6.3 试卷入库流程

1. 管理后台上传试卷图片、扫描件或 PDF
2. Spring Boot 保存文件并写入任务记录
3. AI Service 异步执行 OCR 与版面分析
4. 解析结果回传 Spring Boot
5. 管理后台人工校对后确认入库

## 7. 数据模型建议

核心实体建议如下：

- user
- role
- exam_paper
- exam_question
- exam_question_option
- exam_answer
- exam_analysis
- knowledge_point
- question_knowledge_point
- difficulty_level
- user_submission
- user_submission_item
- user_knowledge_mastery
- study_plan
- study_plan_task
- ai_task
- ai_result
- file_asset

## 8. 接口设计原则

- 所有前端统一调用 Spring Boot 后端
- AI Service 不直接暴露给客户端
- AI 输出必须返回结构化 JSON
- 长耗时任务采用异步处理模式
- 上传、OCR、批量入库任务均支持状态查询

## 9. 安全与权限设计

- 学生端与后台端账号体系隔离或角色隔离
- Spring Security 管理登录与权限
- 关键接口校验 JWT 或 Session Token
- 文件访问采用签名地址或受控下载
- AI 调用日志需保留请求摘要与结果摘要

## 10. 部署建议

### 本地开发环境

- Docker Compose 启动 PostgreSQL、Redis、MinIO
- Spring Boot 本地启动业务服务
- FastAPI 本地启动 AI 服务
- 前端本地开发服务器独立启动

### 测试环境

- 使用 Docker Compose 统一编排
- Nginx 作为统一入口
- 日志集中输出到文件或简单日志平台

## 11. 单人开发优化建议

- 业务逻辑尽量集中在 Spring Boot 内部，避免过度拆分后端服务
- AI Service 只承接明确的 AI 任务，不承载业务规则
- 先实现同步接口，再对长任务演进为异步任务
- 优先完成题库、练习、AI 讲题、学习计划四大能力闭环
- OCR 与复杂图片理解能力放第二阶段

## 12. 当前结论

本系统当前最适合的技术路线为：

- 安卓客户端：Kotlin + Compose
- 后台管理端：Vue 3 + TypeScript
- 业务后端：Spring Boot
- AI 服务：FastAPI
- 数据库：PostgreSQL
- 缓存：Redis
- 存储：MinIO 或 OSS

该方案兼顾了个人技术熟悉度、AI 能力扩展性以及后续工程维护成本。