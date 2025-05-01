return {
	"rebelot/kanagawa.nvim",
	config=function()
		require('kanagawa').setup({
			compile=true,
			transparent = true,
		})
		vim.cmd("colorscheme kanagawa-dragon")
	end,
	build = function()
		vim.cmd("KanagawaCompile")
	end,
}
