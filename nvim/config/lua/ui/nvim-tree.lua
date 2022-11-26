local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "h", action = "split" },
                { key = "C", action = "cd" },
                { key = "v", action = "vsplit" },
                { key = ".", action = "toggle_dotfiles" },
                { key = "i", action = "toggle_ignored" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "﯏",
                },
            },
        },
    },
    filters = {
        dotfiles = true,
    },
    git = {
        ignore = false, -- Show ignored files
    },
})
