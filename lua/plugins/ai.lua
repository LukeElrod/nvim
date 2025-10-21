return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        opts = {
            highlight_headers = false,
            separator = '---',
            error_header = '> [!ERROR] Error',
            mappings = {
                complete = {
                    --still use tab for copilot chat, this is just so it doesn't conflict with copilot.vim
                    insert = '<S-Tab>',
                },
                show_help = {
                    normal = 'g?',
                }
            },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            panel = {
                enabled = false
            },
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = false,
                    accept_word = false,
                    accept_line = "<Tab>",
                    prev = "<A-[>",
                    next = "<A-]>",
                    dismiss = "<C-e>",
                },
            },
        }
    }
}
