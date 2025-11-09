vim.opt.winborder = "rounded"
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

vim.opt.hlsearch = false      -- Set highlight on search
vim.opt.number = true         -- Make line numbers default
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.mouse = "a"           -- Enable mouse mode
vim.opt.breakindent = true    -- Enable break indent
vim.opt.swapfile = false      -- creates a swapfile
vim.opt.undofile = true       -- Save undo history
vim.opt.ignorecase = true     -- Case-insensitive searching UNLESS \C or capital in search
vim.opt.smartcase = true      -- smart case
vim.opt.signcolumn = "yes"    -- Keep signcolumn on by default
vim.opt.updatetime = 250      -- Decrease update time
-- vim.opt.timeoutlen = 300      -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.backup = false -- creates a backup file
-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.termguicolors = true             -- set termguicolors to enable highlight groups
-- vim.opt.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line
vim.opt.wrap = false                     -- display lines as one long line
vim.opt.linebreak = true                 -- companion to wrap don't split words
vim.opt.scrolloff = 4                    -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.numberwidth = 2                  -- set number column width to 2 {default 4}
vim.opt.shiftwidth = 2                   -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                      -- insert n spaces for a tab
vim.opt.softtabstop = 2                  -- Number of spaces that a tab counts for while performing editing operations
vim.opt.expandtab = true                 -- convert tabs to spaces
vim.opt.cursorline = true                -- highlight the current line
vim.opt.splitbelow = true                -- force all horizontal splits to go below current window
vim.opt.splitright = true                -- force all vertical splits to go to the right of current window
vim.opt.smarttab = true
vim.opt.smartindent = true               -- make indenting smarter again
-- vim.opt.showmode = false   -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 2 -- always show tabs
-- vim.opt.backspace = "indent,eol,start" -- allow backspace on
-- vim.opt.pumheight = 10 -- pop up menu height
vim.opt.conceallevel = 0       -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.cmdheight = 1          -- more space in the neovim command line for displaying messages
vim.opt.autoindent = true      -- copy indent from current line when starting new one
-- vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
-- vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
-- vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
-- vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

-- VimWiki
-- vim.cmd('set nocompatible') -- redundant should be enabled in Neovim by default
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

vim.g.vimwiki_list = {
  {
    path = "~/dox/vimwiki/",
    syntax = "default",
    ext = ".wiki",
    index = "index",
  },
  -- Optional: add more wikis
  -- {
  -- path = "~/some/other/wiki/",
  -- syntax = "markdown",
  -- ext = ".md",
  -- },
}
vim.g.vimwiki_global_ext = 1 -- apply wiki syntax to all files with .wiki/.md
