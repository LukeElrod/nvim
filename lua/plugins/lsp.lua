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
    { 'Decodetalkers/csharpls-extended-lsp.nvim' },
    { 'mfussenegger/nvim-jdtls' },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {
            file_types = { 'markdown', 'copilot-chat' },
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        'Tyrannican/warcraft-api.nvim',
        ft = "lua",
        opts = {},
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
}
