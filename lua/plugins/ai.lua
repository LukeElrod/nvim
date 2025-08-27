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
            window = {
                width = 0.4,
            },
        },
    },
    { "github/copilot.vim" }
}
