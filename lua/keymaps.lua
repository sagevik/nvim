-- keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "bp", "<cmd>put<CR>", opts)
vim.keymap.set("n", "ap", "<cmd>put!<CR>", opts)

--  Use CTRL+<hjkl> to switch between windows
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Navigate quickfix list
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')

-- vim.keymap.set('n', '<leader>o', '<cmd>update<CR> <cmd>source<CR>')
-- vim.keymap.set('n', '<leader>w', '<cmd>write<CR>')
-- vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>')

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>E', ":Oil --float<CR>")

vim.keymap.set("n", "<leader>a",
  function() vim.fn.setqflist({ { filename = vim.fn.expand("%"), lnum = 1, col = 1, text = vim.fn.expand("%"), } }, "a") end,
  { desc = "Add current file to QuickFix" })

vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- vim.keymap.set("n", "<C-g>", "<Nop>", { silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>q", function() require "fzf-lua".diagnostics_document() end,
  { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>Q", function() require "fzf-lua".diagnostics_workspace() end,
  { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Switch buffer with shift + h/l
vim.keymap.set("n", "<leader>l", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>h", ":bprev<CR>", opts)

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

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

-- Resize buffer windows
-- vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<M-k>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<M-j>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<M-h>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Move selected text up and down with shift + j/k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Show LSP function signature" })

-- Harpoon alternative builtin
local function set_arg_position(pos)
  local current = vim.fn.expand("%")
  if current == "" then return end -- Bail if no file

  -- Remove current if it exists anywhere
  vim.cmd("silent! argdelete " .. current)

  local argc = vim.fn.argc()

  -- Remove existing at pos if it exists
  if argc >= pos then
    vim.cmd(pos .. "argdelete")
  end

  -- Insert at pos (after pos-1)
  local insert_pos = pos - 1
  vim.cmd(insert_pos .. "argadd " .. current)

  -- Enforce max 4 (trim end if exceeded, though unlikely)
  argc = vim.fn.argc()
  while argc > 4 do
    vim.cmd("lastargdelete")
    argc = argc - 1
  end
end

vim.keymap.set("n", "<leader>ah", function() set_arg_position(1) end)
vim.keymap.set("n", "<leader>aj", function() set_arg_position(2) end)
vim.keymap.set("n", "<leader>ak", function() set_arg_position(3) end)
vim.keymap.set("n", "<leader>al", function() set_arg_position(4) end)

vim.keymap.set("n", "<leader>a", function()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
end)

vim.keymap.set("n", "<leader>e", function()
  vim.cmd.args()
end)

vim.keymap.set("n", "<M-h>", function()
  vim.cmd("silent! 1argument")
end)

vim.keymap.set("n", "<M-j>", function()
  vim.cmd("silent! 2argument")
end)

vim.keymap.set("n", "<M-k>", function()
  vim.cmd("silent! 3argument")
end)

vim.keymap.set("n", "<M-l>", function()
  vim.cmd("silent! 4argument")
end)
