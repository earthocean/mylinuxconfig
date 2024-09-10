return
{
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies ={
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "TL file"},
        {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "TL grep"},
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "TL buffer"},
        {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "TL tags"},
    };
    opts = {
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
    },
}
