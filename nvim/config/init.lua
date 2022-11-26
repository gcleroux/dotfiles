-- Setup global config
require("globals")

-- Set up the colorscheme (comes before ui)
require("themes.nordfox")

-- Set up the UI
require("ui")

-- Plugins config
require("plugins")

-- Debuggers config
require("debuggers")

-- Set up LSP (Should be loaded last)
require("lsp")
