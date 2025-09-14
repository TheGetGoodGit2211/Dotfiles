return {

  {
    "hrsh7th/nvim-cmp",

    config = function()
      local cmp = require("cmp")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({

        mapping = cmp.mapping.preset.insert({

          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {

          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "async_path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "saadparwaiz1/cmp_luasnip",
  "FelipeLema/cmp-async-path",
}
