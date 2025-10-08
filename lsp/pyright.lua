vim.lsp.config("pyright", {
  on_attach = {},
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'strict', --["off", "basic", "standard", "strict", "recommended", "all"]
      },
    },
  },
})
