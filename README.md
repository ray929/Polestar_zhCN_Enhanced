# Polestar_zhCN_Enhanced — Simplified Chinese text pack for Polestar

Polestar's leveling guides are written in English. The official `Polestar_zhCN` pack translates part of them into Chinese, and this addon translates the rest.

It does not replace or modify Polestar or `Polestar_zhCN`. It registers the missing texts and lets the official ones win wherever both sides have the same string, so you can run both side by side.

---

## What the official Chinese pack leaves in English

Measured against `Polestar_zhCN` 0.3.4 (Polestar Interface 16001):

| Content | Official `Polestar_zhCN` | With this addon |
| --- | --- | --- |
| Guides with Chinese text | 208 of 254 | 254 of 254 |
| Guide text strings | 3,394 | 11,297 (all of them) |
| Game names (quest / NPC / object / item) | everything except 341 ids | complete |
| Polestar interface strings | 2,430 keys | +258 translated (261 keys covered) |

That gap is what you feel while leveling: in a guide the official pack has half translated, step 4 is Chinese, step 5 is English, and the NPC name inside step 6 falls back to English because the name table lacks that one id. This addon closes the gap instead of leaving guides half done.

## What you get

### 1. Guide texts — 7,891 new strings across 254 guides

Every guide that ships with the Polestar guide packs now reads fully in Chinese, including 46 guides the official pack has no translation for at all:

- **23 class quest guides** — hunter taming chains (Alliance and Horde), warlock demon quests (imp, voidwalker, incubus), shaman totem quests (Call of Earth, Call of Fire), paladin Tome of Divinity, priest robes, Desperate Prayer and Chastise, Touch of Weakness and Dark Sacrifice, mage teleports and Staff or Orb, Atiesh, warrior Quel'Serrar.
- **11 reputation guides** — Bloodsail Buccaneers, Brood of Nozdormu, Steamwheedle Cartel, Zandalar Tribe, Ravenholdt, Nightclaw Druids, Darkspear Islands, Centaur Clans, Kirin Tor, Wintersaber Trainers, Merchant's Favor. These are the longest of all: Steamwheedle alone is 88 strings, Brood of Nozdormu 112.
- **9 collectible guides** — pets such as Bitter Baitling, Weevil K'neevil, Disgusting Oozeling, Black Tabby.
- **2 leveling guides** — Silithus 50-60 (Alliance) and Darkshore (Night Elf start).

The rest is filling gaps inside guides the official pack translated only partly: 29 Alliance leveling guides, 28 Horde leveling guides, 58 class quest guides, 55 mount and pet guides, 16 reputation guides, 12 profession guides, 7 exploration guides, 2 miscellaneous guides and 1 legacy guide.

### 2. Game names — 341 ids the name table was missing

| Kind | Ids |
| --- | --- |
| NPCs | 147 |
| Quests | 137 |
| Objects | 52 |
| Items | 5 |

Guide steps are stored in English with placeholders like `{npc:1231}` and `{item:6284}`; Polestar resolves them to a name when it draws the step. When the name table has no entry for an id, that name comes out in English in the middle of an otherwise Chinese sentence. These 341 entries fix that.

### 3. Interface strings — 258 new translations

Polestar ships its own `Locales/zhCN.lua`, where 302 keys are left as comments, which means English on screen. This addon covers 261 of them: 257 of those commented-out keys, plus 4 the file does not contain at all. Three are pure format strings such as `%.1f MB` and pass through unchanged, so 258 are actual translations. Affected screens:

- Options pages: arrow behaviour, restock amounts, junk and keep marks, class quest chime, icon packs, Characters page.
- Guide window: step tooltips, "3 quests to pick up", "1.2k left", rested XP, bag space warnings, travel and hearthstone advice.
- Merchant and bag interaction: Restock button, "Don't sell: the guide needs it at step %d", junk marks.

## What it looks like in game

A Horde warlock guide, official pack only:

> At 10 {npc:3294} sends you to {npc:5875}. He stands outside at the back of {area:362}'s barracks, the big building on the east side of town (not the inn), a few steps from {npc:3172}, the warlock trainer.

