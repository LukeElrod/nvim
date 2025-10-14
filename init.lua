require("config.lazy")

vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'

--help files open in full window and are listed in buffer elements
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.cmd("only")
        vim.bo.buflisted = true
    end
})

--disable netrrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.wo.relativenumber = true

--KEYMAPS
vim.keymap.set("n", "<Tab>", function()
    require("oil").open()
end)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

--unhighlight
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })

--terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

--saving&quitting
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<F5>", ":wa<CR>")
vim.keymap.set("n", "<BS>", ":confirm bdelete<CR>")
vim.keymap.set("n", "<C-BS>", ":qa<CR>")


--copilot
vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)')
vim.keymap.set({ "n", "v" }, "~", ":CopilotChat<CR>")
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "copilot-chat",
    callback = function()
        vim.cmd("wincmd r")
    end,
})

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

--harpoon
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-,>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-.>", function() harpoon:list():next() end)

local treesitter = require('treesitter.treesitter_setup')
treesitter.setup()
