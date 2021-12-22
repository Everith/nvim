
require ('plugins')
require ('opts')
require ('maps')

--CHANGE DIR
--:cd %:hn

-- api.nvim_command('enew') -- equivalent to :enew
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables (let g: -> g.)
local opt = vim.opt  -- to set options (set -> opt.)

-- treeshiter settings 
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- lsp configuration 
local lsp = require'lspconfig'
local lspfuzzy = require'lspfuzzy'

-- We use the default settings for ccls and pylsp: the option table can stay empty
lsp.ccls.setup {}
lsp.pylsp.setup {}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

-- auto command
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
