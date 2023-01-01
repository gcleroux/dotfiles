-- Plugins config
require("plugins")

-- Setup global config
require("globals")

-- Set up the colorscheme (comes before ui)
require("themes.onenord")

-- Set up the UI
require("ui")

-- Debuggers config
require("debuggers")

-- Set up LSP (Should be loaded last)
require("lsp")
