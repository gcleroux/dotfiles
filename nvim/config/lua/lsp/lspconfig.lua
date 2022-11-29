local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Use share on_attach/capabilities from handlers file
local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

-- Python LSP
lspconfig.jedi_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- Lua LSP
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                },
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
-- JSON LSP
lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})
-- Docker LSP
lspconfig.dockerls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- YAML LSP
lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
        },
    },
})
-- CPP LSP
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- Markdown LSP
lspconfig.marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- Bash LSP
lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- HTML LSP
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.taplo.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
