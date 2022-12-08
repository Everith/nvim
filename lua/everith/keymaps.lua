local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
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
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<leader>sv", ":source $MYVIMRC<CR>", opts)
keymap("", "<leader>ev", ":e $MYVIMRC<CR>", opts)
keymap("", "<leader>cd", ":cd %:h<CR>", opts)
keymap("n", "<C-l>", "<cmd>noh<CR>", opts) -- Clear highlights
keymap("n", "<C-p>", "<cmd>Neotree toggle<CR>", opts) -- Clear highlights

--BUILD.BAT file run and project stuff
keymap("", "<F5>", ":lua BuildCodes()<CR>", opts)
-- keymap("", "<F6>", ":w<CR>:cd %:h<CR>:!build\\AoC.exe<CR>", opts)
-- keymap("", "<F1>", ":lua Terminal()<CR>", opts)
keymap("", "K", ":lua GetManual()<CR>", opts)
--NVUI
-- keymap("n", "<F11>", ":NvuiToggleFullscreen<CR>", opts)

--MOUVEMENTS
keymap("n", "<A-h>", "<C-w><C-h>", opts) -- Make <C-u> undo-friendly
keymap("n", "<A-j>", "<C-w><C-j>", opts) -- Make <C-u> undo-friendly
keymap("n", "<A-k>", "<C-w><C-k>", opts) -- Make <C-u> undo-friendly
keymap("n", "<M-l>", "<C-w><C-l>", opts) -- Make <C-u> undo-friendly
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--BUFFERS
keymap("n", "<c-k>", ":bp<cr>", opts) -- Make <C-u> undo-friendly
keymap("n", "<c-j>", ":bn<cr>", opts) -- Make <C-u> undo-friendly
keymap("n", "<c-q>", ":bd<cr>", opts) -- Make <C-u> undo-friendly

-- Visual --
-- ndent
keymap("v", "<s-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)
-- Move text up and down
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "p", '"_c<C-r>"<Esc>', opts) -- replace line or selected text
-- keymap("x", "P", 'I<C-r>"<Esc>', opts)

-- PLUGINS
-- DAP DEBUGGING:
keymap("", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("", "<F6>", ":lua require'dap'.continue()<CR>", opts)
keymap("", "<F9>", ":lua require'dap'.step_over()<CR>", opts)
keymap("", "<F10>", ":lua require'dap'.step_into()<CR>", opts)

-- GIT fugitive keybindings
keymap("", "<leader>gs", ":G<CR>", opts)
keymap("", "<leader>gc", ":Git commit<CR>", opts)
keymap("", "<leader>gp", ":Git push<CR>", opts)
keymap("", "<leader>gf", ":Git fetch<CR>", opts)

-- LSP ##############################################################
keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
--  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>le", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymap("n", "<leader>F2", "lua vim.lsp.buf.formatting()", opts)

-- <Tab> to navigate the completion menu
-- keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
-- keymap("i", "<Tab>", 'pumvisible() ? "\\<CR>" : "\\<Tab>"', { expr = true })
--
-- TELESCOPE ###################################################
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>tf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)

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
--     local wk = require("which-key")
--     local default_options = { silent = true }
--     wk.register({
--       c = {
--         name = "Coding",
--         a = { "<cmd>GoCodeAction<cr>", "Code action" },
--         e = { "<cmd>GoIfErr<cr>", "Add if err" },
--         h = {
--           name = "Helper",
--           a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
--           r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
--           c = { "<cmd>GoCoverage<cr>", "Test coverage" },
--           g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
--           v = { "<cmd>GoVet<cr>", "Go vet" },
--           t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
--           i = { "<cmd>GoModInit<cr>", "Go mod init" },
--         },
--         i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
--         l = { "<cmd>GoLint<cr>", "Run linter" },
--         o = { "<cmd>GoPkgOutline<cr>", "Outline" },
--         r = { "<cmd>GoRun<cr>", "Run" },
--         s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
--         t = {
--           name = "Tests",
--           r = { "<cmd>GoTest<cr>", "Run tests" },
--           a = { "<cmd>GoAlt!<cr>", "Open alt file" },
--           s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
--           v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
--           u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
--           f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
--         },
--         x = {
--           name = "Code Lens",
--           l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
--           a = { "<cmd>GoCodeAction<cr>", "Code Action" },
--         },
--       },
--     }, { prefix = "<leader>", mode = "n", default_options })
--     wk.register({
--       c = {
--         -- name = "Coding",
--         j = { "<cmd>'<,'>GoJson2Struct<cr>", "Json to struct" },
--       },
--     }, { prefix = "<leader>", mode = "v", default_options })
