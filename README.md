# AiObsidian Publish

此 repo 是 `E:\GitHub\AiObsidian` 的 Quartz 發布站台。

## 匯出 Obsidian Publish 筆記

在 PowerShell 執行：

```powershell
cd E:\GitHub\AiObsidian
.\Export-ObsidianPublish.ps1
```

如果要先清空 `E:\GitHub\AiObsidian-publish\content` 再重新匯出：

```powershell
.\Export-ObsidianPublish.ps1 -Clean
```

## 建置 Quartz

在 `AiObsidian-publish` 執行：

```powershell
cd E:\GitHub\AiObsidian-publish
npx quartz build
```

## 本機預覽

建置時加上 `--serve` 可以啟動預覽：

```powershell
npx quartz build --serve
```

---

# Quartz v5

> “[One] who works with the door open gets all kinds of interruptions, but [they] also occasionally gets clues as to what the world is and what might be important.” — Richard Hamming

Quartz is a set of tools that helps you publish your [digital garden](https://jzhao.xyz/posts/networked-thought) and notes as a website for free.

🔗 Read the documentation and get started: https://quartz.jzhao.xyz/

[Join the Discord Community](https://discord.gg/cRFFHYye7t)

## Sponsors

<p align="center">
  <a href="https://github.com/sponsors/jackyzha0">
    <img src="https://cdn.jsdelivr.net/gh/jackyzha0/jackyzha0/sponsorkit/sponsors.svg" />
  </a>
</p>
