-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = { import = "sagevik.plugins" },
	change_detection = { enabled = false },
})

require("lazy").setup({
	require("autopairs"),
	require("blink-cmp"),
	require("colorscheme"),
	require("conform"),
	require("debug"),
	require("dressing"),
	require("fzf-lua"),
	require("gitsigns"),
	require("hardtime"),
	require("lazydev"),
	require("lint"),
	require("lsp"),
	require("mini"),
	require("neotree"),
	require("nvim-tresitter-textobjects"),
	require("nvim-tresitter"),
	require("oil"),
	require("peek"),
	require("project"),
	require("render-markdown"),
	require("statusline"),
	require("telescope"),
	require("todo-comments"),
	require("undotree"),
	require("vim-sleuth"),
	require("vim-tidal"),
	require("which-key"),
	require("windsurf"),
	require("zenmode"),
})
