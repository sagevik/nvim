-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["vim-sleuth"] then
	return {}
end

return {
	"tpope/vim-sleuth",
	-- No further initialization needed, as this is a real "vim" not a
	-- lua plugin
}
