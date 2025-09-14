return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    local function on_attach(_, _)
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>hi", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    end

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local capabilities = nil

    lspconfig.lua_ls.setup({ on_attach = on_attach,capabilities = capabilities })
    lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      -- cmd = { "clangd", "--compile-commands-dir=./../build" },
    })
    lspconfig.cmake.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
  end,
}
