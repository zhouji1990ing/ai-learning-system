<template>
  <div class="login-page">
    <el-card class="login-card" shadow="hover">
      <template #header>管理后台登录入口</template>
      <el-form label-position="top">
        <el-form-item label="账号">
          <el-input placeholder="admin@example.com" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input type="password" placeholder="请输入密码" show-password />
        </el-form-item>
        <el-button type="primary" class="submit-button">登录</el-button>
      </el-form>
    </el-card>
  </div>
</template>

<style scoped>
.login-page {
  min-height: 100vh;
  display: grid;
  place-items: center;
  background: linear-gradient(135deg, #eff6ff, #f8fafc);
}

.login-card {
  width: min(420px, calc(100vw - 32px));
}

.submit-button {
  width: 100%;
}
</style>