# Backend Spring Boot

核心业务后端采用 Spring Boot 3 + Java 21。

当前骨架包含：

- Maven 工程定义
- 健康检查接口
- 基础 CORS 配置
- Flyway 迁移目录
- 开发与测试环境配置文件

建议下一步：

1. 设计用户、题库、知识点核心实体
2. 接入 Spring Security 与统一异常处理
3. 增加 AI Gateway 调用封装