--KEYMAPS
vim.keymap.set("n", "<Tab>", function()
	require("oil").open()
end)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", "<Esc>", { noremap = true, silent = true })

--unhighlight
vim.keymap.set("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true })

--terminal
vim.keymap.set("t", "<S-Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local floating_terms = {}

local function get_floating_term(cmd)
	if not floating_terms[cmd] then
		floating_terms[cmd] = Terminal:new({
			cmd = cmd,
			direction = "float",
			hidden = true,
			highlights = {
				NormalFloat = {
					guibg = "#101014",
				},
				FloatBorder = {
					guifg = "#101014",
					guibg = "#101014",
				},
			},
		})
	end
	return floating_terms[cmd]
end

vim.keymap.set({ "n", "t" }, "`", function()
	get_floating_term("pi"):toggle()
end, { desc = "Toggle agent floating terminal" })

vim.keymap.set("v", "~", function()
	local selection = table.concat(
		vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getcurpos(), {
			type = vim.fn.mode(),
		}),
		"\n"
	)
	local term = get_floating_term("pi")
	term:open()
	-- Bracketed paste keeps the terminal UI from auto-indenting pasted lines.
	vim.api.nvim_chan_send(term.job_id, "\27[200~" .. selection .. "\27[201~")
end, { desc = "Ask agent about selection" })

--saving&quitting
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<F5>", ":wa<CR>")
vim.keymap.set("n", "<BS>", ":confirm bdelete<CR>")
vim.keymap.set("n", "<C-BS>", ":qa<CR>")

--fixes weird bug with copilot where it doesn't dismiss suggestions when using ctrl-c instead of esc
vim.keymap.set("i", "<C-C>", "<Esc>")

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>g", builtin.live_grep)
vim.keymap.set("n", "<leader>n", require("telescope").extensions.notify.notify)

--bufferline
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-j>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-k>", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>b", ":BufferLinePick<CR>")

return { get_floating_term = get_floating_term }
