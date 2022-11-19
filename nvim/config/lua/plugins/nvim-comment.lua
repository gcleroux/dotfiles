local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
    return
end

nvim_comment.setup({
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- trim empty comment whitespace
    comment_empty_trim_whitespace = true,
    -- Should key mappings be created
    create_mappings = false,
})
