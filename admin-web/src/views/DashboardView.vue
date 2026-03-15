<script setup lang="ts">
const cards = [
  { title: "题库建设", value: "待初始化数据模型" },
  { title: "AI 校对任务", value: "待接入任务队列" },
  { title: "学习计划", value: "待接入后端接口" }
];
</script>

<template>
  <div class="dashboard-view">
    <el-row :gutter="16">
      <el-col v-for="card in cards" :key="card.title" :xs="24" :md="8">
        <el-card shadow="hover">
          <div class="card-title">{{ card.title }}</div>
          <div class="card-value">{{ card.value }}</div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<style scoped>
.dashboard-view {
  display: grid;
  gap: 16px;
}

.card-title {
  margin-bottom: 8px;
  font-size: 14px;
  color: #64748b;
}

.card-value {
  font-size: 18px;
  font-weight: 700;
}
</style>