return {

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "mrjones2014/nvim-ts-rainbow"
    },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({

        ensure_installed = { "lua", "cpp" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })

    end,
  },
}
