vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local disable_capabilities = function(client, bufnr)
  client.server_capabilities.referencesProvider = false
  client.server_capabilities.renameProvider = false
  client.server_capabilities.documentSymbolProvider = false
  client.server_capabilities.typeDefinitionProvider = false
  client.server_capabilities.diagnosticProvider = false
end

vim.lsp.config("pylsp", {
  on_attach = {
    disable_capabilities,
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = { "E203", "W503" },
          maxLineLength = 120,
        },
        pyflakes = { enabled = false },
        flake8 = { enabled = false },
        pylint = { enabled = false },
        rope_autoimport = { enabled = true },
        rope_completion = { enabled = false },
        jedi_completion = { enabled = false },
        jedi_definition = { enabled = false },
      },
    },
  },
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.py",
--   callback = function()
--     vim.cmd("LspRestart basedpyright")
--     vim.cmd("LspRestart pylsp")
--   end,
--   desc = "Restart Pyright and pylsp after saving a Python file",
-- })
--
-- vim.api.nvim_create_augroup("ruff_organize_imports", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  -- group = "ruff_organize_imports",
  pattern = "*.py",
  callback = function()
    vim.fn.execute("silent !ruff check --fix --select I %")
  end,
})
