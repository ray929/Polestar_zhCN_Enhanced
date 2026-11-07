-- Supplementary guide texts (zhCN) for the Polestar_Guides_Alliance pack.
-- Only entries the official Polestar_zhCN lacks; official text always wins.

local _, E = ...
if not (GetLocale and GetLocale() == "zhCN") then return end

local G = E.guides

-- Format:
-- G["forever/alliance/<guide-id>"] = {
--   ["English original"] = "中文",
-- }
