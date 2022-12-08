-- lsp lsnguage server setup
local luaConfig = require "everith/lsp/languages/lua"
require'lspconfig'.sumneko_lua.setup{luaConfig}

require'lspconfig'.gopls.setup{}
