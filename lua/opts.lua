-- api.nvim_command('enew') -- equivalent to :enew
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables (let g: -> g.)
local opt = vim.opt  -- to set options (set -> opt.)

--vim.o  -- controlls global options
--vim.wo -- controlls local to windows soecific options
--vim.bo -- controlls local to buffer specific options
--vim.g  -- global variables
--vim.b  -- local/buffer specific variables

g.neovide_transparency = 0.9
g.neovide_cursor_animation_length=0.5
g.neovide_cursor_trail_length=0.5
--g.neovide_remember_window_size = true
--g.neovide_fullscreen=true

opt.termguicolors = true
g.tokyonight_style = 'night' -- available: night, storm
g.tokyonight_enable_italic = true 

cmd 'colorscheme tokyonight'            -- Put your favorite colorscheme here
opt.completeopt = {'menuone', 'noinsert', 'noselect'}  -- Completion options (for deoplete)
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.list = true                     -- Show some invisible characters
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.sidescrolloff = 8               -- Columns of context
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wildmode = {'list', 'longest'}  -- Command-line completion mode
opt.wrap = true                     -- Disable line wrap

--g. is vim.g it is a  let command globali
--set leader key
g.mapleader = ' '
