local mason_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    return
end

-- local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
-- if not lsp_status_ok then
--     return
-- end

-- Use share on_attach/capabilities from handlers file
-- local on_attach = require("lsp.handlers").on_attach
-- local capabilities = require("lsp.handlers").capabilities

mason_lsp.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "dockerls",
        "html",
        "jsonls",
        "marksman",
        "pyright",
        "sqlls",
        "sumneko_lua",
        "taplo",
        "yamlls",
    },
})
