vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.cmd("LspRestart pyright")
    vim.cmd("LspRestart pylsp")
  end,
  desc = "Restart Pyright and pylsp after saving a Python file",
})
