local ok, mason = pcall(require, "mason")
if not ok then
  print("Mason failed to load.")
  return
end
mason.setup()

local ok, masonLspconfig = pcall(require, "mason-lspconfig")
if not ok then
  print("Mason-lspconfig failed to load.")
  return
end
masonLspconfig.setup({
  ensure_installed = {
	  "bashls",
	  "clangd",
	  "cssls",
	  "gopls",
	  "html",
	  "jsonls",
	  "tsserver",
	  "sumneko_lua",
	  "pyright",
	  "rust_analyzer",
	  "yamlls"
  },
  automatic_installation = true,
})
