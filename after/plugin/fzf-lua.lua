local map = vim.keymap.set

-- Function to get the current visual selection
local function get_visual_selection()
  local mode = vim.api.nvim_get_mode().mode
  local opts = (mode == "v" or mode == "V" or mode == "\22") and { type = mode } or
      vim.empty_dict() -- \22 is the escaped version of ctrl-v
  local selection = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), opts)
  return selection
end

require("fzf-lua").setup({
  defaults = {
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
  },
  grep = {
    rg_opts = "--smart-case --multiline --column",
    silent = true,
  },
})

map('n', '<leader><leader>', function() require "fzf-lua".buffers() end, { desc = "[F]ind open Buffers" })
map('n', '<leader>ff', function() require "fzf-lua".files() end, { desc = "[F]ind [F]Files" })
map('n', '<leader>fg', function() require "fzf-lua".live_grep() end, { desc = "[F]ind [G]rep" })
map('n', '<leader>fb', function() require "fzf-lua".builtin() end, { desc = "[F]ind [B]uiltin FZF" })
map('n', '<leader>fh', function() require "fzf-lua".helptags() end, { desc = "[F]ind [H]elp" })
map('n', '<leader>fk', function() require "fzf-lua".keymaps() end, { desc = "[F]ind [K]eymaps" })
map('n', '<leader>fd', function() require "fzf-lua".diagnostics_document() end, { desc = "[F]ind [D]iagnostics" })
map('n', '<leader>fD', function() require "fzf-lua".diagnostics_workspace() end, { desc = "[F]ind [D]iagnostics" })
map('n', '<leader>fr', function() require "fzf-lua".resume() end, { desc = "[F]ind [R]esume" })
map('n', '<leader>fo', function() require "fzf-lua".oldfiles() end, { desc = "[F]ind [O]ld Files" })
map('n', '<leader>/', function() require("fzf-lua").lgrep_curbuf() end,
  { desc = "[/] Live grep current buffer" })
map('n', '<leader>fc', function() require "fzf-lua".files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "[S]earch [N]eovim config" })
map({ 'n', 'v' }, '<leader>fw', function()
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
      local selection = get_visual_selection()
      require("fzf-lua").lgrep_curbuf({ search = selection[1] })
    else
      require("fzf-lua").grep_cword()
    end
  end,
  { desc = "[F]ind current [W]ord or selection (current buffer)" }
)
map({ 'n', 'v' }, '<leader>fW', function()
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
      local selection = get_visual_selection()
      require("fzf-lua").live_grep({ search = table.concat(selection, "\n") })
    else
      require("fzf-lua").grep_cWORD()
    end
  end,
  { desc = "[F]ind current [W]ORD or selection (current project)" }
)

-- LSP
map('n', 'grd', function() require("fzf-lua").lsp_definitions() end, { desc = "[G]oto [D]efinition" })
map('n', 'grr', function() require("fzf-lua").lsp_references() end, { desc = "[G]oto [R]eferences" })
-- Jump to the implementation of the word under your cursor.
map('n', "gri", function() require("fzf-lua").lsp_implementations() end, { desc = "[G]oto [I]mplementation" })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map('n', "grD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

map('n', "grt", function() require("fzf-lua").lsp_typedefs() end, { desc = "[G]oto [T]ype Definition" })

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map('n', "gO", function() require("fzf-lua").lsp_document_symbols() end, { desc = "[D]ocument [S]ymbols" })

map('n', "gW", function() require("fzf-lua").lsp_live_workspace_symbols() end, { desc = "[W]orkspace [S]ymbols" })
