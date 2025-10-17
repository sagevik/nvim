-- Autocomplete
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
-- vim.cmd("set completeopt+=noselect")


-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  desc = "Format buffer before save",
})

-- Show function signature
vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    local params = vim.lsp.util.make_position_params(nil, "utf-16")
    vim.lsp.buf_request(0, "textDocument/signatureHelp", params, function(err, result)
      if err or not result or vim.fn.pumvisible() == 1 then return end
      vim.lsp.util.open_floating_preview(result.signatures[1].label and { result.signatures[1].label } or {}, "markdown")
    end)
  end,
})