The same step here:

> 10级时{npc:3294}让你去找{npc:5875}。他站在{area:362}兵营的后门外，兵营是镇子东侧的大建筑（不是旅店），离术士训练师{npc:3172}只有几步。

A reputation guide that the official pack does not cover at all, before and after:

> Defias Pillagers and Looters hold the farms west of {area:108}, between the coast road and {area:20}. Careful: The {area:113} cave holds many Defias packed together, so it is easy to pull several at once there.

> 迪菲亚掠夺者和抢劫者占据{area:108}以西的农场，位于海岸道路和{area:20}之间。小心：{area:113}的洞穴里挤满了迪菲亚，在那里很容易一次拉来好几只。

Interface text:

> Bags nearly full: %d slots left. → 背包快满了：只剩 %d 格。

Placeholders are kept intact, so nothing breaks: `{npc:…}` and `{item:…}` are filled from the name tables (official pack plus this addon), `{area:…}`, `{zone:…}` and `{spell:…}` from your client, and `%d` / `%s` by whatever prints the string.

## Known gaps

- **45 interface strings are still English** — the Dalaran gate, the Shortest Path Forever integration, gamepad browsing, talent plans, the report page, transport countdowns and party tracking. Polestar's `zhCN.lua` has them commented out; they are not translated yet.
- **Area, zone, spell and skill names come from the game client**, not from this addon, so they follow your client language. Only quest, NPC, object and item names are supplemented here.
- **New Polestar versions can add new guides and strings.** If a guide appears in English after a Polestar update, this addon has not caught up with it yet.

## Credits and licence

- Guide data, name tables and interface strings belong to Polestar and its `Polestar_zhCN` pack.
- Translations in this addon follow the terminology of the official Simplified Chinese client and of `Polestar_zhCN`, so a name here is the name the game shows.
- Licence: GPL-3.0-only, matching Polestar.

---

# Polestar 简体中文增强

Polestar 的练级指南原文是英文。官方 `Polestar_zhCN` 译了一部分，这个插件把剩下的译完。

不改动 Polestar，也不改动 `Polestar_zhCN`：只把缺的文本注册进去，同一条文本两边都有的，一律以官方译文为准，所以可以和官方包同时装着用。

## 官方中文包没译的部分

以 `Polestar_zhCN` 0.3.4（Polestar 接口 16001）实际核对：

| 内容 | 只有官方 `Polestar_zhCN` | 加上本插件 |
| --- | --- | --- |
| 有中文的指南 | 254 篇里的 208 篇 | 254 篇全部 |
| 指南正文条目 | 3,394 条 | 11,297 条（全部） |
| 游戏名称（任务／NPC／物体／物品） | 除 341 个 id 之外 | 完整 |
| Polestar 界面文字 | 2,430 键 | 再补 258 条译文（覆盖 261 键） |

这个缺口在练级时是能直接感觉到的：一篇译了六成的指南，第 4 步是中文、第 5 步是英文，第 6 步里的 NPC 名字因为名称表没有那个 id 又变回英文。本插件做的是把缺口填掉，而不是留一篇译到一半的指南。

## 具体补了什么

### 一、指南正文：254 篇指南，新增 7,891 条

Polestar 指南包里的每一篇现在都是完整中文，其中 46 篇官方包完全没有译文：

- **23 篇职业任务指南**：猎人驯服链（联盟与部落）、术士的恶魔任务（小鬼、虚空行者、魅魔）、萨满的图腾任务（土图腾、火图腾）、圣骑士《神圣之书》（Tome of Divinity）、牧师长袍与绝望祷言／责罚、虚弱之触与黑暗祭献、法师传送与法杖或法球、埃提耶什、战士的奎尔塞拉。
- **11 篇声望指南**：血帆海盗、诺兹多姆的子嗣、热砂港财团、赞达拉部族、暗矛群岛、拉文霍特、夜爪德鲁伊、肯瑞托、商人的恩惠等。这些也是最长的一批：热砂港财团 88 条，诺兹多姆的子嗣 112 条。
- **9 篇小宠物收集指南**。
- **2 篇升级指南**：希利苏斯 50-60（联盟）、黑海岸（暗夜精灵开局）。

