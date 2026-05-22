vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.foldlevelstart = 99 -- don't fold by default

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- render whitespace
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', space = '·' }

require("config.lazy")
require("config.keymaps")

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

-- vim.lsp.enable('roslyn') -- already enabled through roslyn.nvim
vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('rust_analyzer')

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },

	-- Can switch between these as you prefer
	virtual_text = false, -- Text shows up at the end of the line
	virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
}

-- nvim-treesitter
require 'nvim-treesitter'.install { 'c_sharp', 'python', 'lua', 'rust', 'yaml' }
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'cs', 'python', 'lua', 'rust', 'yaml' },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'git',
	callback = function() vim.wo[0][0].foldmethod = 'syntax' end,
})

-- conform
vim.api.nvim_create_user_command("ToggleFormatOnSave", function(args)
	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
	desc = "Toggle autoformat-on-save",
	bang = true,
})
