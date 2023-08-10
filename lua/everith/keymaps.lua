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

-- keymap("n", "<z>", "<cmd>vim.fn.system([[mpv --no-terminal $MYVIMRC/sound/oh_yeah.wav]])<CR>", opts) -- toggle neo-tree window

local function shell_call(args)
	local output = vim.fn.system(args)
	assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end
-- shell_call({ "mpv", "/srv/data/dev/Sounds/ding-36029.mp3" })

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<leader>ev", ":e $MYVIMRC<CR>", opts)
keymap("", "<leader>cd", ":cd %:h<CR>", opts)
keymap("n", "<leader><leader>", "<cmd>noh<CR>", opts) -- Clear highlights
keymap("n", "<C-p>", "<cmd>Neotree toggle<CR>", opts) -- toggle neo-tree window

--BUILD.BAT file run and project stuff
keymap("", "<F5>", ":lua BuildCodes()<CR>", opts)
-- keymap("", "<F6>", ":w<CR>:cd %:h<CR>:!build\\AoC.exe<CR>", opts)
-- keymap("", "<F1>", ":lua Terminal()<CR>", opts)
keymap("", "K", ":lua GetManual()<CR>", opts)
--NVUI
-- keymap("n", "<F11>", ":NvuiToggleFullscreen<CR>", opts)

--MOUVEMENTS
keymap("n", "<A-h>", "<C-w><C-h>", opts)
keymap("n", "<A-j>", "<C-w><C-j>", opts)
keymap("n", "<A-k>", "<C-w><C-k>", opts)
keymap("n", "<M-l>", "<C-w><C-l>", opts)
-- TABS
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tc", ":tabclose<CR>", opts) -- close tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) -- go to previus tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) -- go to next tab
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--BUFFERS
keymap("n", "<c-k>", ":bp<cr>", opts)
keymap("n", "<c-j>", ":bn<cr>", opts)
keymap("n", "x", '"_x', opts)
-- TODO: dont know wich one i want yet
-- keymap("n", "<c-q>", ":close<cr>", opts) -- close window
keymap("n", "<c-q>", ":bd<cr>", opts) -- destroy buffer

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
keymap("", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>", opts)
keymap("", "<F6>", ":lua require'dap'.continue()<CR>", opts)
keymap("", "<F9>", ":lua require'dap'.step_over()<CR>", opts)
keymap("", "<F10>", ":lua require'dap'.step_into()<CR>", opts)
keymap("", "<F11>", ":lua require'dap'.step_out()<CR>", opts)

-- GIT fugitive keybindings
keymap("", "<leader>gs", ":G<CR>", opts)
keymap("", "<leader>gc", ":Git commit<CR>", opts)
keymap("", "<leader>gp", ":Git push<CR>", opts)
keymap("", "<leader>gf", ":Git fetch<CR>", opts)

-- LUASNIP #############################################################
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end
-- expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })
-- jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })
-- selecting within a list of options.
vim.keymap.set("i", "<c-h>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

-- TELESCOPE ###################################################
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

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
-- local wk = require("which-key")
-- local default_options = { silent = true }
-- wk.register({
--   c = {
--     name = "Coding GO",
--     a = { "<cmd>GoCodeAction<cr>", "Code action" },
--     e = { "<cmd>GoIfErr<cr>", "Add if err" },
--     h = {
--       name = "Helper",
--       a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
--       r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
--       c = { "<cmd>GoCoverage<cr>", "Test coverage" },
--       g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
--       v = { "<cmd>GoVet<cr>", "Go vet" },
--       t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
--       i = { "<cmd>GoModInit<cr>", "Go mod init" },
--     },
--     i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
--     l = { "<cmd>GoLint<cr>", "Run linter" },
--     o = { "<cmd>GoPkgOutline<cr>", "Outline" },
--     r = { "<cmd>GoRun<cr>", "Run" },
--     s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
--     t = {
--       name = "Tests",
--       r = { "<cmd>GoTest<cr>", "Run tests" },
--       a = { "<cmd>GoAlt!<cr>", "Open alt file" },
--       s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
--       v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
--       u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
--       f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
--     },
--     x = {
--       name = "Code Lens",
--       l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
--       a = { "<cmd>GoCodeAction<cr>", "Code Action" },
--     },
--   },
-- }, { prefix = "<leader>", mode = "n", default_options })
--
-- wk.register({
--   l = {
--     name = "LSP",
--     D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
--     I = {
--       "<cmd>lua vim.lsp.buf.implementation()<cr>",
--       "Show implementations",
--     },
--     R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
--     e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
--     -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
--     i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
--     k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
--     l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
--     n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
--     p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--     q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
--     r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
--     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--     t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
--     w = {
--       name = "workspaces",
--       a = {
--         "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
--         "Add Workspace Folder",
--       },
--       d = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
--       l = {
--         "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
--         "List Workspace Folders",
--       },
--       r = {
--         "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
--         "Remove Workspace Folder",
--       },
--       s = {
--         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--         "Workspace Symbols",
--       },
--     },
--   },
-- }, { prefix = "<leader>", mode = "n", default_options })
-- wk.register({
--   m = {
--     F = { "<cmd>lua require('everith.lsp.utils').toggle_autoformat()<cr>", "Toggle format on save" },
--   },
-- }, { prefix = "<leader>", mode = "n", default_options })
