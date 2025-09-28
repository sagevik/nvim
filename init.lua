vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.swapfile = false

-- vim.keymap.set('n', '<leader>o', '<cmd>update<CR> <cmd>source<CR>')
-- vim.keymap.set('n', '<leader>w', '<cmd>write<CR>')
-- vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

-- require "nvim-lspconfig".setup()
require "mason".setup()
require "oil".setup()
vim.keymap.set('n', '-', ":Oil<CR>")
require "mini.pick".setup()
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "go", "python" },
	highlight = { enable = true },
})

vim.lsp.enable({ "lua_ls", "pyright", "gopls" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- auto complete
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
	virtual_text = true,
})


vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	-- pattern = "*.py",
	callback = function()
		vim.lsp.buf.format()
	end,
	desc = "Format buffer before save",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.py",
	callback = function()
		-- vim.lsp.buf.format()
		vim.cmd("LspRestart pyright")
		vim.cmd("LspRestart pylsp")
	end,
	desc = "Restart Pyright and pylsp after saving a Python file",
})

vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>')
