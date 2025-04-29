return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("kanagawa").setup({
				transparent = true,
				styles = {
					comments = { italic = false },
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("kanagawa-dragon")
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
