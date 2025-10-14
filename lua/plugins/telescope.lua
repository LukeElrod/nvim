return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    main = "telescope",
    opts = {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--no-ignore",
                "--fixed-strings"
            }
        },
        pickers = {
            find_files = {
                no_ignore_parent = true
            }
        }
    }
}
