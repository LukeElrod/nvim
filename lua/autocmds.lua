local get_floating_term = require("keymaps").get_floating_term

--for auto reload file when ai makes an edit
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermLeave", "TermClose" }, {
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

--auto spawn terminal to avoid ~ map race condition
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		get_floating_term("pi"):spawn()
	end,
})
