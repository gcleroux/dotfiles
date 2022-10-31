local status_ok, configs = pcall(require, "neogen")
if not status_ok then
  return
end

require('neogen').setup {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "emmylua" 
                }
        },
        python = {
            template = {
                annotation_convention = "google_docstrings"
            }
        }
    }
}
