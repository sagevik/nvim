require("options")
require("keymap")
require("utils")
require("autocommands")

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
	change_detection = { enabled = false },
	-- require("plugins.autopairs"),
	require("plugins.blink-cmp"),
	require("plugins.colorscheme"),
	require("plugins.conform"),
	require("plugins.debug"),
	-- require("plugins.dressing"),
	require("plugins.fzf-lua"),
	-- require("plugins.gitsigns"),
	-- require("plugins.hardtime"),
	require("plugins.lazydev"),
	-- require("plugins.lint"),
	require("plugins.lsp"),
	-- require("plugins.lsp-signature"),
	-- require("plugins.mini"),
	-- require("plugins.neotree"),
	-- require("plugins.nvim-colorizer"),
	require("plugins.nvim-tresitter-textobjects"),
	require("plugins.nvim-tresitter"),
	require("plugins.oil"),
	-- require("plugins.peek"),
	-- require("plugins.render-markdown"),
	-- require("plugins.statusline"),
	-- require("plugins.undotree"),
	-- require("plugins.vim-tidal"),
	-- require("plugins.which-key"),
	-- require("plugins.windsurf"),
	-- require("plugins.zenmode"),
})
