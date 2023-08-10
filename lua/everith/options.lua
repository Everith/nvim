-- interval for writing swap file to disk, also used by gitsigns

-- api.nvim_command('enew') -- equivalent to :enew
--vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--vim.fn -> vin.fn.exists('') ==== exists('')  or echo " " | to call Vim functions e.g. fn.bufnr()
--vim.g    -- a table to access global variables (let g: -> g.)
--vim.opt  -- set 'options'
--
--vim.o  -- controlls global options
--vim.wo -- controlls local to windows soecific options
--vim.bo -- controlls local to buffer specific options
--vim.b  -- local/buffer specific variables

-------------------------------------- options ------------------------------------------

-- :help options
vim.opt.guifont = "Hack NF:h12" -- the font used in graphical neovim applications not in terminal

-- Numbers
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 3 -- set number column width to 2 {default 4}
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.ruler = false

-- Indenting
vim.opt.tabstop = 2 -- insert { n } spaces for a tab
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true
-- vim.opt.autoindent = true

vim.opt.wrap = false -- wraping lines to fit in screen
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- watch capitall leters if you typed capiual letters but ignot them if you dont
vim.opt.mouse = "a"
vim.opt.fillchars = { eob = " " }

-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true -- allow true terminal colors
vim.opt.background = "dark" -- default to dark themes
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.scrolloff = 8 -- keeps lines betwen the cuesor and the top and bottom of the screen
vim.opt.sidescrolloff = 8 -- keeps lletters betwen the cuesor and the left and right of the screen

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = true
vim.opt.backspace = "indent,eol,start"

vim.opt.iskeyword:append("-") -- considers hello-world as one word insted of two separeted with "-"
-- vim.opt.shortmess:append("c")

-- disable nvim intro
vim.opt.shortmess:append("sI")
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- TODO: sort thes out if i need them or not
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.undofile = true
-- vim.opt.incsearch = true
-- vim.opt.backup = false -- creates a backup file
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.mouse = "a" -- allow the mouse to be used in neovim
-- vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 2 -- always show tabs
-- vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.undofile = true -- enable persistent undo
-- vim.opt.updatetime = 300 -- faster completion (4000ms default)
-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.fileencoding = "utf-8" -- the encoding written to a file

--vim.cmd "set whichwrap+=<,>,[,],h,l"
--vim.cmd [[set iskeyword+=-]]
--vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- auto command
--vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode

--########################################
--NVUI OPTIONS
--########################################
if vim.fn.exists("g:nvui") == 1 then
	vim.cmd("NvuiFrameless 1")
	vim.cmd("NvuiCmdFontFamily Hack NF:h12")
	vim.cmd("NvuiCmdFontSize 25.0")
	vim.cmd("NvuiScrollAnimationDuration 0.2")
end
