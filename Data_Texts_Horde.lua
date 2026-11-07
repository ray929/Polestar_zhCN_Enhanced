-- Supplementary guide texts (zhCN) for the Polestar_Guides_Horde pack.
-- Only entries the official Polestar_zhCN lacks; official text always wins.

local _, E = ...
if not (GetLocale and GetLocale() == "zhCN") then return end

local G = E.guides

-- Format:
-- G["forever/horde/<guide-id>"] = {
--   ["English original"] = "中文",
-- }

-- Last file in the .toc: everything is loaded, install the hooks.
E.Apply()
