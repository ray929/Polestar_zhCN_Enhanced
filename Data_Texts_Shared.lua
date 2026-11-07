-- Supplementary guide texts (zhCN) for the shared Polestar_Guides pack
-- (professions, reputations, mounts, pets, dungeons, ...).
-- Only entries the official Polestar_zhCN lacks; official text always wins.

local _, E = ...
if not (GetLocale and GetLocale() == "zhCN") then return end

local G = E.guides

-- Format:
-- G["forever/shared/<guide-id>"] = {
--   ["English original"] = "中文",
-- }
