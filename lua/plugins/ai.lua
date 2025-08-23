return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        opts = {
            window = {
                layout = 'float',
                width = 160,         -- Fixed width in columns
                height = 40,        -- Fixed height in rows
                border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
                title = '🤖 AI Assistant',
                zindex = 100,       -- Ensure window stays on top
            },

            headers = {
                user = '👤 You: ',
                assistant = '🤖 Copilot: ',
                tool = '🔧 Tool: ',
            },
            show_folds = false,
            highlight_headers = false,
            separator = '---',
            error_header = '> [!ERROR] Error',
            mappings = {
                show_help = {
                    normal = 'g?',
                }
            }
        },
    },
    { "github/copilot.vim" }
}
