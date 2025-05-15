-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["dressing"] then
	return {}
end

return {
	"stevearc/dressing.nvim",
	opts = {},
}
