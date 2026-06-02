return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	main = "telescope",
	opts = {
		defaults = {
			layout_config = {
				width = 0.95,
				height = 0.85,
			},
			path_display = {
				"filename_first",
			},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--no-ignore",
				"--fixed-strings",
			},
		},
		pickers = {
			find_files = {
				no_ignore_parent = true,
			},
		},
	},
	--monkeypatch for jdtls
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		local utils = require("telescope.utils")
		local orig_is_uri = utils.is_uri
		utils.is_uri = function(filename)
			if filename:match("^jdt://") then
				return false
			end
			return orig_is_uri(filename)
		end
	end,
}
