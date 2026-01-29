vim.g.mapleader = "`"
vim.opt.number = true

require("config.lazy")

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- vim plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
vim.call('plug#end')
