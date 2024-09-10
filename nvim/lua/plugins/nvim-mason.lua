return
{
        {
            "williamboman/mason.nvim",
            config = function()
                    require("mason").setup({
                        ui = {
                            icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗",
                             }
                        }
                  })
            end
        },

        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
            },
            config = function()
                require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                    },
                }
                require("lspconfig").lua_ls.setup{
                    on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            settings ={
                            Lua = {
                                runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                    vim.env.VIMRUNTIME
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                                    },
                                diagnostics = { globals = { 'vim'} }
                                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        }
                })

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
                     end
                }
                require("lspconfig").clangd.setup{}
                require("lspconfig").pyright.setup{}
            end

        }
}

