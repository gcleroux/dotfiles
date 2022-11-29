local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        -- Editor wide linter/formatting
        diagnostics.codespell,
        diagnostics.proselint,

        -- Python formatting
        formatting.isort,
        formatting.black.with({ extra_args = { "--fast", "--line-length", "88" } }),
        diagnostics.flake8.with({ extra_args = { "--max-line-length", "88" } }),
        diagnostics.pylint.with({ extra_args = { "--rcfile", ".pylintrc" } }),

        -- Lua formatting
        formatting.stylua,
        diagnostics.luacheck,

        -- C/C++/CS/CUDA formatting
        formatting.clang_format.with({ extra_args = { "--style", '"{BasedOnStyle: llvm, IndentWidth: 4}"' } }),
        diagnostics.cpplint,

        -- Markdown formatting
        formatting.markdown_toc,
        formatting.cbfmt,
        formatting.markdownlint,
        diagnostics.markdownlint,

        -- Shell formatting
        formatting.shfmt.with({ extra_args = { "--indent", "4" } }), -- Tab to space
        diagnostics.shellcheck,

        -- JSON formatting
        formatting.jq,

        -- Dockerfile
        diagnostics.hadolint,

        -- YAML formatting
        formatting.yamlfmt,
        diagnostics.yamllint,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
