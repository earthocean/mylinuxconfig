return
{
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    keys = {
	    { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
	    { 'gd', vim.lsp.buf.definition, desc = 'Goto definition' },
	    { '<leader>gk', vim.lsp.buf.hover, desc = 'hover' },
        },
    dependencies = {
        	'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
        },
}
