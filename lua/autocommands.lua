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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		vim.lsp.buf.format()
	end,
	desc = "Format buffer before save",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	callback = function()
		vim.lsp.buf.format()
		vim.cmd("LspRestart pyright")
		vim.cmd("LspRestart pylsp")
	end,
	desc = "Restart Pyright and pylsp after saving a Python file",
})
