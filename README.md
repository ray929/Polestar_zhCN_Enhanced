# Polestar_zhCN_Enhanced — Simplified Chinese text pack for Polestar

**本插件是 Polestar 的汉化增强包，必须先安装原版 Polestar 才能使用。**

**This is a localization add-on for Polestar. The original Polestar add-on must be installed first.**

Polestar's leveling guides are written in English. The official `Polestar_zhCN` pack translates part of them into Chinese, and this addon translates the rest.

It does not replace or modify Polestar or `Polestar_zhCN`. It registers the missing texts and lets the official ones win wherever both sides have the same string, so you can run both side by side.

---

## What the official Chinese pack leaves in English

Measured against Polestar / `Polestar_zhCN` 0.3.7.2 (Polestar Interface 16001). The 0.3.7 language pack briefly gained 529 translations after the 0.3.7 tag, but 0.3.7.2 rebuilt the pack from the repository and those strings are gone again: coverage is back to 82.3%. This addon kept them in its own tables, so the guides still read fully in Chinese either way.

| Content | Official `Polestar_zhCN` | With this addon |
| --- | --- | --- |
| Guides with Chinese text | 260 of 260 (only 2 finished) | 260 of 260 (all finished) |
| Guide text strings | 10,150 of 12,331 (82.3%) | all 12,331 |
| Game names (quest / NPC / object / item) | everything except 407 ids | complete |
| Polestar interface strings | 2,995 of the 3,002 keys the UI uses | all 3,002 |

The official pack now covers most of the guide text, but 2,181 strings are still English, scattered across 258 guides — only 2 guides are actually finished. That gap is what you feel while leveling: step 4 is Chinese, step 5 is English, and the NPC name inside step 6 falls back to English because the name table lacks that one id. This addon closes the gap instead of leaving guides half done.

## What you get

### 1. Guide texts — 2,121 strings across 260 guides

Every guide that ships with the Polestar guide packs now reads fully in Chinese. Of the 2,181 strings the official pack misses, 2,121 are per-guide prose (leveling routes for both factions, class quest chains, mount and pet guides, reputation grinds, profession guides, exploration and miscellaneous guides); the remaining 60 occurrences are pack-level folder names, covered once by the 17 folder translations in `E.pack`.

A full re-check against the 0.3.7.2 guide packs covers 12,242 per-guide strings plus 17 pack-level folder names, with zero missing keys and zero placeholder mismatches. Our tables hold 14,446 pairs in total: extra keys retired by newer upstream guides are kept so a later update can reuse their translations.

### 2. Game names — 411 ids carried as a fallback

| Kind | Ids |
| --- | --- |
| NPCs | 163 |
| Quests | 174 |
| Objects | 65 |
| Items | 9 |

Guide steps are stored in English with placeholders like `{npc:1231}` and `{item:6284}`; Polestar resolves them to a name when it draws the step. When the name table has no entry for an id, that name comes out in English in the middle of an otherwise Chinese sentence. 407 of these ids are still missing from the current official name table — the rest are kept as a fallback for older language packs, and official values always win. 0.3.7.2 adds no new name ids. Names follow the official Simplified Chinese client wherever an official name exists — for example 巡山人 for "Mountaineer", 焚化者加因姆 for "Incinerator Gar'im", 琥珀块 / 大琥珀块 for the Amber mining nodes, 雕刻半人马图腾 for "Carved Centaur Totems", 灰谷先驱者 for "Ashenvale Outrunner"; only ids with no official name are transliterated or translated literally (e.g. 大地雕刻师伊普 for "Geosculptor Yip", 安格斯·锤手 for "Angus Hammerhand").

### 3. Interface strings — every gap closed

In 0.3.7.2 `Polestar_zhCN/Interface.lua` defines 3,064 keys (102 more are commented out). Of the 3,002 keys the UI actually references, the official pack defines 2,995; the seven remaining keys are supplied here. This addon also carries 284 UI keys as a fallback; official values always win, so these only take effect when the official pack is missing or older.

### 4. A version guard instead of a broken install

Guide texts are registered as a whole table: running translations made for an older Polestar against a newer guide set would put stale strings in the official pack's place. If the installed Polestar version does not match the version this pack was adapted for (currently 0.3.7.2), the addon stays completely off — no hooks, no text replacement — and prints one line in chat asking you to check your addon updater or wait for the matching release. The official Chinese pack keeps working normally in the meantime.

