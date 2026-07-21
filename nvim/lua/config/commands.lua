vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.api.nvim_create_user_command("GSetBase", function(opts)
	local base_commit = opts.fargs[1]
	vim.g.fugitive = {
		base = base_commit
	}
	print(string.format('Set base commit to %s', base_commit))
	vim.cmd(string.format('G difftool %s --name-status', base_commit))
	vim.cmd('GdiffBase')
end, { nargs = 1})

vim.api.nvim_create_user_command("GdiffBase", function()
	if not vim.g.fugitive then
		print('No base commit set')
	end

	print(string.format('Diffing against %s', vim.g.fugitive.base))
	vim.cmd(string.format('Gdiffsplit %s', vim.g.fugitive.base))
end, {})
