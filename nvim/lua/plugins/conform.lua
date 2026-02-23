return {
	'stevearc/conform.nvim',
	opts = {
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			json = { "jq" },
		},
	},
}
