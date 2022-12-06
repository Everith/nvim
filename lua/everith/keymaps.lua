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
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<leader>sv", ":source $MYVIMRC<CR>", opts)
keymap("", "<leader>ev", ":e $MYVIMRC<CR>", opts)
keymap("", "<leader>cd", ":cd %:h<CR>", opts)
keymap("n", "<C-l>", "<cmd>noh<CR>", opts) -- Clear highlights
keymap("n", "<C-p>", "<cmd>Neotree toggle<CR>", opts) -- Clear highlights

--BUILD.BAT file run and project stuff

keymap("", "<F5>", ":lua BuildCodes()<CR>", opts)
keymap("", "<F6>", ":w<CR>:cd %:h<CR>:!build\\AoC.exe<CR>", opts)
keymap("", "<F1>", ":lua Terminal()<CR>", opts)
keymap("", "K", ":lua GetManual()<CR>", opts)
--NVUI
keymap("n", "<F11>", ":NvuiToggleFullscreen<CR>", opts)

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
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "p", '"_c<C-r>"<Esc>', opts) -- replace line or selected text
keymap("x", "P", 'I<C-r>"<Esc>', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<Esc>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- PLUGINS
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
keymap(
  "n",
  "<leader>tf",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
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
local wk = require("which-key")
local default_options = { silent = true }
wk.register({
  c = {
    name = "Coding GO",
    a = { "<cmd>GoCodeAction<cr>", "Code action" },
    e = { "<cmd>GoIfErr<cr>", "Add if err" },
    h = {
      name = "Helper",
      a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
      r = { "<cmd>GoRMTag<cr>", "Remove tags to struct" },
      c = { "<cmd>GoCoverage<cr>", "Test coverage" },
      g = { "<cmd>lua require('go.comment').gen()<cr>", "Generate comment" },
      v = { "<cmd>GoVet<cr>", "Go vet" },
      t = { "<cmd>GoModTidy<cr>", "Go mod tidy" },
      i = { "<cmd>GoModInit<cr>", "Go mod init" },
    },
    i = { "<cmd>GoToggleInlay<cr>", "Toggle inlay" },
    l = { "<cmd>GoLint<cr>", "Run linter" },
    o = { "<cmd>GoPkgOutline<cr>", "Outline" },
    r = { "<cmd>GoRun<cr>", "Run" },
    s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
    t = {
      name = "Tests",
      r = { "<cmd>GoTest<cr>", "Run tests" },
      a = { "<cmd>GoAlt!<cr>", "Open alt file" },
      s = { "<cmd>GoAltS!<cr>", "Open alt file in split" },
      v = { "<cmd>GoAltV!<cr>", "Open alt file in vertical split" },
      u = { "<cmd>GoTestFunc<cr>", "Run test for current func" },
      f = { "<cmd>GoTestFile<cr>", "Run test for current file" },
    },
    x = {
      name = "Code Lens",
      l = { "<cmd>GoCodeLenAct<cr>", "Toggle Lens" },
      a = { "<cmd>GoCodeAction<cr>", "Code Action" },
    },
  },
}, { prefix = "<leader>", mode = "n", default_options })

wk.register({
  l = {
    name = "LSP",
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
    I = {
      "<cmd>lua vim.lsp.buf.implementation()<cr>",
      "Show implementations",
    },
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
    e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
    n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
    w = {
      name = "workspaces",
      a = {
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        "Add Workspace Folder",
      },
      d = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
      l = {
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        "List Workspace Folders",
      },
      r = {
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        "Remove Workspace Folder",
      },
      s = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    },
  },
}, { prefix = "<leader>", mode = "n", default_options })
wk.register({
  m = {
    F = { "<cmd>lua require('everith.lsp.utils').toggle_autoformat()<cr>", "Toggle format on save" },
  },
}, { prefix = "<leader>", mode = "n", default_options })
