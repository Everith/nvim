local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	print("LSPconfig failed to load.")
	return
end

local CmpNvimLsp_ok, CmpNvimLsp = pcall(require, "cmp_nvim_lsp")
if not CmpNvimLsp_ok then
	print("LSPconfig failed to load.")
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "<space>q", vim.diagnostic.setloclist, opts)
	keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "<leader>lp", "<cmd> Lspsaga peek_definition<CR>", opts)
	keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap("n", "<leader>ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap("n", "<leader>en", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	keymap("n", "<leader>le", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", opts)
	keymap("n", "<leader>cf", "lua vim.lsp.buf.formatting()", opts)

	-- only apply if specific server name is matching
	if client.name == "sumneko_lua" then
		keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	end
end

-- NOTE: Server configuration help:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- NOTE: LUA
-- https://github.com/sumneko/lua-language-server/blob/master/locale/en-us/setting.lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
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
})

-- NOTE: GO
lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- NOTE: HTML
--lspconfig.html.setup({})
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- NOTE: CSS
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- NOTE: JavaScript NODEJS TypeScript
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- NOTE: C++ C
lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- NOTE: RUST
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
