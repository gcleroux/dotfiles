local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

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
        "markdownlint",
        "pylint",
        "selene",
        "shellcheck",

        -- Formatting
        "beautysh",
        "black",
        "clang-format",
        "isort",
        "jq",
        "shfmt",
        "stylua",
        "yamlfmt",
    },
})

mason_null_ls.setup_handlers({
    function(source_name, methods)
        -- all sources with no handler get passed here
        -- Keep original functionality of `automatic_setup = true`
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
    stylua = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    -- jq = function(source_name, methods)
    --   null_ls.register(null_ls.builtins.formatting.jq)
    -- end
})
