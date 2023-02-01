local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".terraform", "%.jpg", "%.png" },
    -- used for grep_string and live_grep
    vimgrep_arguments = {
      "rg",
      "--follow",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--no-ignore",
      "--trim",
    },
    mappings = {
      i = {
        -- Close on first esc instead of going to normal mode
        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist,
        ["<C-l>"] = actions.send_to_qflist,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<cr>"] = actions.select_default,
        ["<c-v>"] = actions.select_vertical,
        ["<c-s>"] = actions.select_horizontal,
        ["<c-t>"] = actions.select_tab,
        ["<c-p>"] = action_layout.toggle_preview,
        ["<c-o>"] = action_layout.toggle_mirror,
        ["<c-h>"] = actions.which_key,
        ["<c-x>"] = actions.delete_buffer,
      },
      --      n = {
      --        ["<esc>"] = actions.close,
      --        }
    },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    entry_prefix = "  ",
    multi_icon = "<>",
    initial_mode = "insert",
    scroll_strategy = "cycle",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
      flex = { horizontal = { preview_width = 0.9 } },
    },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
  pickers = {
    find_files = {
      hidden = false,
    },
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    -- find_command = { "fd", "--hidden", "--type", "file", "--follow", "--strip-cwd-prefix" },
    -- find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case" or "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = false,
      hidden = true,
      mappings = {
        i = {
          ["<c-n>"] = fb_actions.create,
          ["<c-r>"] = fb_actions.rename,
          -- ["<c-h>"] = actions.which_key,
          ["<c-h>"] = fb_actions.toggle_hidden,
          ["<c-x>"] = fb_actions.remove,
          ["<c-p>"] = fb_actions.move,
          ["<c-y>"] = fb_actions.copy,
          ["<c-a>"] = fb_actions.select_all,
        },
      },
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
})

telescope.setup({})

telescope.load_extension("zoxide")
telescope.load_extension("heading")
telescope.load_extension("packer")
telescope.load_extension("ui-select")
-- telescope.load_extension("make")
-- telescope.load_extension("noice")
-- telescope.load_extension('media_files')
