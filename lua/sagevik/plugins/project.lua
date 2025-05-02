local enabled = false
if enabled then
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
else
	return {}
end