其余是给官方译过、但仍有缺口的指南补齐：联盟升级 29 篇、部落升级 28 篇、职业任务 58 篇、坐骑与宠物 55 篇、声望 16 篇、专业 12 篇、探索 7 篇、杂项 2 篇、传承 1 篇。

### 二、游戏名称：补 341 个 id

| 类别 | 数量 |
| --- | --- |
| NPC | 147 |
| 任务 | 137 |
| 物体 | 52 |
| 物品 | 5 |

指南正文里存的是 `{npc:1231}`、`{item:6284}` 这样的占位符，绘制那一步时才去名称表取名字。名称表里没有这个 id，一句中文里就会夹进一个英文名。这 341 条就是补这些洞的。

### 三、界面文字：258 条新增译文

Polestar 自带 `Locales/zhCN.lua`，里面 302 个键是以注释形式留空的，也就是说界面上显示英文。本插件覆盖其中 261 条：257 条是那些被注释掉的键，另有 4 条原文件里根本没有。这 261 条里有 3 条是纯格式串（如 `%.1f MB`），照原样搬过去，所以实际新增译文 258 条。涉及的界面：

- 选项页：箭头走法、补货数量、垃圾与保留标记、职业任务提示音、图标包、角色页面。
- 指南窗口：步骤提示、可接任务数、“还差 1.2k”、精力充沛、背包空格提醒、炉石与行程建议。
- 商人与背包操作：补货按钮、“别卖：指南第 12 步需要它”、垃圾标记。

## 在游戏里是什么样

部落术士指南，只有官方包时：

> At 10 {npc:3294} sends you to {npc:5875}. He stands outside at the back of {area:362}'s barracks, the big building on the east side of town (not the inn), a few steps from {npc:3172}, the warlock trainer.

装上本插件后：

> 10级时{npc:3294}让你去找{npc:5875}。他站在{area:362}兵营的后门外，兵营是镇子东侧的大建筑（不是旅店），离术士训练师{npc:3172}只有几步。

官方包完全没覆盖的声望指南：

> Defias Pillagers and Looters hold the farms west of {area:108}, between the coast road and {area:20}. Careful: The {area:113} cave holds many Defias packed together, so it is easy to pull several at once there.

> 迪菲亚掠夺者和抢劫者占据{area:108}以西的农场，位于海岸道路和{area:20}之间。小心：{area:113}的洞穴里挤满了迪菲亚，在那里很容易一次拉来好几只。

界面文字：

> Bags nearly full: %d slots left. → 背包快满了：只剩 %d 格。

占位符一律原样保留，所以不会出问题：`{npc:…}` 与 `{item:…}` 仍从名称表（官方包加本插件）取名，`{area:…}`、`{zone:…}`、`{spell:…}` 由你的客户端给出，`%d` 与 `%s` 由显示这条文字的那段代码填入。

## 尚未覆盖

- **45 条界面文字仍是英文**：达拉然城门、与 Shortest Path Forever 的整合、手柄浏览、天赋方案、问题反馈页、交通工具倒计时、小队追踪。这些在 Polestar 的 `zhCN.lua` 里是注释状态，本插件还没译。
- **区域、地名、法术、技能名来自游戏客户端**，不由本插件提供，跟着你的客户端语言走。这里只补任务、NPC、物体、物品名。
- **Polestar 更新会带来新的指南和文本。** 更新后若有指南又变回英文，说明本插件还没跟上那一版。

## 致谢与许可

- 指南数据、名称表、界面文字都来自 Polestar 及其 `Polestar_zhCN` 包。
- 本插件的译名沿用简体中文客户端与 `Polestar_zhCN` 的说法，保证插件里叫的名字和游戏里显示的一致。
- 许可：GPL-3.0-only，与 Polestar 一致。
