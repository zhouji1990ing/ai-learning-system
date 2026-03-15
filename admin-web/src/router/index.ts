import { createRouter, createWebHistory } from "vue-router";

import AppLayout from "@/layouts/AppLayout.vue";
import DashboardView from "@/views/DashboardView.vue";
import LoginView from "@/views/LoginView.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/login",
      name: "login",
      component: LoginView
    },
    {
      path: "/",
      component: AppLayout,
      children: [
        {
          path: "",
          name: "dashboard",
          component: DashboardView
        }
      ]
    }
  ]
});

export default router;