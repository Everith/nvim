vim.cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself

paq {'neovim/nvim-lspconfig'}
paq {'williamboman/nvim-lsp-installer'}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'junegunn/fzf', run = vim.fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}





-- other testing
-- MARKS plugin and setting
paq {'chentau/marks.nvim'}
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}
-- mx              Set mark x
--    m,              Set the next available alphabetical (lowercase) mark
--    m;              Toggle the next available mark at the current line
--    dmx             Delete mark x
--    dm-             Delete all marks on the current line
--    dm<space>       Delete all marks in the current buffer
--    m]              Move to next mark
--    m[              Move to previous mark
--    m:              Preview mark. This will prompt you for a specific mark to
--                    preview; press <cr> to preview the next mark.
--                    
--    m[0-9]          Add a bookmark from bookmark group[0-9].
--    dm[0-9]         Delete all bookmarks from bookmark group[0-9].
--    m}              Move to the next bookmark having the same type as the bookmark under
--                    the cursor. Works across buffers.
--    m{              Move to the previous bookmark having the same type as the bookmark under
--                    the cursor. Works across buffers.
--    dm=             Delete the bookmark under the cursor.
--



-- REGISTER
paq "tversteeg/registers.nvim"


--shade inactiw windows
-- paq{'sunjon/shade.nvim'}
-- require'shade'.setup({
--   overlay_opacity = 50,
--   opacity_step = 1,
--   keys = {
--     brightness_up    = '<C-Up>',
--     brightness_down  = '<C-Down>',
--     toggle           = '<Leader>s',
--   }
-- })





--dim non active section of the code outside of the function or scope
paq {'folke/twilight.nvim'}
config = function()
    require("twilight").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      {
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      }
    }
  end




--color sceme
paq {'ghifarit53/tokyonight-vim'}

--dropdown auto complete menu at cursor
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = vim.fn['remote#host#UpdateRemotePlugins']}
vim.g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
