require "nvim-treesitter.configs".setup({
  ensure_installed = {
    "bash",
    "csv",
    "lua",
    "gitignore",
    "go",
    "python"
  },
  highlight = { enable = true },
})
