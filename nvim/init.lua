-- Setup global config
require "globals"

-- Plugins config
require "plugins"

-- Set up the colorscheme
require "themes.onedark"

-- Set up LSP
require "lsp"

require('lspconfig').julials.setup{}
