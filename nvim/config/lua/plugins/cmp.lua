local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, snippy = pcall(require, "snippy")
if not snip_status_ok then
    return
end

local converter_status_ok, snippet_converter = pcall(require, "snippet_converter")
if not converter_status_ok then
    vim.notify("Plugin snippet_converter is missing")
    return
end

-- Create converter templates, separating makes it easier to debug with :ConvertSnippets
local friendly_snippets = {
    sources = {
        vscode = {
            "./friendly-snippets/snippets",
        },
    },
    output = {
        snipmate = {
            vim.fn.stdpath("data") .. "/site/snippets",
        },
    },
}
local custom_snippets = {
    sources = {
        vscode = {
            vim.fn.stdpath("config") .. "./snippets",
        },
    },
    output = {
        snipmate = {
            vim.fn.stdpath("data") .. "/site/snippets",
        },
    },
}

-- Converting snippets to snippy format
snippet_converter.setup({
    templates = { friendly_snippets, custom_snippets },
})

local has_words_before = function()
    -- TODO Switch to table.unpack after upgrading to debian 12 (if lua version >= 5.2)
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if snippy.can_jump(1) then
                    -- Advance takes over cmp-completions in snippets
                    snippy.next()
                else
                    cmp.select_next_item()
                end
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ["<C-j>"] = cmp.mapping.select_next_item(),
        -- ["<C-k>"] = cmp.mapping.select_prev_item(),

        -- ["<C-j>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     else
        --         fallback()
        --     end
        -- end),
        -- ["<C-k>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     else
        --         fallback()
        --     end
        -- end),

        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- If none selected, fallback to Enter
        ["<C-a>"] = cmp.mapping.complete(), -- Every cmp entry

        ["<Up>"] = cmp.mapping.scroll_docs(4),
        ["<Down>"] = cmp.mapping.scroll_docs(-4),

        ["<C-e>"] = cmp.mapping.abort(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
            vim_item.menu = ({
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "buffer" },
        { name = "path" },
    },
    windowdocumentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
})
