vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client == nil then
            return
        end

        -- Disable semantic highlights
        client.server_capabilities.semanticTokensProvider = nil

        local opts = { buffer = event.buf }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
        vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
        vim.keymap.set('n', 'gs', builtin.lsp_workspace_symbols, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '=', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "g]", '<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>', opts)
        vim.keymap.set("n", "g[", '<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>', opts)
    end,
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                disable = {
                    "undefined-global",
                    "undefined-field"
                }
            },
        }
    }
})

vim.lsp.config('csharp_ls', {
    handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
        ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
    },
    on_attach = function(client)
        require("csharpls_extended").buf_read_cmd_bind()
    end
})

vim.lsp.config('dartls', {
    on_attach = function(client)
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
    settings = {
        dart = {
            lineLength = 160,
            showTodos = true
        }
    }
})

vim.lsp.config('ts_ls', {
    on_attach = function(client)
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end
})

vim.lsp.enable('dartls')
vim.lsp.enable('gdscript')

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function(args)
        require'jdtls.jdtls_setup'.setup()
    end
})
