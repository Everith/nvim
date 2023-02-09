local lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_ok then
	print("lsp SAGA failed to load.")
	return
end

lspsaga.setup({
	move_in_saga = {
		prev = "<C-k>",
		next = "<C-j>",
	},
	finder_action_keys = {
		open = "<CR>",
	},
	definition_action_keys = {
		edit = "<CR>",
	},
})
