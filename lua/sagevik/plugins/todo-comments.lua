-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["todo-comments"] then
	return {}
end

return {
	-- Highlight todo, notes, etc in comments
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
