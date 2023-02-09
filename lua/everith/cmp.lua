local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  print("CMP cant be imported")
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
  print("luasip cant be imported")
  return
end

local lspkind_ok, lspkind = pcall(require, "lspkind")
if not lspkind_ok then
  print("lspkind cant be imported")
  return
end

-- load frendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()
vim.opt.completeopt = "menu,menuone,noselect"

-- --   פּ ﯟ   some other good icons
-- local kind_icons = {
--   Text = "",
--   Method = "m",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- window.documentation = cmp.config.window.border()
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    -- true automatucly selects the furst item
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expandable() then
--         luasnip.expand()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    --format = function(entry, vim_item)
    --  -- Kind icons
    --  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
    --  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
    --  vim_item.menu = ({
    --    nvim_lsp = "[LSP]",
    --    nvim_lua = "[NVIM_LUA]",
    --    luasnip = "[Snippet]",
    --    buffer = "[Buffer]",
    --    path = "[Path]",
    --  })[entry.source.name]
    --  return vim_item
    --end,
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "..."
    })
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer", keyword_length = 4 },
    { name = "path" },
    { name = "calc" },
    { name = "rg", keyword_length = 4 },
  },
--   confirm_opts = {
--     behavior = cmp.ConfirmBehavior.Replace,
--     select = false,
--   },
--   experimental = {
--     ghost_text = false,
--     native_menu = false,
--   },
})
