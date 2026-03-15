<script setup lang="ts">
import { computed } from "vue";

import { useAppStore } from "@/stores/app";

const appStore = useAppStore();
const title = computed(() => `${appStore.systemName} Admin`);
</script>

<template>
  <el-container class="app-layout">
    <el-aside width="220px" class="sidebar">
      <div class="brand">{{ title }}</div>
      <el-menu default-active="dashboard">
        <el-menu-item index="dashboard">总览</el-menu-item>
        <el-menu-item index="question-bank">题库管理</el-menu-item>
        <el-menu-item index="knowledge">知识点管理</el-menu-item>
        <el-menu-item index="users">学习记录</el-menu-item>
        <el-menu-item index="review">AI 识别校对</el-menu-item>
      </el-menu>
    </el-aside>
    <el-container>
      <el-header class="header">管理端骨架已初始化</el-header>
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<style scoped>
.app-layout {
  min-height: 100vh;
}

.sidebar {
  background: #0f172a;
  color: #f8fafc;
}

.brand {
  padding: 24px 20px;
  font-size: 16px;
  font-weight: 700;
}

.header {
  display: flex;
  align-items: center;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
  font-weight: 600;
}
</style>