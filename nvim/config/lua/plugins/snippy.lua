local snip_status_ok, snippy = pcall(require, "snippy")
if not snip_status_ok then
    return
end

snippy.setup({
    snippets_dirs = vim.fn.stdpath("config") .. "/snippets", -- custom snippets dir
})
