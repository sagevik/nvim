return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 0.9, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 0.8, -- width of the Zen window
			height = 0.8, -- height of the Zen window
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				laststatus = 0, -- turn off the statusline in zen mode
			},
			twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = false }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
			todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
			kitty = {
				enabled = true,
				font = "+4", -- font size increment
			},
			-- this will change the scale factor in Neovide when in zen mode
			-- See alse also the Plugins/Wezterm section in this projects README
			neovide = {
				enabled = false,
				-- Will multiply the current scale factor by this number
				scale = 1.2,
				-- disable the Neovide animations while in Zen mode
			},
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function(win)
			vim.cmd("colorscheme kanagawa-dragon")
		end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true }),
}
