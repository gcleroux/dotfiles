local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
    return
end

neogen.setup({
    snippet_engine = "snippy",
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "emmylua",
            },
        },
        python = {
            template = {
                annotation_convention = "google_docstrings",
            },
        },
    },
})
