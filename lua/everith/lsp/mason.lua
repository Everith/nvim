local ok, mason = pcall(require, "mason")
if not ok then
  print("Mason failed to load.")
  return
end

local masonLspconfigok, masonLSPconfig = pcall(require, "mason-lspconfig")
if not masonLspconfigok then
  print("Mason-lspconfig failed to load.")
  return
end

local masonNullLsok, masonNullLs = pcall(require, "mason-null-ls")
if not masonNullLsok then
  print("Mason-lspconfig failed to load.")
  return
end

mason.setup()

masonLSPconfig.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
  },
  automatic_installation = false,
})

-- Formatters and linters list:
-- https://github.com/jay-babu/mason-null-ls.nvim#available-null-ls-sources
masonNullLs.setup({
  ensure_installed = {
    "prettier", -- javascript javascriptreact typescript typescriptreact vue css scss less html json jsonc yaml markdown markdown.mdx graphql handlebars
    "stylua", -- lua
    "cpplint", -- cpp c
    "clang-format",
    --    "eslint_d", -- linter for typeScript
  },
  automatic_installation = false,
})

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
