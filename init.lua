-- require "everith"
require("everith.plugins")
require("everith.colorscheme")

require("everith.options")
require("everith.scripts")
require("everith.keymaps")
require("everith.autocmd")

--CHANGE DIR
--:cd %:h
--Starting directory
--vim.cmd "cd C:\\Projects"
--vim.cmd "cd D:\\Project"

-- api.nvim_command('enew') -- equivalent to :enew
--local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
--local g = vim.g      -- a table to access global variables (let g: -> g.)
--local opt = vim.opt  -- to set options (set -> opt.)
