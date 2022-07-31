local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print()
	return
end

require("everith.lsp.lsp-installer")
require("everith.lsp.handlers").setup()

-- #######################################
-- [settings] dir is for codeing languaes specific setting
-- [handlers] has lsp setting
-- [lsp-installer] is coding languages installer config
