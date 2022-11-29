local mason_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    return
end

mason_lsp.setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "dockerls",
        "html",
        "jedi_language_server",
        "jsonls",
        "marksman",
        "sumneko_lua",
        "taplo",
        "yamlls",
    },
})
