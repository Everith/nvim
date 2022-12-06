local status_ok, config = pcall(require, "window-picker")
if not status_ok then
  return
end

config.setup({
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = {
        "neo-tree",
        "neo-tree-popup",
        "notify",
        "packer",
        "qf",
        "diff",
        "fugitive",
        "fugitiveblame",
      },

      -- if the buffer type is one of following, the window will be ignored
      buftype = { "nofile", "help", "terminal" },
    },
  },
  other_win_hl_color = "#f05a40",
})
