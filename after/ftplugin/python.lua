vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	callback = function()
		-- vim.lsp.buf.format()
		vim.cmd("LspRestart pyright")
		vim.cmd("LspRestart pylsp")
	end,
	desc = "Restart Pyright and pylsp after saving a Python file",
})

vim.api.nvim_create_augroup("ruff_organize_imports", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "ruff_organize_imports",
	pattern = "*.py",
	callback = function()
		vim.fn.execute("silent !ruff check --fix --select I %")
	end,
})
