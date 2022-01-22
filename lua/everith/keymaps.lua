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
keymap('n', '_', ':bp<cr>',opts)  -- Make <C-u> undo-friendly
keymap('n', '+', ':bn<cr>',opts)  -- Make <C-u> undo-friendly


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

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
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- PLUGINS
-- TELESCOPE ###################################################
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

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



-- <Tab> to navigate the completion menu
-- keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- keymap('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights


-- keymap('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
-- keymap('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
-- keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- keymap('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
-- keymap('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
