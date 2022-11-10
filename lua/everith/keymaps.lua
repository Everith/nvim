local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- ''  glodal mode
-- 'i' insert mode
-- 'n' normal mode
-- 'v' visual mode

--Controll keys
--C = CTRL
--M = ALT
--A = ALT
--leader = " "
--
--

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('','<leader>sv',':source $MYVIMRC<CR>',opts)
keymap('','<leader>ev',':e $MYVIMRC<CR>',opts)
keymap('','<leader>cd',':cd %:h<CR>',opts)
keymap('n', '<C-l>', '<cmd>noh<CR>', opts)    -- Clear highlights

--BUILD.BAT file run and project stuff
keymap('','<F5>',':lua BuildCodes()<CR>',opts)
keymap('','<F6>',':w<CR>:cd %:h<CR>:!build\\AoC.exe<CR>',opts)
keymap('','<F1>',':lua Terminal()<CR>',opts)

--NVUI
keymap('n', '<F11>', ":NvuiToggleFullscreen<CR>", opts)

--MOUVEMENTS
keymap('n', '<A-h>', '<C-w><C-h>',opts)  -- Make <C-u> undo-friendly
keymap('n', '<A-j>', '<C-w><C-j>',opts)  -- Make <C-u> undo-friendly
keymap('n', '<A-k>', '<C-w><C-k>',opts)  -- Make <C-u> undo-friendly
keymap('n', '<M-l>', '<C-w><C-l>',opts)  -- Make <C-u> undo-friendly
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--BUFFERS
keymap('n', '<c-k>', ':bp<cr>',opts)  -- Make <C-u> undo-friendly
keymap('n', '<c-j>', ':bn<cr>',opts)  -- Make <C-u> undo-friendly
keymap('n', '<c-q>', ':bd<cr>',opts)  -- Make <C-u> undo-friendly


-- Visual --
-- ndent 
keymap("v", "<s-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)
-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- replace line or selected text

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<Esc>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- PLUGINS
-- LSP ##############################################################
-- <Tab> to navigate the completion menu
-- keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
keymap('i', '<Tab>', 'pumvisible() ? "\\<CR>" : "\\<Tab>"', {expr = true})
--
-- TELESCOPE ###################################################
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>tf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)

-- Twilight ############################################################
keymap("n", "<leader>hh", "<cmd>Twilight<cr>", opts)

-- FZF ########################################
-- keymap('n','<leader>p',':Files<CR>')
--commands:
--:Files 
--:GFiles 
--:GFiles
--:Buffers	
--:Colors	
--:Ag 
--:Rg 
--:Lines 
--:BLines 
--:Tags 
--:BTags 
--:Marks	
--:Windows	
--:Locate 
--:History	
--:History
--:History
--:Snippets	
--:Commits	
--:BCommits	
--:Commands	
--:Maps	
--:Helptags	
--:Filetypes	




