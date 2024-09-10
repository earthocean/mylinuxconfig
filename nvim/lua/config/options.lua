-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local M = {}

-- vim.opt: :set
M.opt_o = {
    autowrite = false,
    confirm = true, -- confirm to save changes before exit

    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,

    -- wait to match keymap in ms
    timeout = true,
    timeoutlen = 500,

    number = true,
    relativenumber = true,

}

-- vim.g: :setglobal
M.opt_g = {
    mapleader = ' ',
}

-- stylua: ignore
function M.load_options()
	for k, v in pairs(M.opt_o) do vim.o[k] = v end
	for k, v in pairs(M.opt_g) do vim.g[k] = v end
end

return M

