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
    vim.hl.on_yank({ timeout = 300, visual = true })
  end,
})

-- Open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Auto resize splits when resizing terminal window
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- No auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("NoAutoComment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
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
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local supports_signature = false
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/signatureHelp", { bufnr = bufnr }) then
        supports_signature = true
        break
      end
    end
    if not supports_signature then return end

    local params = vim.lsp.util.make_position_params(nil, "utf-16")
    vim.lsp.buf_request(0, "textDocument/signatureHelp", params, function(err, result)
      if err or not result or vim.fn.pumvisible() == 1 then return end
      vim.lsp.util.open_floating_preview(result.signatures[1].label and { result.signatures[1].label } or {}, "markdown")
    end)
  end,
})

-- Show cursorline only in active window enable
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("ActiveCursorline", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

-- Show cursorline only in active window disable
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = "ActiveCursorline",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- IDE like highlight when stopping cursor
-- vim.api.nvim_create_autocmd("CursorMoved", {
--   group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
--   desc = "Highlight references under cursor",
--   callback = function()
--     -- Only run if the cursor is not in insert mode
--     if vim.fn.mode() ~= "i" then
--       local clients = vim.lsp.get_clients({ bufnr = 0 })
--       local supports_highlight = false
--       for _, client in ipairs(clients) do
--         if client.server_capabilities.documentHighlightProvider then
--           supports_highlight = true
--           break -- Found supporting client, not need to check others
--         end
--       end
--
--       if supports_highlight then
--         vim.lsp.buf.clear_references()
--         vim.lsp.buf.document_highlight()
--       end
--     end
--   end,
-- })
--
-- -- IDE like highlight when stopping cursor
-- vim.api.nvim_create_autocmd("CursorMovedI", {
--   group = "LspReferenceHighlight",
--   desc = "Clear highlights when entering insert mode",
--   callback = function()
--     vim.lsp.buf.clear_references()
--   end,
-- })
