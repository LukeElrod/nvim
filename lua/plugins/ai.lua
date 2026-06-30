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
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = os.getenv("CLAUDE_CODE_OAUTH_TOKEN"),
							},
						})
					end,
				},
			},
			interactions = {
				inline = {
					adapter = {
						name = "copilot",
						model = "gpt-5.3-codex",
					},
				},
				chat = {
					adapter = {
						name = "claude_code",
					},
					tools = {
						["file_search"] = {
							opts = {
								require_approval_before = false,
							},
						},
						["get_changed_files"] = {
							opts = {
								require_approval_before = false,
							},
						},
						["get_diagnostics"] = {
							opts = {
								require_approval_before = false,
							},
						},
						["grep_search"] = {
							opts = {
								require_approval_before = false,
							},
						},
						["read_file"] = {
							opts = {
								require_approval_before = false,
							},
						},
						opts = {
							default_tools = {
								"file_search",
								"get_changed_files",
								"get_diagnostics",
								"grep_search",
								"read_file",
							},
						},
					},
				},
			},
			display = {
				chat = {
					window = {
						width = 0.5,
						position = "right",
					},
				},
			},
		},
	},
}
