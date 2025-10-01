-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key (See `:help mapleader`)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- vim.keymap.set('n', "-", "<cmd>Oil --float<CR>", { desc="Open in Oil" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- vim.keymap.set("n", "<C-g>", "<Nop>", { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  See `:help wincmd` for a list of all window commands
--  Use CTRL+<hjkl> to switch between windows
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Switch buffer with shift + h/l
vim.keymap.set("n", "<leader>l", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>h", ":bprev<CR>", opts)

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- vim.keymap.set("n", "<leader>p", "<cmd>put<CR>", opts)
-- vim.keymap.set("n", "<leader>P", "<cmd>put!<CR>", opts)
vim.keymap.set("n", "bp", "<cmd>put<CR>", opts)
vim.keymap.set("n", "ap", "<cmd>put!<CR>", opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Jump and center
vim.keymap.set("n", "<C-o>", "<C-o>zz", opts)
vim.keymap.set("n", "<C-i>", "<C-i>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Move selected text up and down with shift + j/k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", opts)

-- Format buffer
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Clear stuck previews and restore LSP diagnostics
vim.keymap.set("n", "<leader>cp", function()
	vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
	vim.diagnostic.show(nil, 0, nil, { virtual_text = true })
end, { desc = "Clear stuck LSP previews and restore diagnostics" })

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "rounded",
		max_height = 20,
		max_width = 130,
		close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
	})
end)
