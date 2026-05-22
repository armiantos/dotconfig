-- key binds
vim.keymap.set('n', '<Up>', 'g<Up>', { desc = "Move visual" })
vim.keymap.set('n', '<Down>', 'g<Down>', { desc = "Move visual" })
vim.keymap.set({ 'n', 'v' }, 'Y', '"+y', { desc = "Move visual" })

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', function() builtin.find_files() end, { desc = "Find files" })
vim.keymap.set('n', '<leader><C-p>', function() builtin.find_files({ hidden = true }) end,
	{ desc = "Find files (with hidden files)" })
vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Global search" })
vim.keymap.set('n', '<leader>P', builtin.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>;', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end,
	{ desc = "Commands" })

vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = "List references" })
vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = "List implementations" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Remove highlights on Esc" })

-- nvim-tree config
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- fugitive
vim.keymap.set('n', '<leader>G', '<cmd>G<CR>', { desc = "Open git" })

-- path
function expand_and_set_to_clipboard(term)
	_path = vim.fn.expand(term)
	vim.fn.setreg('+', _path)
	print(string.format('Copied %s to clipboard', _path))
end

vim.keymap.set('n', '<leader>a', function() expand_and_set_to_clipboard('%:t') end,
	{ desc = 'Copies filename to clipboard' })

vim.keymap.set('n', '<leader>A', function() expand_and_set_to_clipboard('%:.') end,
	{ desc = 'Copies path to file to clipboard' })
