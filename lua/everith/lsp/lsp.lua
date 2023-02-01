-- NOTE: Server configuration help:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 
-- NOTE: LUA
-- https://github.com/sumneko/lua-language-server/blob/master/locale/en-us/setting.lua
require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        --enable = true,
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
        },
      },
      telemetry = { enable = false },
    },
  },
  format = {
    enable = true,
  },
  filetypes = { "lua" },
}

-- NOTE: GO
require'lspconfig'.gopls.setup{}

-- NOTE: HTML
require'lspconfig'.html.setup{}

-- NOTE: CSS
require'lspconfig'.cssls.setup{}

-- NOTE: JavaScript NODEJS TypeScript
require'lspconfig'.tsserver.setup{}

-- NOTE: C++ C
require'lspconfig'.clangd.setup{}

-- NOTE: RUST
require'lspconfig'.rust_analyzer.setup{}
