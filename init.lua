require("config.lazy")

vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'

local function close_buffer()
    local bufferline = require("bufferline")
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = bufferline.get_elements().elements

    local is_tab = false
    for _, buf in ipairs(buffers) do
        if buf.id == current_buf then
            is_tab = true
            break
        end
    end

    if not is_tab then
        vim.cmd("bdelete")
        return
    end

    if #buffers > 1 then
        vim.cmd("confirm bdelete")
    end
end

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

vim.keymap.set("n", "<Tab>", function()
    require("oil").open()
end)

if vim.fn.has("mac") == 1 then
    vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { silent = true })
    vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { silent = true })
    vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true })
    vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true })
else
    -- Move line up in normal mode
    vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
    -- Move line down in normal mode
    vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })

    -- Move selection up in visual mode
    vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
    -- Move selection down in visual mode
    vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
end

--unhighlight
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })

--terminal
if vim.fn.has("mac") == 1 then
    vim.keymap.set("n", [[<C-\>]], ":terminal<CR>i")
else
    vim.keymap.set("n", [[<A-\>]], ":terminal<CR>i")
end
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

--saving&quitting
vim.keymap.set("n", "<F5>", ":w<CR>")
vim.keymap.set("n", "<F6>", ":wa<CR>")
vim.keymap.set("n", "<BS>", close_buffer)
vim.keymap.set("n", "<A-BS>", ":qa<CR>")

--bufferline
if vim.fn.has("mac") == 1 then
    vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>')
else
    vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>')
end

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
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})


local treesitter = require('treesitter.treesitter_setup')
treesitter.setup()
