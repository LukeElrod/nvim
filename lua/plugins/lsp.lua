return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },
    },
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
}
