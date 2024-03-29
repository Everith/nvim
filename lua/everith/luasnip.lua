local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

local vsc = require("luasnip.loaders.from_vscode")
local lua = require("luasnip.loaders.from_lua")

-- snip_env = {
--   s = require("luasnip.nodes.snippet").S,
--   sn = require("luasnip.nodes.snippet").SN,
--   t = require("luasnip.nodes.textNode").T,
--   f = require("luasnip.nodes.functionNode").F,
--   i = require("luasnip.nodes.insertNode").I,
--   c = require("luasnip.nodes.choiceNode").C,
--   d = require("luasnip.nodes.dynamicNode").D,
--   r = require("luasnip.nodes.restoreNode").R,
--   l = require("luasnip.extras").lambda,
--   rep = require("luasnip.extras").rep,
--   p = require("luasnip.extras").partial,
--   m = require("luasnip.extras").match,
--   n = require("luasnip.extras").nonempty,
--   dl = require("luasnip.extras").dynamic_lambda,
--   fmt = require("luasnip.extras.fmt").fmt,
--   fmta = require("luasnip.extras.fmt").fmta,
--   conds = require("luasnip.extras.expand_conditions"),
--   types = require("luasnip.util.types"),
--   events = require("luasnip.util.events"),
--   parse = require("luasnip.util.parser").parse_snippet,
--   ai = require("luasnip.nodes.absolute_indexer"),
-- }

luasnip.config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })

-- load friendly-snippets
vsc.lazy_load()
-- load lua snippets
-- TODO: need to determine host OS for corrent path
-- lua.load({ paths = os.getenv("HOME") .. "/.config/nvim/snippets/" })
