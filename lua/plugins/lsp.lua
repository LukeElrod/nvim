return {
    { 'neovim/nvim-lspconfig' },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            automatic_enable = {
                exclude = {
                    --needs external plugin
                    'jdtls'
                }
            }
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    { 'Decodetalkers/csharpls-extended-lsp.nvim' },
    { 'mfussenegger/nvim-jdtls' }
}
