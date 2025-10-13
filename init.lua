vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  -- Debug
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
  { src = "https://github.com/leoluz/nvim-dap-go" },
  -- Completion
  -- { src = "https://github.com/L3MON4D3/LuaSnip" },
  -- { src = "https://github.com/Saghen/blink.cmp" },
  -- { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require "mason".setup()

-- Colorscheme
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- LSP config
vim.lsp.enable({
  -- "basedpyright",
  "pyright",
  "bashls",
  "gopls",
  "lua_ls",
  -- "pylsp",
  "ruff"
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
})

require("keymaps")
require("autocommands")
