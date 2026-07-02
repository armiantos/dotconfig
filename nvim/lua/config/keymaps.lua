-- key binds
vim.keymap.set('n', '<Up>', 'g<Up>', { desc = "Move visual" })
vim.keymap.set('n', '<Down>', 'g<Down>', { desc = "Move visual" })
vim.keymap.set({ 'n', 'v' }, 'Y', '"+y', { desc = "Move visual" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Remove highlights on Esc" })

-- path
function expand_and_set_to_clipboard(term)
	_path = vim.fn.expand(term)
	vim.fn.setreg('+', _path)
	print(string.format('Copied %s to clipboard', _path))
end

vim.keymap.set('n', '<leader>a', function() expand_and_set_to_clipboard('%:.') end,
	{ desc = 'Copies relative filename to clipboard' })

vim.keymap.set('n', '<leader>A', function() expand_and_set_to_clipboard('%:p') end,
	{ desc = 'Copies absolute path of file to clipboard' })
