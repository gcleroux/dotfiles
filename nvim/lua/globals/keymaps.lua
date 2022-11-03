-- Setting the leader key
vim.g.mapleader = " "

-- Functional wrapper for mapping custom keybindings
function keymap(mode, lhs, rhs)
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------
--    General keybindings   --
------------------------------

-- Normal --
-- Better window navigation
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
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")
keymap("n", "<leader>`", ":ToggleTermToggleAll<CR>")

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

-- Formatting documents
keymap("n", "<leader>F", ":Format<CR>")

keymap("n", "<leader>doc", ":Neogen<CR>")

-- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>")

-- Gitsigns
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
keymap("n", "<leader>hn", ":Gitsigns next_hunk<CR>")
keymap("n", "<leader>hb", ":Gitsigns prev_hunk<CR>")
