local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself

    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
    use("windwp/nvim-autopairs") -- Make pairs of brackets, parentheses, etc. automatically
    use("kyazdani42/nvim-web-devicons") -- Nice dev icons used by many plugins
    use("akinsho/bufferline.nvim") -- Lua bufferline
    use("moll/vim-bbye") -- Closing windows without messing up the layout

    -- use("akinsho/toggleterm.nvim") -- Not sure I will keep the toggle terminal

    -- Debugger
    use("mfussenegger/nvim-dap")

    -- Tree-sitter
    use({
        "nvim-treesitter/nvim-treesitter", -- Neovim LSP server
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")

    -- Docstrings generator
    use({
        "danymat/neogen", -- Generate docstrings
        requires = { "nvim-treesitter/nvim-treesitter" },
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "stable"
    })

    -- Color schemes
    use("navarasu/onedark.nvim") -- Atom OneDark theme
    use("EdenEast/nightfox.nvim") -- Nightfox theme

    -- Git plugins
    use("lewis6991/gitsigns.nvim") -- Git annotations in the gutter
    use("kdheepak/lazygit.nvim") -- LazyGit neovim integration

    -- Using sudo from user session
    use("lambdalisue/suda.vim") -- Open/write files as root

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp") -- LSP completions

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("williamboman/mason.nvim") -- LSP plugin manager
    use("williamboman/mason-lspconfig.nvim") -- Integrates Mason with Nvim built-in LSP
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("jayp0521/mason-null-ls.nvim") -- Integrates Mason with Null-ls
    use("neovim/nvim-lspconfig") -- enable LSP
    use("b0o/schemastore.nvim") -- jsonls schemas for LSP server

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- CSV highlighting
    use("mechatroner/rainbow_csv")

    -- Lua line
    use({
        "nvim-lualine/lualine.nvim", -- Keeps open files in top menu bar
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Nvim tree
    use({
        "kyazdani42/nvim-tree.lua", -- File manager tree in nvim
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- Nvim surroung for easier bracket management
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- Comments plugin to allow vscode like line commenting
    use("terrortylor/nvim-comment") -- IDE like line commenting with shortcut

    -- Atom like multiple cursors
    use("mg979/vim-visual-multi") -- Atom multi cursor in vim

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim", -- Preview markdown files in web browser
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
