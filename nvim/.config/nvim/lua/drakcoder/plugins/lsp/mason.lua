return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()

      vim.keymap.set("n", "<leader>ms", ":Mason<CR>")
    end,
  },
  {
    "williamboman/mason-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "clangd",
          -- "cmake",
          -- "html",
          -- "bashls",
          -- "jdtls"
        },
      })
    end,
  },
  "neovim/nvim-lspconfig",
}
