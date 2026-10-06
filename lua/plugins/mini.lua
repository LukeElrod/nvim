return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.pairs").setup()
		local files = require("mini.files")

		local minifiles_toggle = function()
			local path = vim.api.nvim_buf_get_name(0)
			if files.close() ~= nil then
				return
			end

			if path == "" or vim.uv.fs_stat(path) == nil then
				path = nil
			end
			files.open(path, false)
		end

		files.setup({
			options = {
				use_as_default_explorer = true,
			},
			mappings = {
				mark_set = "",
				go_in = "L",
				go_in_plus = "l",
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesWindowUpdate",
			callback = function(args)
				vim.wo[args.data.win_id].number = true
				vim.wo[args.data.win_id].relativenumber = true
			end,
		})

		vim.keymap.set("n", "<Tab>", minifiles_toggle, { desc = "Toggle file tree" })
	end,
}
