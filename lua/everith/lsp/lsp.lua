-- NOTE: Server configuration help:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 
-- load lsp lsnguage server configuration:
local luaConfig = require "everith/lsp/languages/lua"
--
-- enable lsp language server
require'lspconfig'.sumneko_lua.setup{luaConfig}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}