## What it looks like in game

A Horde warlock guide, official pack only:

> At 10 {npc:3294} sends you to {npc:5875}. He stands outside at the back of {area:362}'s barracks, the big building on the east side of town (not the inn), a few steps from {npc:3172}, the warlock trainer.

The same step here:

> 10级时{npc:3294}让你去找{npc:5875}。他站在{area:362}兵营的后门外，兵营是镇子东侧的大建筑（不是旅店），离术士训练师{npc:3172}只有几步。

A reputation guide that the official pack barely covers, before and after:

> Defias Pillagers and Looters hold the farms west of {area:108}, between the coast road and {area:20}. Careful: The {area:113} cave holds many Defias packed together, so it is easy to pull several at once there.

> 迪菲亚掠夺者和抢劫者占据{area:108}以西的农场，位于海岸道路和{area:20}之间。小心：{area:113}的洞穴里挤满了迪菲亚，在那里很容易一次拉来好几只。

Interface text:

> Bags nearly full: %d slots left. → 背包快满了：只剩 %d 格。

Placeholders are kept intact, so nothing breaks: `{npc:…}` and `{item:…}` are filled from the name tables (official pack plus this addon), `{area:…}`, `{zone:…}` and `{spell:…}` from your client, and `%d` / `%s` by whatever prints the string.

## Known gaps

- **Area, zone, spell and skill names come from the game client**, not from this addon, so they follow your client language. Only quest, NPC, object and item names are supplemented here.
- **Some locale keys remain commented out** in `Polestar_zhCN/Interface.lua`, but the current UI does not reference them. If a future version starts using one, it will show in English until this addon catches up.
- **New Polestar versions can add new guides and strings.** The version guard above keeps this pack from loading stale translations; the official Chinese pack stays usable while a matching update is prepared.

## Credits and licence

- Guide data, name tables and interface strings belong to Polestar and its `Polestar_zhCN` pack.
- Translations in this addon follow the terminology of the official Simplified Chinese client and of `Polestar_zhCN`, so a name here is the name the game shows.
- Licence: GPL-3.0-only, matching Polestar.

---

# Polestar 简体中文增强

Polestar 的练级指南原文是英文。官方 `Polestar_zhCN` 译了一部分，这个插件把剩下的译完。

不改动 Polestar，也不改动 `Polestar_zhCN`：只把缺的文本注册进去，同一条文本两边都有的，一律以官方译文为准，所以可以和官方包同时装着用。

## 官方中文包没译的部分

以 Polestar / `Polestar_zhCN` 0.3.7.2（接口 16001）实际核对。0.3.7 的语言包曾在 tag 之后补译 529 条，但 0.3.7.2 重新编译语言包时按仓库内容重生成，那批补译已被覆盖回去，覆盖率回到 82.3%。本插件把它们保留在自己的表里，所以游戏里看到的仍是完整中文。

| 内容 | 只有官方 `Polestar_zhCN` | 加上本插件 |
| --- | --- | --- |
| 有中文的指南 | 260 篇里的 260 篇（仅 2 篇译完） | 260 篇全部译完 |
| 指南正文条目 | 12,331 条里译了 10,150 条（82.3%） | 12,331 条全部 |
| 游戏名称（任务／NPC／物体／物品） | 除 407 个 id 之外 | 完整 |
| Polestar 界面文字 | 界面用到的 3,002 键里译了 2,995 键 | 3,002 键全部 |

官方包现在覆盖了大部分正文，但仍留下 2,181 条英文，散落在 258 篇指南里，真正译完的只有 2 篇。这个缺口在练级时是能直接感觉到的：第 4 步是中文、第 5 步是英文，第 6 步里的 NPC 名字因为名称表没有那个 id 又变回英文。本插件做的是把缺口填掉，而不是留一篇译到一半的指南。

## 具体补了什么

### 一、指南正文：260 篇指南，补 2,121 条

Polestar 指南包里的每一篇现在都是完整中文。官方缺的 2,181 条里，2,121 条是逐指南正文（双方阵营升级路线、职业任务链、坐骑与宠物、声望、专业、探索与杂项指南），其余 60 处是包级目录名，由 `E.pack` 里 17 个目录名译文统一覆盖。

