require("config.lazy")

local function nvim_tree_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<BS>', api.tree.close, opts('Close'))
end


local function close_window()
    local state = require('barbar.state')
    if #state.buffers > 1 then
        vim.cmd("confirm BufferClose")
    end
end

--disable netrrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
    on_attach = nvim_tree_attach,
    filters = {
        enable = false
    },
})

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.wo.relativenumber = true

-- Move line up in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
-- Move line down in normal mode
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

-- Move selection up in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
-- Move selection down in visual mode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
--nvim-tree
vim.keymap.set("n", "<Tab>", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<S-Tab>", ":NvimTreeFindFile<CR>")

--unhighlight
vim.keymap.set("n", "<C-h>", ":noh<CR>", { silent = true })

--terminal
vim.keymap.set("n", [[<C-\>]], ":terminal<CR>i")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

--saving&quitting
vim.keymap.set("n", "<F5>", ":w<CR>")
vim.keymap.set("n", "<F6>", ":wa<CR>")
vim.keymap.set("n", "<BS>", close_window)
vim.keymap.set("n", "<C-BS>", ":qa<CR>")

--barbar
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>')

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.opt.clipboard = 'unnamedplus'

local treesitter = require('treesitter.treesitter_setup')
treesitter.setup()
