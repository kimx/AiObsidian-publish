---
status: active
tags:
  - AI
  - Codex
  - codegraph
created: 2026-05-27
updated: 2026-05-27
aliases:
  - CodeGraph
map: "[[A-AI Coding]]"
publish: true
---

# 主題

- 使用 CodeGraph 先把 repo 掃成 graph，讓 Codex / agent 透過索引理解專案結構、symbol 與呼叫關係。

## 核心觀念

- CodeGraph 的價值是讓 agent 先查 graph，不是人或 agent 用肉眼翻 `.codegraph/`。
- 在專案下執行 `codegraph init -i` 後，根目錄會產生 `.codegraph/codegraph.db`。
- 若選擇 `codex-cli` 全域設定，工具會更新 `AGENTS.md`，讓 Codex 知道優先用 CodeGraph 分析 repo。
- 適合用在架構理解、symbol 查找、呼叫關係追蹤，避免一開始大量讀檔。

## 常用指令
- 安裝
```bash
npx @colbymchenry/codegraph

```
- 專案初始化索引
``` shell
codegraph init -i
```
## 提示語範例

- 請用 CodeGraph 分析這個 repo 的主要架構，不要先大量讀檔。

## 相關連結

- [[A-AI Coding]]
- [[C-Codex 初始設定備忘]]

## 來源

- [CodeGraph GitHub](https://github.com/colbymchenry/codegraph)
# 個人調整
- 把原本「詢問使用者」的防呆機制，改成「明確命令 AI 直接跳過，並退回到原生搜尋模式」。

```
### If `.codegraph/` doesn't exist

The MCP server returns "not initialized." If `.codegraph/` does not exist, SILENTLY SKIP all codegraph tools and immediately fall back to native search (grep/read). Do NOT ask the user to initialize it, and do NOT block your execution.
```

# 其他
- https://www.youtube.com/watch?v=B0BZZjzuOpM
- https://chatgpt.com/s/t_6a18e26ed1fc819181381129a33a9e14