按 0.3.7.2 指南包全量复核：12,242 条逐指南正文加 17 个包级目录名，缺键 0、占位符不匹配 0。我们的译文表共 14,446 对，多出来的键是上游改版后退下来的旧句，保留下来供下次适配时复用。

### 二、游戏名称：带 411 个 id 兜底

| 类别 | 数量 |
| --- | --- |
| NPC | 163 |
| 任务 | 174 |
| 物体 | 65 |
| 物品 | 9 |

指南正文里存的是 `{npc:1231}`、`{item:6284}` 这样的占位符，绘制那一步时才去名称表取名字。名称表里没有这个 id，一句中文里就会夹进一个英文名。当前官方名称表还缺其中 407 个 id，其余是给旧版语言包留的兜底，官方值始终优先；0.3.7.2 没有新增名称 id。凡有官方译名的一律照用，例如 Mountaineer 用「巡山人」、Incinerator Gar'im 用「焚化者加因姆」、琥珀矿脉用「琥珀块／大琥珀块」、Carved Centaur Totems 用「雕刻半人马图腾」、Ashenvale Outrunner 用「灰谷先驱者」；只有确实没有官方名的 id 才音译或意译（「大地雕刻师伊普」「安格斯·锤手」属于此类）。

### 三、界面文字：缺口全部补上

0.3.7.2 的 `Polestar_zhCN/Interface.lua` 定义了 3,064 个键（另有 102 个被注释）。界面实际引用的 3,002 个键里，官方定义了 2,995 个，还差 7 个，本插件补上。此外还保留了 284 个界面键作为兜底；官方值始终优先，所以只有在官方包缺失或版本较旧时才会生效。

### 四、版本守卫，而不是装坏的包

指南译文是整表注册的：把为旧版 Polestar 做的译文套到新版指南上，会用陈旧文本顶掉官方包的位置。若已安装的 Polestar 版本与本插件适配的版本（当前 0.3.7.2）不一致，本插件会完全不加载——不注册任何 hook、不替换任何文本——只在聊天框打印一行提示，让你查看插件更新器或等待适配版本。期间官方简体中文包照常工作，不影响使用。

## 在游戏里是什么样

部落术士指南，只有官方包时：

> At 10 {npc:3294} sends you to {npc:5875}. He stands outside at the back of {area:362}'s barracks, the big building on the east side of town (not the inn), a few steps from {npc:3172}, the warlock trainer.

装上本插件后：

> 10级时{npc:3294}让你去找{npc:5875}。他站在{area:362}兵营的后门外，兵营是镇子东侧的大建筑（不是旅店），离术士训练师{npc:3172}只有几步。

官方包几乎没覆盖的指南：

> Defias Pillagers and Looters hold the farms west of {area:108}, between the coast road and {area:20}. Careful: The {area:113} cave holds many Defias packed together, so it is easy to pull several at once there.

> 迪菲亚掠夺者和抢劫者占据{area:108}以西的农场，位于海岸道路和{area:20}之间。小心：{area:113}的洞穴里挤满了迪菲亚，在那里很容易一次拉来好几只。

界面文字：

> Bags nearly full: %d slots left. → 背包快满了：只剩 %d 格。

占位符一律原样保留，所以不会出问题：`{npc:…}` 与 `{item:…}` 仍从名称表（官方包加本插件）取名，`{area:…}`、`{zone:…}`、`{spell:…}` 由你的客户端给出，`%d` 与 `%s` 由显示这条文字的那段代码填入。

## 尚未覆盖

- **区域、地名、法术、技能名来自游戏客户端**，不由本插件提供，跟着你的客户端语言走。这里只补任务、NPC、物体、物品名。
- **`Polestar_zhCN/Interface.lua` 里还有若干被注释掉的键**，但当前界面并未引用它们；若以后的版本开始使用，在适配前会显示英文。
- **Polestar 更新会带来新的指南和文本。** 上面的版本守卫会阻止本插件加载过期译文，等待适配期间官方中文包仍可正常使用。

## 致谢与许可

- 指南数据、名称表、界面文字都来自 Polestar 及其 `Polestar_zhCN` 包。
- 本插件的译名沿用简体中文客户端与 `Polestar_zhCN` 的说法，保证插件里叫的名字和游戏里显示的一致。
- 许可：GPL-3.0-only，与 Polestar 一致。
