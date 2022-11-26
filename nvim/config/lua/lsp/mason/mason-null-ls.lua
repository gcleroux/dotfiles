local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {
        -- Linters
        "codespell",
        "cpplint",
        "flake8",
        "hadolint",
        "luacheck",
        "markdownlint",
        "pylint",
        "shellcheck",

        -- Formatting
        "black",
        "clang-format",
        "isort",
        "jq",
        "shfmt",
        "stylua",
        "yamlfmt",
    },
})
