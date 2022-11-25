require("lsp.handlers").setup()

-- Formatters and linters
require("lsp.null-ls") -- Must be loaded before mason-null-ls
require("lsp.mason-null-ls")

-- LSP config
require("lsp.mason-lspconfig") -- Must be loaded before lsp.lspconfig

-- LSP can be configured with nvim LSP API directly, but I'm not sure which way is best
-- so this file is on stand-by until I develop a strong preference
-- require("lsp.lspconfig") -- Should be at the end on file
