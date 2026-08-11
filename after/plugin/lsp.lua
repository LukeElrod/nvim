vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client == nil or client.name == "copilot" then
			return
		end

		local opts = { buffer = event.buf }
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
		vim.keymap.set("n", "gr", builtin.lsp_references, opts)
		vim.keymap.set("n", "gs", builtin.lsp_dynamic_workspace_symbols, opts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "x" }, "=", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", opts)
		vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>", opts)
	end,
})

vim.lsp.config("dartls", {
	on_attach = function(client, bufnr)
		vim.bo[bufnr].tabstop = 2
		vim.bo[bufnr].shiftwidth = 2
		vim.bo[bufnr].softtabstop = 2
	end,
	settings = {
		dart = {
			lineLength = 160,
			showTodos = true,
		},
	},
})

vim.lsp.config("ts_ls", {
	on_attach = function(client, bufnr)
		vim.bo[bufnr].tabstop = 2
		vim.bo[bufnr].shiftwidth = 2
		vim.bo[bufnr].softtabstop = 2
	end,
})

vim.lsp.config("roslyn_ls", {
	cmd = {
		"dotnet",
		vim.uv.os_homedir()
			.. "/.local/share/nvim/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer.dll",
		"--logLevel", -- this property is required by the server
		"Information",
		"--extensionLogDirectory", -- this property is required by the server
		vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
		"--stdio",
	},
})

vim.lsp.enable("dartls")
vim.lsp.enable("gdscript")
vim.lsp.enable("roslyn_ls")
