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

vim.g.enabled_plugins = {
	["autopairs"] = true,
	["blink-cmp"] = true,
	["colorscheme"] = true,
	["conform"] = true,
	["debug"] = true,
	["dressing"] = true,
	["fzf-lua"] = true,
	["gitsigns"] = true,
	["lazydev"] = true,
	["lint"] = true,
	["lsp"] = true,
	["mini"] = true,
	["neotree"] = true,
	["nvim-tresitter-textobjects"] = true,
	["nvim-tresitter"] = true,
	["oil"] = true,
	["peek"] = true,
	["project"] = true,
	["render-markdown"] = true,
	["statusline"] = true,
	["todo-comments"] = true,
	["undotree"] = true,
	["vim-sleuth"] = true,
	["vim-tidal"] = true,
	["which-key"] = true,
	["windsurf"] = true,
	["zenmode"] = true,
}

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
