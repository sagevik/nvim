-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["undotree"] then
	return {}
end

return {
	"mbbill/undotree",
	vim.keymap.set("n", "<leader>u", vim.cmd.undotreetoggle),
}
