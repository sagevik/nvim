require "nvim-treesitter.configs".setup({
  ensure_installed = {
    "bash",
    "lua",
    "go",
    "python"
  },
  highlight = { enable = true },
})
