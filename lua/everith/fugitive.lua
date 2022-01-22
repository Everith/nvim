-- GIT fugitive keybindings
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('','<leader>gs',':G<CR>',opts)
keymap('','<leader>gc',':Git commit<CR>',opts)
keymap('','<leader>gp',':Git push<CR>',opts)
keymap('','<leader>gf',':Git fetch<CR>',opts)
