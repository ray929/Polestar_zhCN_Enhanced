# AGENTS.md — Polestar_zhCN_Enhanced

## 项目定位

- 给 Polestar 补上官方 `Polestar_zhCN` 没有覆盖的简体中文文本，**不改动 Polestar 与 Polestar_zhCN**。
- 游戏目录：`E:\Games\Wow\_forever_\Interface\AddOns\`；本目录通过 junction 链接为 `AddOns\Polestar_zhCN_Enhanced`。
- 仓库根就是这个插件目录；`tools/`、`missing_report.json` 等维护脚本留在工作区根，不进仓库。

## 运行时机制（Polestar）

- `RegisterGuideTexts(loc, "guides", t)` 是**整体替换** `texts["guides"]`，所以本插件注册的表必须自带官方译文（键冲突时官方优先），否则会覆盖掉官方 3394 条。
- 指南正文只在所属包注册（`GuideTexts.Prepare`）时渲染一次，之后不会自动重读。
- `Polestar_Guides_Horde` / `_Alliance` 是 LoadOnDemand，`GuideTexts.TextsAddon("..._Horde")` 查不到 `..._Horde_zhCN`（目录不存在），永远不会走 `Refresh`。
- 因此 `Core.lua` 在注册译文后遍历 `Polestar.Guides.List()` → `Guides.Get(id)` → `GuideTexts.Refresh(def)`，并在登录时再刷一次。
- 数据文件最后一行 `E.Apply()` 装配全部 hook（界面文本 / 指南文本 / 名称）。

## 改数据后的校验流程

```
python tools\merge_translations.py
python tools\verify_full.py     # problems 必须为 0
python tools\lua_sanity.py      # 6 个 lua 文件全部 ok
python tools\check_lines.py     # anomalies 必须为 0
```

## 发布

- CurseForge 项目 ID：`1789473`（toc 里的 `## X-Curse-Project-ID`）。
- toc 版本是占位符 `## Version: @project-version@`，打包时替换为 tag 版本。
- **tag 规则**：`v<当前 Polestar 版本>-<自增序号>`
  - Polestar 版本读自 `E:\Games\Wow\_forever_\Interface\AddOns\Polestar\Polestar.toc` 的 `## Version`（当前 `0.3.4`）。
  - 序号从 `0` 开始，每次发版 +1：`v0.3.4-0` → `v0.3.4-1` → …
  - Polestar 版本更新后序号重置为 0：`v0.3.5-0`。
  - 打 tag 前用 `git tag -l "v<版本>-*"` 取已用最大序号。
- 发版是 `tag + main` 一起推；tag 会触发 CurseForge 从 GitHub 拉取发布。必须在用户明确要求时才执行。

## 提交与远程

- 提交信息英文、单行。
- 只 `commit`，不 `push`，除非用户明确说「推送 / push / 推 tag」。
- 远程：`git@github-ray929:ray929/Polestar_zhCN_Enhanced.git`（SSH 别名，不用裸 `github.com`）。
- 仓库级身份：`user.name=ray929`，`user.email=41984067+ray929@users.noreply.github.com`。
