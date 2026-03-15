import { defineStore } from "pinia";

export const useAppStore = defineStore("app", {
  state: () => ({
    systemName: "AI Learning System",
    currentPhase: "MVP scaffold"
  })
});