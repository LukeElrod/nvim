local defaults = {
	agent = "pi", -- command run in the agent terminal
}

local ok, user = pcall(require, "user_settings")
return vim.tbl_extend("force", defaults, ok and type(user) == "table" and user or {})
