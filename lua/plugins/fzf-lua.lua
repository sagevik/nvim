local utils = require("utils")

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("fzf-lua").setup({
			defaults = {
				keymap = {
					fzf = {
						["ctrl-q"] = "select-all+accept",
					},
				},
			},
			grep = {
				rg_opts = "--smart-case --multiline --column",
				silent = true,
			},
		})
	end,
	opts = {},
	keys = {
		{
			-- "<leader>ff",
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			-- desc = "[F]ind [F]iles",
			desc = "[S]earch [F]iles",
		},
		{
			-- "<leader>fg",
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
			-- desc = "[F]ind [G]rep",
			desc = "[S]earch [G]rep",
		},
		{
			-- "<leader>fc",
			"<leader>sn",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			-- desc = "[F]ind [C]onfig",
			desc = "[S]earch [N]eovim config",
		},
		{
			-- "<leader>fs",
			"<leader>ss",
			function()
				local selection = utils.get_visual_selection()
				require("fzf-lua").lgrep_curbuf({ search = selection[1] })
			end,
			mode = "v", --visual mode
			-- desc = "[F]ind [S]election (current buffer)",
			desc = "[S]earch [S]election (current buffer)",
		},
		{
			-- "<leader>fS",
			"<leader>sS",
			function()
				local selection = utils.get_visual_selection()
				require("fzf-lua").live_grep({ search = table.concat(selection, "\n") })
			end,
			mode = "v", --visual mode
			-- desc = "[F]ind [S]election (current project)",
			desc = "[S]earch [S]election (current project)",
		},
		{
			-- "<leader>fb",
			"<leader>sb",
			function()
				require("fzf-lua").builtin()
			end,
			-- desc = "[F]ind [B]uiltin FZF",
			desc = "[S]earch [B]uiltin FZF",
		},
		{
			-- "<leader>fh",
			"<leader>sh",
			function()
				require("fzf-lua").helptags()
			end,
			-- desc = "[F]ind [H]elp",
			desc = "[S]earch [H]elp",
		},
		{
			-- "<leader>fk",
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
			-- desc = "[F]ind [K]eymaps",
			desc = "[S]earch [K]eymaps",
		},
		{
			-- "<leader>fw",
			"<leader>sw",
			function()
				require("fzf-lua").grep_cword()
			end,
			-- desc = "[F]ind current [W]ord",
			desc = "[S]earch current [W]ord",
		},
		{
			-- "<leader>fW",
			"<leader>sW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			-- desc = "[F]ind current [W]ORD",
			desc = "[S]earch current [W]ORD",
		},
		{
			-- "<leader>fd",
			"<leader>sd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			-- desc = "[F]ind [D]iagnostics",
			desc = "[S]earch [D]iagnostics",
		},
		{
			-- "<leader>fD",
			"<leader>sD",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			-- desc = "[F]ind [D]iagnostics",
			desc = "[S]earch [D]iagnostics workspace",
		},
		{
			-- "<leader>fr",
			"<leader>sr",
			function()
				require("fzf-lua").resume()
			end,
			-- desc = "[F]ind [R]esume",
			desc = "[S]earch [R]esume",
		},
		{
			-- "<leader>fr",
			"<leader>s.",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[S]earch Recent Files",
		},
		{
			-- "<leader>fo",
			"<leader>so",
			function()
				require("fzf-lua").oldfiles()
			end,
			-- desc = "[F]ind [O]ld Files",
			desc = "[S]earch [O]ld Files",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[ ]Find open Buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep current buffer",
		},
	},
}
