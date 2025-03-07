return {
    { 'hrsh7th/nvim-cmp' },
    {
        'hrsh7th/cmp-nvim-lsp',
        opts = {
            sources = {
                { name = 'nvim_lua' }
            }
        }
    },
}
