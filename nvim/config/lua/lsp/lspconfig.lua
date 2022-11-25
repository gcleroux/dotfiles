local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

lspconfig.sumneko_lua.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,

    settings = {
        Lua = {
            format = {
                enable = true,
                -- Put format options here
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                },
            },
            diagnostic = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
