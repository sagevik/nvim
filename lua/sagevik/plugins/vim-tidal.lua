-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["vim-tidal"] then
	return {}
end

return {
	{
		"tidalcycles/vim-tidal",
		ft = "tidal", -- Lazy-load on .tidal filetype
		config = function()
			-- Optional: Customize vim-tidal settings here
			vim.g.tidal_target = "tmux" -- Default, sends to terminal (tmux in your case)
			vim.g.tidal_default_config = {
				socket_name = "default",
				target_pane = "tidal:1.2",
			}
			vim.g.tidal_sc_enable = "1"
			vim.g.tidal_sc_boot = "/home/rs/.config/SuperCollider/startup.scd"
			-- Add keybindings (adjust as needed)
			vim.keymap.set("n", "<C-e>", "<Plug>TidalRegionSend", { buffer = true, desc = "Evaluate Tidal paragraph" })
			vim.keymap.set("n", "<leader>h", "<Plug>TidalHush", { buffer = true, desc = "Evaluate Tidal paragraph" })

			vim.keymap.set("n", "<leader>h", "<cmd>TidalHush<CR>", { buffer = true, desc = "Hush Tidal" })
		end,
	},
}
