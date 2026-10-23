local defaults = {
	agent = "pi", -- command run in the agent terminal
	shell = "bash", -- default toggleterm shell
}

local ok, user = pcall(require, "user_settings")
return vim.tbl_extend("force", defaults, ok and type(user) == "table" and user or {})
