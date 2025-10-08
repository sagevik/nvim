local disable_capabilities = function(client, bufnr)
  client.server_capabilities.referencesProvider = false
  client.server_capabilities.renameProvider = false
  client.server_capabilities.documentSymbolProvider = false
  client.server_capabilities.typeDefinitionProvider = false
  client.server_capabilities.diagnosticProvider = false
  client.server_capabilities.hoverProvider = false
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
