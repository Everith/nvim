local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

--TODO if statment for themes options
-- vim.cmd 'colorscheme tokyonight'            -- Put your favorite colorscheme here
-- vim.opt.termguicolors = true
-- vim.g.tokyonight_style = 'night' -- available: night, storm
-- vim.g.tokyonight_enable_italic = true 


--VIM GUI options
-- vim.g.neovide_transparency = 0.9
-- vim.g.neovide_cursor_animation_length=0.5
-- vim.g.neovide_cursor_trail_length=0.5
-- g.neovide_remember_window_size = true
-- g.neovide_fullscreen=true