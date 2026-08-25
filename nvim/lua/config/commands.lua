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

vim.api.nvim_create_user_command("GInspect", function(opts)
	local commit = opts.fargs[1]
	local cmd = string.format('GSetBase %s~1 %s', commit, commit)
	vim.cmd(cmd)
end, { nargs = 1, desc = 'Loads commit diff to quickfix' })

vim.api.nvim_create_user_command("GSetBase", function(opts)
	local base_commit = opts.fargs[1]
	vim.g.fugitive = {
		base = base_commit
	}

	if #opts.fargs > 1 then
		local head = opts.fargs[2]
		print(string.format('Set base commit to %s and target %s', base_commit, head))
		vim.g.fugitive = {
			base = base_commit,
			head = head
		}
		vim.cmd(string.format('G difftool %s..%s --name-status', base_commit, head))
		return
	end

	print(string.format('Set base commit to %s', base_commit))
	vim.cmd(string.format('G difftool %s --name-status', base_commit))
end, { nargs = '+', desc = 'Sets commit base and optionally target - defaults to current work dir' })

vim.api.nvim_create_user_command("GdiffBase", function(opts)
	if not vim.g.fugitive then
		print('No base commit set')
		return
	end

	print(string.format('Diffing against %s', vim.g.fugitive.base))

	local width = vim.api.nvim_win_get_width(0)
	if width < 180 then
		vim.cmd(string.format('Gdiffsplit %s', vim.g.fugitive.base))
		return
	end

	vim.cmd(string.format('Gvdiffsplit %s', vim.g.fugitive.base))
end, { desc = 'Compares current file against base diff set from GSetBase' })
