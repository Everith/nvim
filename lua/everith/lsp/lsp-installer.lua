local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print("LSP Installer cant be imported")
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("everith.lsp.handlers").on_attach,
		capabilities = require("everith.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("everith.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end
	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("everith.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end
	 if server.name == "pyright" then
	 	local pyright_opts = require("everith.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end
	 if server.name == "clangd" then
	 	local clangd_opts = require("everith.lsp.settings.clangd")
	 	opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	 end
	server:setup(opts)
end)
