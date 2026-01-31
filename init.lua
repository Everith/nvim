-- require "everith"
require("everith.plugins")

require("everith.colorscheme")
require("everith.options")

require("everith.scripts")
-- require("everith.autocmd")

require("everith.keymaps")

GetOS()
-- vim.cmd("autocmd InsertEnter * lua vim.fn.system([[mpv --no-terminal $MYVIMRC/sound/oh-yeah.wav]])")
-- vim.cmd('autocmd InsertLeave * lua vim.fn.system("mpv --no-terminal $MYVIMRC/sound/oh-yeah.wav")')
-- vim.cmd(
-- 	lua vim.fn.system([[mpv --no-terminal C:\\Users/balaz/AppData/Local/nvim/sound/sound/oh-yeah.wav]])
-- )

--CHANGE DIR
--:cd %:h
--Starting directory
--vim.cmd ("cd C:\\Projects")
--vim.cmd ("cd D:\\Project")

-- api.nvim_command('enew') -- equivalent to :enew
--local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
--local g = vim.g      -- a table to access global variables (let g: -> g.)
--local opt = vim.opt  -- to set options (set -> opt.)

--NOTE: detect nvui instance:
--if vim.fn.exists("g:nvui") == 1 then
--  vim.cmd("NvuiFrameless 0")
--  vim.cmd("NvuiCmdFontFamily Hack NF:h12")
--  vim.cmd("NvuiCmdFontSize 25.0")
--  vim.cmd("NvuiScrollAnimationDuration 0.2")
--end

-- WARN: Required programs for Windows:
--  choco install ripgrep
--
-- WARN: Required programs for Linux:
