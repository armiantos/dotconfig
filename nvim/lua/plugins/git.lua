local close_diff_and_reinit_diff = function(mode)
	if vim.wo.diff then
		vim.cmd.normal({ 'dq' }) -- close diff
	end

	vim.cmd(mode) -- go to next/prev file

	local qf_list = vim.fn.getqflist()
	local current_idx = vim.fn.getqflist({ idx = 0 }).idx

	local current_item = qf_list[current_idx].text

	if current_item == 'A' then
		-- new item, nothing to diff against
		return
	end

	vim.cmd(':GdiffBase')
end

return {
	'tpope/vim-fugitive',
	lazy = false,
	dependencies = { 'barrettruth/diffs.nvim' },
	keys = {
		{ '<leader>ls', '<cmd>G<CR>',                                       desc = "Open git" },
		{ '<leader>ly', ':GBrowse!<CR>',                                    mode = { 'n', 'v' },                                 desc = "Copy permalink" },
		{ '<leader>ld', ':GdiffBase<CR>',                                   desc = 'Start diffing from base set by `<leader>gb`' },
		{ '<leader>ln', function() close_diff_and_reinit_diff('cnext') end, desc = 'Go to next diff' },
		{ '<leader>lp', function() close_diff_and_reinit_diff('cprev') end, desc = 'Go to prev diff' },
		{
			'<leader>lb',
			function()
				vim.fn.setreg('+', vim.g.fugitive.base)
				print(string.format("Base: %s", vim.g.fugitive.base))
			end,
			desc = 'Copies the base set from `lr` or GSetBase'
		},
		{
			'<leader>lr',
			function()
				local default_branch = vim.api.nvim_exec2(":G symbolic-ref refs/remotes/origin/HEAD --short",
					{ output = true }).output
				local base = vim.api.nvim_exec2(string.format(':G merge-base %s !', default_branch), { output = true })
					.output
				print(string.format("Base: %s", base))
				vim.cmd(string.format(':GSetBase %s', base))
			end,
			desc = 'Start review - Diff with merge-base against main'
		},
	},
}
