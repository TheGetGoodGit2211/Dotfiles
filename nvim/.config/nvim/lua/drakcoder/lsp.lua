-- universal lsp configs
vim.lsp.config("*", {
  on_attach = function(_, _)
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>hi", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities()
})

-- enabling lsps
servers = require("drakcoder.servers")

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("pylsp")
