-- Polestar_zhCN_Enhanced: supplements the official Polestar_zhCN pack with
-- texts it does not cover, without touching Polestar or Polestar_zhCN.
--
--   1. UI strings: missing keys of Polestar.L (official wins).
--   2. Guide texts: Polestar.RegisterGuideTexts is wrapped so that when the
--      official texts addon registers, our entries merge in (official wins
--      per key). RegisterGuideTexts replaces the whole table, and Polestar
--      loads Polestar_zhCN before this addon, so the data files carry a copy
--      of the official texts too: the direct registration below never loses
--      anything, whether the official addon is loaded, later, or disabled.
--      A guide's prose is rendered once, when its pack registers, and Polestar
--      only re-reads the texts on another addon's ADDON_LOADED (never ours),
--      so any guide prepared before this addon is re-rendered here.
--   3. Names: Polestar.Names query functions are wrapped; when the official
--      answer is nil our supplement answers.
--
-- Every data file fills the shared table E (the addon namespace). Data files
-- load after this one (see the .toc), so the hooks below consult E lazily.

local ADDON, E = ...

if not (GetLocale and GetLocale() == "zhCN") then return end
if type(Polestar) ~= "table" then return end

-- These translations were made for one Polestar release. RegisterGuideTexts
-- replaces texts["guides"] wholesale, so running them against a newer guide
-- set would push stale strings into the official pack's place. Stay silent
-- instead and tell the player to wait for a matching update.
local function tocField(addon, field)
	local get = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata
	if type(get) ~= "function" then return nil end
	local ok, value = pcall(get, addon, field)
	if not ok or type(value) ~= "string" then return nil end
	value = value:match("^%s*(.-)%s*$")
	return value ~= "" and value or nil
end

E.compatible = tocField(ADDON, "X-Compatible-Polestar")
E.upstream = tocField("Polestar", "Version")
E.build = tocField(ADDON, "X-Build-Version")
-- A source checkout still has the unreplaced @project-version@ marker.
if E.build and E.build:find("@", 1, true) then E.build = nil end
E.enabled = type(E.compatible) == "string" and type(E.upstream) == "string"
	and E.upstream == E.compatible

E.ui = E.ui or {}          -- [english] = 中文（Polestar.L 缺的键）
E.pack = E.pack or {}      -- 包级文本（RegisterGuideTexts 的 t.pack）
E.guides = E.guides or {}  -- [guideId] = { [english] = 中文 }
E.names = E.names or {}    -- [kind] = { [id] = 中文 }

---------------------------------------------------------------------------
-- 1. UI strings
---------------------------------------------------------------------------

local function fillUI()
	local L = Polestar.L
	if type(L) ~= "table" then return end
	for k, v in pairs(E.ui) do
		if rawget(L, k) == nil then rawset(L, k, v) end
	end
end

---------------------------------------------------------------------------
-- 2. Guide texts
---------------------------------------------------------------------------

local function merge(into, from)
	if type(into) ~= "table" or type(from) ~= "table" then return end
	for k, v in pairs(from) do
		if into[k] == nil then into[k] = v end
	end
end

local function mergeGuideTexts(t)
	if type(t) ~= "table" then return end
	if type(t.pack) ~= "table" then t.pack = {} end
	merge(t.pack, E.pack)
	if type(t.guides) ~= "table" then t.guides = {} end
	for gid, extra in pairs(E.guides) do
		local g = t.guides[gid]
		if type(g) ~= "table" then
			g = {}
			t.guides[gid] = g
		end
		merge(g, extra)
	end
end

-- A pack can register its guides while the addon-loading phase runs (before
-- this addon is in), and Polestar re-reads the texts only on a pack or texts
-- addon's ADDON_LOADED, which never fires for us. So the guides already
-- prepared are re-rendered here, once, with the texts just registered.
local function refreshGuides()
	local G, GT = Polestar.Guides, Polestar.GuideTexts
	if type(G) ~= "table" or type(GT) ~= "table" then return 0 end
	local list = type(G.List) == "function" and G.List() or nil
	local fields = GT.GUIDE_FIELDS
	if type(list) ~= "table" or type(GT.Refresh) ~= "function" then return 0 end
	local n = 0
	for i = 1, #list do
		local h = list[i]
		local id = type(h) == "table" and h.id
		local def = id and type(G.Get) == "function" and G.Get(id) or nil
		if def and GT.Refresh(def) then
			n = n + 1
			if type(fields) == "table" then
				for k = 1, #fields do h[fields[k]] = def[fields[k]] end
			end
		end
	end
	return n
