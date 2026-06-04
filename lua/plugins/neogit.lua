return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"sindrets/diffview.nvim",
		"m00qek/baleia.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
