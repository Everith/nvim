local ok, mason = pcall(require, "mason")
if not ok then
	print("Mason failed to load.")
	return
end

local masonLspconfigok, masonLspconfig = pcall(require, "mason-lspconfig")
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

masonLspconfig.setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"html",
		"cssls",
		"tailwindcss",
		"sumneko_lua",
	},
	automatic_installation = true,
})

-- Formatters and linters list:
-- https://github.com/jay-babu/mason-null-ls.nvim#available-null-ls-sources
masonNullLs.setup({
	ensure_installed = {
		"prettier", -- javascript javascriptreact typescript typescriptreact vue css scss less html json jsonc yaml markdown markdown.mdx graphql handlebars
		"stylua", -- lua
		"cpplint", -- cpp c
		--    "eslint_d", -- linter for typeScript
	},
	automatic_installation = true,
})
