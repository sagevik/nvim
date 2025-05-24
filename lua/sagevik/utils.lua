local M = {}

-- Function to get the current visual selection
function M.get_visual_selection()
	local mode = vim.api.nvim_get_mode().mode
	local opts = (mode == "v" or mode == "V" or mode == "\22") and { type = mode } or vim.empty_dict() -- \22 is the escaped version of ctrl-v
	local selection = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), opts)
	return selection
end

return M
