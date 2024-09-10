return
{
    "iamcco/markdown-preview.nvim",

    keys =
    {
        {"<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview toggle"},
    },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function() vim.fn["mkdp#util#install"]() end,

}
