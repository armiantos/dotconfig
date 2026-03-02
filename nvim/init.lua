vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- render whitespace
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', space = '·' }

require("config.lazy")
require("config.keymaps")

vim.cmd.colorscheme('kanagawa')

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

-- vim.lsp.enable('roslyn') -- already enabled through roslyn.nvim
vim.lsp.enable('clangd')

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
}

-- nvim-treesitter
require'nvim-treesitter'.install { 'c_sharp' }
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'cs' },
	callback = function() vim.treesitter.start() end,
})

-- conform
vim.api.nvim_create_user_command("ToggleFormatOnSave", function(args)
	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
desc = "Toggle autoformat-on-save",
bang = true,
})
