local close_diff_and_reinit_diff = function(mode)
	if vim.wo.diff then
		vim.cmd.normal({'dq'}) -- close diff
	end

	vim.cmd(mode) -- go to next fileS
	vim.cmd(':GdiffBase')
end

return {
	'tpope/vim-fugitive',
	lazy = false,
	keys = {
		{ '<leader>ls', '<cmd>G<CR>', desc = "Open git" },
		{ '<leader>ly', ':GBrowse!<CR>',  mode = { 'n', 'v' }, desc = "Copy permalink" },
		{ '<leader>ld', ':GdiffBase<CR>', desc = 'Start diffing from base set by `<leader>gb`' },
		{ '<leader>ln', function() close_diff_and_reinit_diff('cnext') end, desc = 'Start diffing from base set by `<leader>gb`' },
		{ '<leader>lp', function() close_diff_and_reinit_diff('cprev') end, desc = 'Start diffing from base set by `<leader>gb`' },
	},
}
