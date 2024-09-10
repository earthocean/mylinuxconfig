return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    keys =
    {
        {"<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "toggle nvimtree"},
        {"<leader>tf", ":NvimTreeFocus<CR>", desc = "focus on tree"},
        {"<leader>tc", "<cmd>NvimTreeCollapse<CR>", desc = "collapse nvimtree"},
    },
    config = function()
        require("nvim-tree").setup{}
    end
}

