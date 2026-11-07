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
--   3. Names: Polestar.Names query functions are wrapped; when the official
--      answer is nil our supplement answers.
--
-- Every data file fills the shared table E (the addon namespace). Data files
-- load after this one (see the .toc), so the hooks below consult E lazily.

local ADDON, E = ...

if not (GetLocale and GetLocale() == "zhCN") then return end
if type(Polestar) ~= "table" then return end

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
-- addon is parsed during the addon-loading phase, strictly before Polestar
-- loads any pack on demand, so everything is in place in time.
function E.Apply()
	fillUI()
	hookGuideTexts()
	hookNames()
end
