return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- autocomplete do LSP
      "hrsh7th/cmp-buffer",      -- autocomplete do buffer atual
      "hrsh7th/cmp-path",        -- autocomplete de paths
      "hrsh7th/cmp-cmdline",     -- autocomplete no command line
      "L3MON4D3/LuaSnip",        -- engine de snippets
      "saadparwaiz1/cmp_luasnip",-- integra luasnip com cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"]   = cmp.mapping.select_prev_item(),
          ["<C-j>"]   = cmp.mapping.select_next_item(),
          ["<C-b>"]   = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]   = cmp.mapping.scroll_docs(4),
          ["<C-Space>"]= cmp.mapping.complete(),
          ["<C-e>"]   = cmp.mapping.abort(),
          ["<CR>"]    = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      -- autocomplete no command line (/ e ?)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      -- autocomplete no command line (:)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
  },
}
