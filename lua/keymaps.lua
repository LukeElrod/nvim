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
		})
	end
	return floating_terms[cmd]
end

vim.keymap.set({ "n", "t" }, "`", function()
	get_floating_term("opencode"):toggle()
end, { desc = "Toggle opencode floating terminal" })

--saving&quitting
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<F5>", ":wa<CR>")
vim.keymap.set("n", "<BS>", ":confirm bdelete<CR>")
vim.keymap.set("n", "<C-BS>", ":qa<CR>")

--copilot
--this is necessary to still allow default tab behavior when copilot suggestion is not visible
vim.keymap.set("i", "<Tab>", function()
	local copilot = require("copilot.suggestion")
	if copilot.is_visible() then
		copilot.accept_line()
	else
		return "\t"
	end
end, { expr = true })

--telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)
vim.keymap.set("n", "<leader>g", builtin.live_grep)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>n", require("telescope").extensions.notify.notify)

--harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>e", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-j>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-k>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-l>", function()
	harpoon:list():select(4)
end)

vim.keymap.set("n", "<C-,>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-.>", function()
	harpoon:list():next()
end)
