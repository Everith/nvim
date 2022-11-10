local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- #########################
-- Install your plugins here
-- #########################
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "p00f/nvim-ts-rainbow" -- Adds color codes to ( )
  use "tpope/vim-surround" -- Add surround functon to "S" in visual mode and more 

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim' -- Image viwer on linux 

  -- Treesitter adds colors to code
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
-- 
--   -- STATUS LINE
--   use "NTBBloodbath/galaxyline.nvim" -- status line
--   use "kyazdani42/nvim-web-devicons" -- devicons for galaxy-line
-- 
--   --GIT PLUGIN
--   use "tpope/vim-fugitive"
-----------------------------------------------------------------------
-- 
--   --testing
--   use "chentau/marks.nvim"
--   use "tversteeg/registers.nvim"
--   use "iamcco/markdown-preview.nvim" --for .md files aka readme
--   use "xiyaowong/nvim-transparent" --transparency for neovim
  use {
    "folke/twilight.nvim", -- dim out of scope sections of code
    config = function()
        require("twilight").setup{
                -- configuration here
                dimming = {
                    alpha = 0.25,
                    -- color = {"Normal", "#ffffff"},
                    inactive = false,
                },
                context = 10, -- highlight this many lines around cursore
                treesitter = true, -- use treshitter when avaliable
                expand = { -- for treeshitter to expand highlith for these types with no limit of line size ?
                    "function",
                    "method",
                    "table",
                    "if_statement",
                }
            }
        -- exclude = {} -- exclude these file types
    end,
    }

    --   use "norcalli/nvim-colorizer.lua" -- color code highlight for css or alike
    --   use "sunjon/Shade.nvim" -- focus on curent window

  --THEMES
  use "ghifarit53/tokyonight-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
