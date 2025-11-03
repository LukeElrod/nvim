return {
    'stevearc/oil.nvim',
    main = "oil",
    opts = {
        use_default_keymaps = false,
        view_options = {
            show_hidden = true
        },
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-g>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-o>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["~"] = { "actions.cd", mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        }
    },
    lazy = false,
    priority = 900,
}
