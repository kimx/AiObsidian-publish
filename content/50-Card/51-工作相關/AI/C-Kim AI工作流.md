---
status: done
tags:
  - AI
  - Codex
  - codegraph
created: 2026-05-27
updated: 2026-05-27
aliases:
map: "[[A-AI Coding]]"
publish: true
---
# 主題

- 從建立新專案到實作過程，讓同事們也可以根據此文章快速上手

## 建立新專案
1. 先在Github建立工程倉，並Clone回來本地，切換分支kim，例如: sl_payment_eng
2. 挑選適合的程式倉，以sl_justlee_eng為例，在專案sl_justlee_eng，使用技能 framework-project-templates, 指定專案名稱: SlPayment，輸出到 D:\Github\TwReuse\sl_payment_eng
3. 在sl_justlee_eng，將所需要的AGENTS.md,skills,筆記目錄，整理一份初始化到 D:\Github\TwReuse\sl_payment_eng
	1. 要指定筆記目錄名稱:PaymentNotes
	2. 指定對應的Req倉，例如: sl_payment_req
4. 到sl_payment_eng 測試前後端程式是否可以執行，OK的話，簽入kim,併入develop,main，作始初始化版本。
## 開始工作-準備階段1
此階段，還未理解需求，個人需要先探索，用專案開啟Req。
1. 先理解整個Req在作什麼，請AI解釋。
2. 瞭解雛型的操作，或請AI針對需求文件的理解，產出另一個說明的文件或雛型網站。
## 開始工作-準備階段2 
- 非必要，比較複雜的，我才會先作。
1. 請AI 理解後，設計資料表，輸出成PDF。(PDF Skill)
2. 確認資料表設計，是否符合，可能會有來回的討論。
3. 請AI 在PDF產出ERD及資料表流程圖。
4. PDF是給人比較讀，在確認OK後。請AI將PDF 轉成markdown，放在工程倉的筆記系統，並將關聯對應及說明加上去。
## 開始工作
- 以單一切片為例
1. 使用 Requirement Normalizer ，指定module 及需求說明(或貼Issue URL)。較複雜的會使用 SuperPower的 BrainStorm及Plan Mode，透過討論過程，產出實作文件。
2.  確認文件無誤後，通常會請它直接實作，但若之前的對話記太長，請會另Session，在新Session 指定切片實作,例如: 請實作切片AIA-chatbase-provider
	1. 此實作會使用Backend,Frontend,CodeReviewer,Test等技能實作相關工作。
3. 通常實作完，都是UI的操作需要調整。我會使用截圖，針對要改的部分，用紅框、綠框標示。在Codex跟它說，例: 紅框請幫我改成2欄的方式呈現，綠框太多box了，改成tabs方式呈現，並使用技能 Senior UX Reviewer
4. 完成後，請它簽入目前分支，pr develop。

## 補充
- 上述是基本工作流程，實務上也會到外部網站討論、整理後，回來請Codex實作。
- UX: Google Stich ，去Chatgpt，說你想要設計怎麼樣UI，要給Google Stich產出，請它給你相關的提示詞。
- Chatgpt 討論需求、技術等細節，最後請它給你一份spec.md，把內容貼到Issue ，由Codex讀取實作。

## Codex PlugIn
- SuperPower : 使用BrainStorm ，它會一步一步跟你確認規格。
- 以下這2個都是讓Codex在找程式時，有類似資料庫的索引、關聯的方式，找程式。
	- [[C-AI codegraph|CodeGraph]]
	- [GitNexus：讓 Codex 修改程式前先理解 Call Chain 與 Impact Analysis](https://note.kimx.info/2026/07/gitnexus-codex-call-chain-impact.html)

