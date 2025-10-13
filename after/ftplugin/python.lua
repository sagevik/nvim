vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

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
    vim.fn.execute("silent !ruff check --fix --select I --line-length 120 %")
  end,
})

-- Toggle or select settings for basedpyright
-- local fzf = require("fzf-lua")
--
-- local type_checking_modes = {
--   "off",
--   "basic",
--   "standard",
--   "strict",
--   "recommended",
--   "all",
-- }
--
-- local current_mode = "standard"
--
-- local function update_basedpyright_type_checking(mode)
--   vim.lsp.stop_client(vim.lsp.get_active_clients({ name = "basedpyright" }))
--   vim.lsp.start({
--     name = "basedpyright",
--     cmd = { "basedpyright-langserver", "--stdio" },
--     settings = {
--       basedpyright = {
--         analysis = {
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true,
--           diagnosticMode = 'openFilesOnly',
--           typeCheckingMode = mode,
--         },
--       },
--     },
--   })
--   print("basedpyright typeCheckingMode set to: " .. mode)
-- end
--
-- local function choose_type_checking_mode_fzf()
--   fzf.fzf_exec(type_checking_modes, {
--     prompt = "Type Checking Mode> ",
--     previewer = false,
--     winopts = {
--       height = 0.2,
--       width = 0.3,
--       row = 0.5,
--       col = 0.5,
--       border = "rounded",
--     },
--     actions = {
--       ["default"] = function(selected)
--         if selected[1] then
--           current_mode = selected[1]
--           update_basedpyright_type_checking(current_mode)
--         end
--       end,
--     },
--   })
-- end
--
-- -- Keybindings
-- vim.keymap.set("n", "<leader>tm", function()
--   current_mode = (current_mode == "standard") and "strict" or "standard"
--   update_basedpyright_type_checking(current_mode)
-- end, { desc = "Toggle Pyright Standard/Strict" })
--
-- vim.keymap.set("n", "<leader>tM", choose_type_checking_mode_fzf, { desc = "Choose Pyright Type Checking Mode (fzf)" })
