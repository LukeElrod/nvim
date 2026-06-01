return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = false,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = false,
					accept_word = false,
					accept_line = false,
					prev = "<A-[>",
					next = "<A-]>",
					dismiss = "<C-e>",
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function(_, opts)
			require("CopilotChat").setup(opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function(args)
					vim.treesitter.start(args.buf, "markdown")
				end,
			})
		end,
		opts = {
			highlight_headers = false,
			separator = "---",
			error_header = "> [!ERROR] Error",
			sticky = { "#buffer:active", "@file", "@glob", "@grep" },
			trusted_tools = { "file", "glob", "grep" },
			mappings = {
				show_help = {
					normal = "g?",
				},
			},
			headers = {
				user = " You",
				assistant = " Copilot",
				tool = " Tool",
			},
		},
	},
}
