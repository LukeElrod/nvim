local M = {}

function M:setup()
    local treesitter = require('nvim-treesitter')
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc", "cc", "cl" }
    treesitter.install { "c", "cpp", "c_sharp", "java", "javascript", "dart", "python", "html", "css", "kotlin", "bash", "cmake", "make", "php", "lua", "rust", "json", "go", "markdown", "markdown_inline", "csv", "diff", "dockerfile", "gitignore", "typescript", "yaml", "groovy" }

    vim.api.nvim_create_autocmd('FileType', {
        pattern = { "c", "cpp", "c_sharp", "java", "javascript", "dart", "python", "html", "css", "kotlin", "bash", "cmake", "make", "php", "lua", "rust", "json", "go", "markdown", "csv", "diff", "dockerfile", "gitignore", "typescript", "yaml", "groovy" },
        callback = function()
            -- syntax highlighting, provided by Neovim
            vim.treesitter.start()
            -- folds, provided by Neovim
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            -- indentation, provided by nvim-treesitter
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end

return M
