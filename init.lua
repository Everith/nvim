
require "everith.options"
require "everith.keymaps"
require "everith.plugins"
require "everith.colorscheme"
require "everith.cmp"
require "everith.lsp"
require "everith.telescope"
require "everith.treesitter"


--CHANGE DIR
--:cd %:hn

-- api.nvim_command('enew') -- equivalent to :enew
--local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
--local g = vim.g      -- a table to access global variables (let g: -> g.)
--local opt = vim.opt  -- to set options (set -> opt.)