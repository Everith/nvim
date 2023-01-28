local status_ok, nls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
  sources = {
    nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    nls.builtins.diagnostics.eslint,
    nls.builtins.formatting.prettier.with({ extra_args = { "--single-quote", "false" }, }),
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.gofumpt,
  },
  --   auto formating on loading plugin:
--   on_attach = function(client, bufnr)
--     local default_options = { silent = true }
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
--             vim.lsp.buf.format({ bufnr = bufnr })
--           end
--         end,
--       })
--     end
--   end,
})