-- Advanced config (add after vim.pack.add)
vim.g.vimwiki_ext2syntax = {  -- Map extensions to syntax (optional)
  ['.wiki'] = 'default',
  ['.md'] = 'markdown',
}

vim.g.vimwiki_folding = 'expr'  -- Enable folding for headers/lists (:h vimwiki-folding)
vim.g.vimwiki_hl_headers = 1    -- Highlight headers in different colors
vim.g.vimwiki_hl_cb_checked = 1 -- Highlight checked checkboxes

-- Diary setup (for daily notes)
vim.g.vimwiki_diary = 'diary'   -- Diary subfolder name
vim.g.vimwiki_diary_weeks = 'full'  -- Full week view in diary index

-- Keymaps (optional; customize <Leader>)
local wk = vim.keymap.set  -- Or use which-key.nvim for a menu
wk('n', '<Leader>ww', '<cmd>VimwikiIndex<CR>', { desc = 'Open wiki index' })
wk('n', '<Leader>wd', '<cmd>VimwikiDiaryIndex<CR>', { desc = 'Open diary' })
wk('n', '<Leader>we', '<cmd>VimwikiUIIndex<CR>', { desc = 'Wiki UI browser' })
wk('n', '<Leader>ws', '<cmd>VimwikiUISelect<CR>', { desc = 'Select wiki' })

-- Auto-generate diary headers (Lua autocmd)
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*/diary/*.wiki',  -- Adjust for your ext/syntax
  callback = function()
    local date = os.date('%Y-%m-%d')
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { '# ' .. date })
  end,
})
