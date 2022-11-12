-- Setting the leader key to spacebar
vim.g.mapleader = " "

-- Functional wrapper for mapping custom keybindings
local function keymap(mode, lhs, rhs)
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- TODO: Refactor this file into a directory with 1 file per extension keymaps

------------------------------
--    General keybindings   --
------------------------------

-- Normal --
-- Better window navigation
keymap("n", "<leader>q", ":Bdelete<CR>")
keymap("n", "<leader>Q", ":bufdo bwipeout<CR>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Visual --
-- Stay in indent mode
keymap("v", "<S-Tab>", "<gv")
keymap("v", "<Tab>", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Visual --
-- Word manipulation
keymap("i", "<C-BS>", "<C-W>")

-- Navigation in insert mode
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")

-- Terminal --
-- Better terminal navigation (Not using this plugin anymore, maybe should be removed at some point)
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")
-- keymap("n", "<leader>`", ":ToggleTermToggleAll<CR>")

-- Telescope
keymap(
    "n",
    "<leader>f",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>")

-- Toggle file tree
keymap("n", "<leader>\\", ":NvimTreeToggle<CR>")

-- Toggle comments
keymap("n", "<leader>/", ":CommentToggle<CR>")
keymap("v", "<leader>/", ":'<,'>CommentToggle<CR>")
keymap("n", "<C-d>", ":call vm#commands#find_under(0, 1, 0, 1)<CR>")

-- Generate docstring
keymap("n", "<leader>doc", ":Neogen<CR>")

-- LSP keymaps
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>dg", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
keymap("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>')
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')

-- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>")

-- Gitsigns
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
keymap("n", "<leader>hn", ":Gitsigns next_hunk<CR>")
keymap("n", "<leader>hb", ":Gitsigns prev_hunk<CR>")
