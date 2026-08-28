local get_floating_term = require("keymaps").get_floating_term
local nvim_treesitter = require("nvim-treesitter")

--for auto reload file when ai makes an edit
vim.api.nvim_create_autocmd({ "TermLeave" }, {
	pattern = "*",
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("only")
		vim.bo.buflisted = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local available_parsers = nvim_treesitter.get_available()
		local installed_parsers = nvim_treesitter.get_installed()
		local parser = vim.treesitter.language.get_lang(vim.bo.filetype)
		local available = vim.tbl_contains(available_parsers, parser)
		local installed = vim.tbl_contains(installed_parsers, parser)
		if available and installed then
			vim.treesitter.start()
		elseif available and not installed then
			nvim_treesitter.install(parser)
		end
	end,
})

--auto spawn terminal to avoid ~ map race condition
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		get_floating_term("pi"):spawn()
	end,
})
