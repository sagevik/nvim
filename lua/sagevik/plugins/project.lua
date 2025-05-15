-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["project"] then
	return {}
end

return {
	"ahmedkhalf/project.nvim",
	init = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