end

local function hookGuideTexts()
	local orig = Polestar.RegisterGuideTexts
	if type(orig) ~= "function" then return end
	Polestar.RegisterGuideTexts = function(loc, packId, t)
		if loc == "zhCN" then mergeGuideTexts(t) end
		return orig(loc, packId, t)
	end
	-- RegisterGuideTexts replaces texts["guides"], so this must be a complete
	-- table (E.* already holds the official texts as well as our additions).
	orig("zhCN", "guides", { pack = E.pack, guides = E.guides })
	E.wired = true
	E.refreshed = refreshGuides()
end

---------------------------------------------------------------------------
-- 3. Names
---------------------------------------------------------------------------

local KIND_OF_FN = {
	Quest = "quest", Npc = "npc", Object = "object", Item = "item",
	Faction = "faction", Taxi = "taxi", Instance = "map", Encounter = "encounter",
}

local function hookNames()
	local N = Polestar.Names
	if type(N) ~= "table" then return end
	local function supp(kind, id)
		local t = E.names[kind]
		return t and id and t[id] or nil
	end
	for _, fnName in ipairs({ "Get", "Cached" }) do
		local orig = N[fnName]
		if type(orig) == "function" then
			N[fnName] = function(kind, id)
				return orig(kind, id) or supp(kind, id)
			end
		end
	end
	for fnName, kind in pairs(KIND_OF_FN) do
		local orig = N[fnName]
		if type(orig) == "function" then
			N[fnName] = function(id)
				return orig(id) or supp(kind, id)
			end
		end
	end
end

---------------------------------------------------------------------------

-- Called once by the last file in the .toc (Data_Texts_Horde.lua): the whole
-- addon is parsed in one go, and the guides a pack registered before it are
-- re-rendered right away; every later registration reads these texts itself.
function E.Apply()
	if not E.enabled or E.wired then return end
	fillUI()
	hookGuideTexts()
	hookNames()
end

-- Guides a pack registered before this addon, again: packs can still land
-- right around login (a saved tab, another faction), and a pack that was
-- hidden while Apply ran only shows up now.
function E.Refresh()
	if not E.enabled or not E.wired then return end
	E.refreshed = (E.refreshed or 0) + refreshGuides()
end

---------------------------------------------------------------------------
-- One chat line at login: says whether the texts were registered and how
-- many guides were re-rendered. Handy to tell a loaded but inert addon
-- (0 guides) from a working one; delete this block to stay silent.
---------------------------------------------------------------------------

local report = CreateFrame("Frame")
report:RegisterEvent("PLAYER_LOGIN")
report:SetScript("OnEvent", function(self)
	self:UnregisterAllEvents()
	if not E.enabled then
		print(("Polestar 已更新到 |cffffd100%s|r，|cff33ff99中文汉化加强包|r目前为|cffffd100%s|r版本，请查看插件更新器或者等待更新。期间会回落到官方原版汉化，不影响正常使用。"):format(
			tostring(E.upstream or "新版本"), tostring(E.build or "未知版本")))
		return
	end
	-- Second chance: Polestar's API was not there when this addon loaded.
	E.Apply()
	E.Refresh()
	local n = 0
	for _ in pairs(E.guides) do n = n + 1 end
	if E.wired then
		print(("|cff33ff99Polestar 简体中文增强|r：%d 个指南译文，重译 %d 篇指南。"):format(n, E.refreshed or 0))
	else
		print(("|cffff5555Polestar 简体中文增强|r：译文未注册（Polestar.RegisterGuideTexts 不可用）。"))
	end
end)
