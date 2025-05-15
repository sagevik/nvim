-- If the plugin is disabled, return an empty table
if not vim.g.enabled_plugins["conform"] then
	return {}
end

-- return {
--     "stevearc/conform.nvim",
--     opts = {
--         formatters_by_ft = {
--             lua = { "stylua" },
--             go = { "gofmt" },
--             -- Conform will run multiple formatters sequentially
--             python = { "ruff" },
--             -- You can customize some of the format options for the filetype (:help conform.format)
--             rust = { "rustfmt", lsp_format = "fallback" },
--             -- Conform will run the first available formatter
--             javascript = { "prettierd", "prettier", stop_after_first = true },
--         },
--         format_on_save = {
--             timeout_ms = 500,
--             lsp_format = "fallback",
--         },
--         vim.keymap.set("n", "<leader>cf", function()
--             require("conform").format({
--                 lsp_format = "fallback",
--             })
--         end, { desc = " [C]ode [F]ormat" }),
--     },
-- }
--

return {
	-- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			sh = { "shfmt" },
			bash = { "shfmt" },
			go = { "goimports", "gofmt" },
			python = { "ruff_format", "ruff_organize_imports" },
			-- rust = { "rustfmt" }, -- Deprecated, should be installed via rustup
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
