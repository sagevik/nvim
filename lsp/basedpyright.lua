local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

vim.lsp.config("basedpyright", {
  capabilities = capabilities,
  on_attach = {},
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
        -- diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'strict', --["off", "basic", "standard", "strict", "recommended", "all"]
      },
    },
  },
})
