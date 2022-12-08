local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

local function getConfig(name)
  return string.format('require("everith/%s")', name)
end

-- #########################
-- Install your plugins here
-- #########################
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  -- NOTE: Packer plugin template
  -- -- use {
  -- --   'myusername/example',        -- The plugin location string
  -- --   -- The following keys are all optional
  -- --   disable = boolean,           -- Mark a plugin as inactive
  -- --   as = string,                 -- Specifies an alias under which to install the plugin
  -- --   installer = function,        -- Specifies custom installer. See "custom installers" below.
  -- --   updater = function,          -- Specifies custom updater. See "custom installers" below.
  -- --   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  -- --   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  -- --   opt = boolean,               -- Manually marks a plugin as optional.
  -- --   bufread = boolean,           -- Manually specifying if a plugin needs BufRead after being loaded
  -- --   branch = string,             -- Specifies a git branch to use
  -- --   tag = string,                -- Specifies a git tag to use. Supports '*' for "latest tag"
  -- --   commit = string,             -- Specifies a git commit to use
  -- --   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
  -- --   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  -- --   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  -- --   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  -- --   config = string or function, -- Specifies code to run after this plugin is loaded.
  -- --   -- The setup key implies opt = true
  -- --   setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- --   -- The following keys all imply lazy-loading and imply opt = true
  -- --   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  -- --   ft = string or list,         -- Specifies filetypes which load this plugin.
  -- --   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  -- --   event = string or list,      -- Specifies autocommand events which load this plugin.
  -- --   fn = string or list          -- Specifies functions which load this plugin.
  -- --   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  -- --   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
  -- --                                -- with one of these module names, the plugin will be loaded.
  -- --   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded.
  -- -- }

--   -- My plugins here
--  ################# IDE #################
--   --NOTE: LSP
   use({
     "williamboman/mason.nvim",
--     module = "mason-tool-installer",
     requires = {
       "williamboman/mason-lspconfig.nvim",
       --       universal installer not just LSP languages i think
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
     },
     config = getConfig("lsp.mason"),
   })
   use({
     "neovim/nvim-lspconfig",
     config = getConfig("lsp.lsp"),
   })
   --
   use({ "onsails/lspkind-nvim" })
   use({
     "jose-elias-alvarez/null-ls.nvim",
     requires = { { "nvim-lua/plenary.nvim" } },
     config = getConfig("lsp.null-ls"),
   })
   use({ "SmiteshP/nvim-navic" }) -- TODO: whai is this ? ???
--
   --NOTE: DEBUGING TTOLS
   use({
     "mfussenegger/nvim-dap",
--      config = getConfig("lsp/dap"),
     requires = {
       "mfussenegger/nvim-dap-python",
       "leoluz/nvim-dap-go",
       "rcarriga/nvim-dap-ui",
       "theHamsta/nvim-dap-virtual-text",
     },
   })

   --NOTE: GO
   use({
     "ray-x/go.nvim",
     requires = "ray-x/guihua.lua",
     config = getConfig("go"),
     ft = { "go" },
   })
--  ################# IDE #################
--
   use("tpope/vim-surround") -- Add surround functon to "S" in visual mode and more
   use({
     "windwp/nvim-autopairs",
     config = getConfig("nvim-autopairs"),
   })

   --NOTE: nvim-treesitter
   use({
     "nvim-treesitter/nvim-treesitter",
     config = getConfig("treesitter"),
     run = ":TSUpdate",
   })
   use({
     "nvim-treesitter/nvim-treesitter-textobjects",
     after = "nvim-treesitter",
   })
   use({
     "RRethy/nvim-treesitter-endwise",
     after = "nvim-treesitter",
   })
   use({
     "p00f/nvim-ts-rainbow",
     after = "nvim-treesitter",
   })

   --NOTE: Auto complete
   use({
     "hrsh7th/nvim-cmp",
     requires = {
       "hrsh7th/cmp-nvim-lsp",
       "hrsh7th/cmp-buffer",
       "hrsh7th/cmp-path",
       "hrsh7th/cmp-cmdline",
       "hrsh7th/cmp-calc",
       "lukas-reineke/cmp-rg",
       "hrsh7th/cmp-nvim-lsp-signature-help",
     },
     config = getConfig("cmp"),
   })
   use({ "rafamadriz/friendly-snippets" })
   use({
     "L3MON4D3/LuaSnip",
     requires = "saadparwaiz1/cmp_luasnip",
     config = getConfig("luasnip"),
   })

