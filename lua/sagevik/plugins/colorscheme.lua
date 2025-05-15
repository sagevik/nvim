-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["colorscheme"] then
	return {}
end

return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				transparent = true,
			})
			vim.cmd("colorscheme kanagawa-dragon")
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
			})
			-- vim.cmd.colorscheme("vague")
			-- vim.cmd(":hi statusline guibg=NONE")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
}
