return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	opts = function()
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_background = "soft"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
