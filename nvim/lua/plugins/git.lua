return {
	'tpope/vim-fugitive',
	keys = {
		{ '<leader>G', '<cmd>G<CR>', desc = "Open git" },
		{ '<leader>Y', ':GBrowse!', mode = { 'n', 'v' }, desc = "Copy permalink" },
	},
}
