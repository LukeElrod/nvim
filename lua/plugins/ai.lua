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
}
