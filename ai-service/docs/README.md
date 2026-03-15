# AI Service

AI 服务采用 FastAPI 初始化。

当前骨架包含：

- FastAPI 应用入口
- 健康检查接口
- 配置对象
- prompts、tests、scripts 目录

建议下一步：

1. 定义 explain_question 和 study_plan 两条基础能力
2. 接入模型适配层
3. 增加异步任务与回调协议