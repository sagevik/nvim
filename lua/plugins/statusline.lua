-- return {
-- 	"echasnovski/mini.statusline",
-- 	version = false,
-- 	opts = {},
-- }

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "vague",
		},
	},
}
