-- VimWiki version control

-- Define the Vimwiki directory (adjust path as needed)
local vimwiki_dir = vim.fn.expand("~/dox/vimwiki")

-- Function for git add and commit
local function vimwiki_git_commit()
  -- Get current date in format like "2025-10-22"
  local date = os.date("%Y-%m-%d %H:%M")
  -- Prompt for commit message
  vim.ui.input({ prompt = "Enter commit message: ", default = "Vimwiki update" }, function(input)
    if not input or input == "" then
      print("Commit cancelled: No message provided")
      return
    end
    -- Append date to the provided message
    local commit_msg = string.format("%s on %s", input, date)

    -- Run git add and commit
    local add_result = vim.fn.system(string.format("cd %s && git add .", vimwiki_dir))
    if vim.v.shell_error ~= 0 then
      print("Error staging Vimwiki changes: " .. add_result)
      return
    end

    local commit_result = vim.fn.system(string.format('cd %s && git commit -m "%s"', vimwiki_dir, commit_msg))
    if vim.v.shell_error == 0 then
      print("Vimwiki changes committed: " .. commit_msg)
    else
      print("Error committing Vimwiki changes: " .. commit_result)
    end
  end)
end

-- Function for git push
local function vimwiki_git_push()
  -- Run git push
  local push_result = vim.fn.system(string.format("cd %s && git push", vimwiki_dir))
  if vim.v.shell_error == 0 then
    print("Vimwiki changes pushed to remote")
  else
    print("Error pushing Vimwiki changes: " .. push_result)
  end
end

-- Define user commands
vim.api.nvim_create_user_command("VimwikiGitCommit", vimwiki_git_commit, {})
vim.api.nvim_create_user_command("VimwikiGitPush", vimwiki_git_push, {})
