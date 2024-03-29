local api = vim.api

-- Remove all trailing whitespace on save
-- local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
-- api.nvim_create_autocmd("BufWritePre", {
--   command = [[:%s/\s\+$//e]],
--   group = TrimWhiteSpaceGrp,
-- })

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- -- -- go to last loc when opening a buffer
-- -- api.nvim_create_autocmd(
-- --   "BufReadPost",
-- --   { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
-- -- )
-- -- -- windows to close with "q"
-- api.nvim_create_autocmd("FileType", {
--   pattern = { "help", "startuptime", "qf", "fugitive", "null-ls-info", "dap-float" },
--   command = [[nnoremap <buffer><silent> q :close<CR>]],
-- })
-- api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
-- --
-- -- -- disable list option in certain filetypes
-- -- api.nvim_create_autocmd("FileType", { pattern = { "NeoGitStatus" }, command = [[setlocal list!]] })
-- --
-- -- -- show cursor line only in active window
-- -- local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
-- -- api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
-- --   pattern = "*",
-- --   command = "set cursorline",
-- --   group = cursorGrp,
-- -- })
-- -- api.nvim_create_autocmd(
-- --   { "InsertEnter", "WinLeave" },
-- --   { pattern = "*", command = "set nocursorline", group = cursorGrp }
-- -- )
-- --
-- -- -- when there is no buffer left show Alpha dashboard
-- -- -- requires "famiu/bufdelete.nvim" and "goolord/alpha-nvim"
-- -- local alpha_on_empty = api.nvim_create_augroup("alpha_on_empty", { clear = true })
-- -- api.nvim_create_autocmd("User", {
-- --   pattern = "BDeletePost*",
-- --   group = alpha_on_empty,
-- --   callback = function(event)
-- --     local fallback_name = vim.api.nvim_buf_get_name(event.buf)
-- --     local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
-- --     local fallback_on_empty = fallback_name == "" and fallback_ft == ""
-- --
-- --     if fallback_on_empty then
-- --       -- require("neo-tree").close_all()
-- --       vim.api.nvim_command("Alpha")
-- --       vim.api.nvim_command(event.buf .. "bwipeout")
-- --     end
-- --   end,
-- -- })
-- --
-- -- -- Enable spell checking for certain file types
-- -- api.nvim_create_autocmd(
-- --   { "BufRead", "BufNewFile" },
-- --   -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
-- --   {
-- --     pattern = { "*.txt", "*.md", "*.tex" },
-- --     callback = function()
-- --       vim.opt.spell = true
-- --       vim.opt.spelllang = "en,de"
-- --     end,
-- --   }
-- -- )
-- --
-- -- -- automatically run PackerSync on save of plugins.lua
-- -- if settings.packer_auto_sync then
-- --   -- source plugins.lua and run PackerSync on save
-- --   local sync_packer = function()
-- --     vim.api.nvim_command("runtime lua/plugins.lua")
-- --     require("packer").sync()
-- --   end
-- --   api.nvim_create_autocmd({ "BufWritePost" }, {
-- --     pattern = { "plugins.lua" },
-- --     callback = sync_packer,
-- --   })
-- -- end
