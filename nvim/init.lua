vim.g.mapleader = " "
vim.opt.number = true

require("config.lazy")

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.git_files)
vim.keymap.set('n', '<leader>b', builtin.buffers)
vim.keymap.set('n', '<leader>h', builtin.help_tags)

-- vim plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
vim.call('plug#end')
