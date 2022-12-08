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

        -- Python tools
        formatting.isort,
        formatting.black.with({ extra_args = { "--fast", "--line-length", "88" } }),
        diagnostics.flake8.with({ extra_args = { "--max-line-length", "88" } }),
        diagnostics.pylint.with({ extra_args = { "--disable", "F0401,C0301" } }),

        -- Lua tools
        formatting.stylua,
        diagnostics.luacheck,

        -- C/C++/CS/CUDA tools
        formatting.clang_format.with({ extra_args = { "--style", '"{BasedOnStyle: llvm, IndentWidth: 4}"' } }),
        diagnostics.cpplint,

        -- Markdown tools
        formatting.markdown_toc,
        formatting.cbfmt,
        diagnostics.markdownlint,

        -- Shell tools
        formatting.shfmt.with({ extra_args = { "--indent", "4" } }), -- Tab to space
        diagnostics.shellcheck,

        -- Dockerfile tools
        diagnostics.hadolint,

        -- JS, TS, JSON, YAML, HTML, CSS, Mardown, etc. tools
        formatting.prettierd,
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
