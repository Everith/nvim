local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
	ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
	check_ts = true, -- use treesitter to check for a pair.
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
