---
status: done
tags:
  - AI
  - Codex
  - GitNexus
created: 2026-07-03
updated: 2026-07-03
aliases:
  - GitNexus
priority:
map: "[[A-AI Coding]]"
publish: true
---
## 主題

- GitNexus：讓 Codex 先查程式關係
- GitNexus 可以把 repo 建成 code knowledge graph，讓 Codex 在修改前先查呼叫鏈、相依關係、影響範圍與功能入口點。
- 目前用在專案 [[10-Projects/Omnimsg/P-Omnimsg-00-Index]]
- [[Blog]] https://note.kimx.info/2026/07/gitnexus-codex-call-chain-impact.html
## 核心觀念

- 它的價值不是多一個搜尋工具，而是讓 Codex 先理解「這段程式被誰呼叫、會影響誰」。
- 適合大型 .NET 專案、重構、API contract 調整、bug 追查與舊系統理解。
- 對 Codex 來說，最實用的用法是直接要求：「先用 GitNexus 查 call chain / impact，再提出修改方案。」
- `AGENTS.md` 只需要留下工作規則：大改前查 context / impact，索引過舊先 analyze，修改後跑必要 build / test。

## 最小使用流程

```bash
--安裝
npm install -g gitnexus@latest
codex mcp add gitnexus -- npx -y gitnexus@latest mcp
--進入專案
gitnexus analyze
gitnexus status
```
- 會在專案建立skills及寫入AGENTS.md
- 
本機檢視已分析過的 repo：

```bash
npx gitnexus@latest serve
```
![[Pasted image 20260703132303.png]]
## 提示語範例

- 請先用 GitNexus 找出此 API 從 endpoint 到 DB 的完整流程，再整理修改步驟。
- 用 GitNexus impact 分析這個 method 修改後會影響哪些呼叫端，不要直接改程式。

## 建議加入 AGENTS.md
```
## GitNexus 使用規則

本專案使用 GitNexus 建立 code knowledge graph。

進行以下工作前，必須先使用 GitNexus MCP tools 查詢 context / impact：

- 修改 Controller、Service、Repository、DTO、Entity
- 調整 API contract
- 重構共用方法
- 分析既有功能流程
- 追查 bug 影響範圍
- 跨模組修改

## Codex 工作流程

1. 修改前先查 GitNexus context / impact。
2. 不得只依賴單一檔案或純文字搜尋判斷。
3. 修改前列出受影響檔案、呼叫鏈、資料流。
4. 若索引過舊，先執行：

   ```bash
   gitnexus analyze
   ```

5. 修改後執行必要的 build / test。
```

## .gitignore 建議

通常不建議把索引資料提交進 repo。

```gitignore
.gitnexus/
```

## 常用 GitNexus CLI 指令

```bash
# 建立或更新索引
gitnexus analyze

# 強制完整重建索引
gitnexus analyze --force

# 跳過 embeddings，加快索引
gitnexus analyze --skip-embeddings

# 保留自訂 AGENTS.md，不讓 GitNexus 覆蓋相關段落
gitnexus analyze --skip-agents-md

# 檢查目前 repo 索引狀態
gitnexus status

# 列出所有已索引 repo
gitnexus list

# 啟動 MCP server
gitnexus mcp

# 啟動本機 HTTP server，供 Web UI 連接
gitnexus serve

# 清除目前 repo 索引
gitnexus clean

# 清除所有索引
gitnexus clean --all --force

# 產生 repo wiki
gitnexus wiki
```

## 相關連結

- [[A-AI Coding]]
- [[A-Codex使用方式]]
- [[C-AI codegraph]]

## 來源

- [GitNexus GitHub](https://github.com/abhigyanpatwari/GitNexus)
- [X 討論串](https://x.com/ada0211dada/status/2072276906771456361)
