require("config.lazy")

local function close_window()
    local state = require('barbar.state')
    if #state.buffers > 1 then
        vim.cmd("confirm BufferClose")
    end
end

--disable netrrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.wo.relativenumber = true

vim.keymap.set("n", "<Tab>", function ()
   require("oil").open()
end)

-- Move line up in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
-- Move line down in normal mode
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

-- Move selection up in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
-- Move selection down in visual mode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

--unhighlight
vim.keymap.set("n", "<C-h>", ":noh<CR>", { silent = true })

--terminal
vim.keymap.set("n", [[<A-\>]], ":terminal<CR>i")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

--saving&quitting
vim.keymap.set("n", "<F5>", ":w<CR>")
vim.keymap.set("n", "<F6>", ":wa<CR>")
vim.keymap.set("n", "<BS>", close_window)
vim.keymap.set("n", "<A-BS>", ":qa<CR>")

--barbar
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>')

--copilot
vim.keymap.set({"n", "v"}, "~", ":CopilotChat<CR>")
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "copilot-chat",
    callback = function()
        vim.cmd("wincmd r")
    end,
})

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.opt.clipboard = 'unnamedplus'

local treesitter = require('treesitter.treesitter_setup')
treesitter.setup()