--   use({
--     "folke/neodev.nvim",
--     config = function()
--       require("neodev").setup()
--     end,
--     before = "nvim-lspconfig",
--   })
--
   --NOTE: FILE searching with telescope
   use({
     "nvim-telescope/telescope.nvim",
     requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
     cmd = "Telescope",
     module = "telescope",
     config = getConfig("telescope"),
   })
   -- Extensions:
   use({ "jvgrootveld/telescope-zoxide" })
   use({ "crispgm/telescope-heading.nvim" })
   use({ "nvim-telescope/telescope-symbols.nvim" })
   use({ "nvim-telescope/telescope-file-browser.nvim" })
   use({ "nvim-telescope/telescope-packer.nvim" })
   use({ "nvim-telescope/telescope-ui-select.nvim" })
   use({ "ptethng/telescope-makefile" })
--
--   --NPTE: GIT
--   use({
--     "TimUntersberger/neogit",
--     requires = {
--       "nvim-lua/plenary.nvim",
--       {
--         "sindrets/diffview.nvim",
--         cmd = {
--           "DiffviewOpen",
--           "DiffviewClose",
--           "DiffviewToggleFiles",
--           "DiffviewFocusFiles",
--         },
--         config = get_config("git.diffview"),
--       },
--     },
--     module = "neogit",
--     config = get_config("git.neogit"),
--   })
--   use({
--     "lewis6991/gitsigns.nvim",
--     requires = { "nvim-lua/plenary.nvim" },
--     config = get_config("git.gitsigns"),
--   })
--   use({ "tpope/vim-fugitive" }) -- yeah this is not lua but one of the best Vim plugins ever
--
--   --NOTE: RICE
   use({
     "folke/todo-comments.nvim",
     requires = "nvim-lua/plenary.nvim",
     config = getConfig("todo"),
   })
--   use({
--     "LudoPinelli/comment-box.nvim",
--     cmd = "CB*",
--     config = get_config("comment-box"),
--   })
--   use({
--     "https://gitlab.com/yorickpeterse/nvim-pqf.git",
--     config = function()
--       require("pqf").setup()
--     end,
--   })
--   use({ "vimpostor/vim-tpipeline" }) -- tmux status line union with nvim statusline
   use({
     "folke/noice.nvim",
     event = "VimEnter",
     config = getConfig("noice"),
     requires = {
       "MunifTanjim/nui.nvim",
       {
         "rcarriga/nvim-notify",
         config = getConfig("notify"),
       },
     },
   })
   use("ghifarit53/tokyonight-vim")
--
   use({ "folke/which-key.nvim", config = getConfig("which-key") })
--
--   --TODO: need place
   use({
     "anuvyklack/windows.nvim",
     event = "VimEnter",
     requires = {
       "anuvyklack/middleclass",
       "anuvyklack/animation.nvim",
     },
     config = getConfig("windows"),
   })
   use({ "tweekmonster/startuptime.vim" })
   use({
     "nvim-neo-tree/neo-tree.nvim",
     branch = "v2.x",
     -- cmd = "NeoTree*",
     requires = {
       {
         "s1n7ax/nvim-window-picker", -- only needed if you want to use the commands with "_with_window_picker" suffix
         config = getConfig("window-picker"),
       },
       "nvim-lua/plenary.nvim",
       "kyazdani42/nvim-web-devicons",
       "MunifTanjim/nui.nvim",
     },
     config = getConfig("neotree"),
   })
--   use({
--     "kevinhwang91/nvim-bqf",
--     requires = {
--       "junegunn/fzf",
--       module = "nvim-bqf",
--     },
--     ft = "qf",
--     config = get_config("nvim-bqf"),
--   })
--   use({
--     "lukas-reineke/indent-blankline.nvim",
--     event = "BufReadPre",
--     config = get_config("indent-blankline"),
--   })
--
--   -- WARN:  needs trying
--   --   use({ "rhysd/vim-grammarous", ft = { "markdown", "latex" }, config = get_config("grammarous") })
--   --   use({ "echasnovski/mini.nvim", branch = "main", config = get_config("mini") })
--   --   use({ "axieax/urlview.nvim", cmd = "Urlview", config = get_config("urlview") })
--   --   use({ "famiu/bufdelete.nvim" })
--   --
--   --   use({ "mfussenegger/nvim-ts-hint-textobject" })
--   --   use({
--   --     "windwp/nvim-ts-autotag",
--   --     config = function()
--   --       require("nvim-ts-autotag").setup()
--   --     end,
--   --   })
--   --   use({
--   --     "ironhouzi/starlite-nvim",
--   --     config = get_config("starlite-nvim"),
--   --   })
--   --
--   --   use({ "numToStr/Navigator.nvim", config = get_config("navigator") })
--   --
--   -- --   use({
--   -- --     "kevinhwang91/nvim-ufo",
--   -- --     requires = "kevinhwang91/promise-async",
--   -- --     config = function()
--   -- --       require("ufo").setup()
--   -- --     end,
--   -- --   })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
