-- Setup global config
require("globals")

-- Set up the colorscheme
require("themes.nordfox")

-- Plugins config
require("plugins")

-- Set up LSP (Should always be loaded after plugins)
require("lsp")
