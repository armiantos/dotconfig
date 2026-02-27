-- key binds
vim.keymap.set('n', '<Up>', 'g<Up>', { desc = "Move visual" })
vim.keymap.set('n', '<Down>', 'g<Down>', { desc = "Move visual" })
vim.keymap.set({'n', 'v'}, 'Y', '"*y', { desc = "Move visual" })

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Global search" })
vim.keymap.set('n', '<leader>P', builtin.commands, { desc = "Commands" })

vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = "List references" })
vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = "List implementations" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Remove highlights on Esc" })

-- nvim-tree config
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { desc = "Toggle file tree" })

