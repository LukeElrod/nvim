vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd("only")
		vim.bo.buflisted = true
	end,
})
