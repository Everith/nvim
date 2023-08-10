local ok, nullls = pcall(require, "null-ls")
if not ok then
	print("Null-ls failed to load.")
	return
end

local formatting = nullls.builtins.formatting
local diagnostics = nullls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nullls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.clang_format,
		diagnostics.cpplint,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
