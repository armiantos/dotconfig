return {
	'tpope/vim-fugitive',
	lazy = false,
	keys = {
		{ '<leader>ls', '<cmd>G<CR>', desc = "Open git" },
		{ '<leader>ly', ':GBrowse!<CR>',  mode = { 'n', 'v' }, desc = "Copy permalink" },
	},
}
