require("config.lazy")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.wo.number = true

-- Move line up (n)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
-- Move line down (n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- Move line up (v)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- Move line down (v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- esc to exit terminal insert mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]);
--netrc
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

--colorscheme
vim.cmd.colorscheme("rose-pine-moon")

