vim.opt.number = true

require("config.lazy")

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files)
vim.keymap.set('n', '<leader>F', builtin.live_grep)
vim.keymap.set('n', '<leader>P', builtin.commands)

-- nvim-tree config
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>')

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

-- vim.lsp.enable('roslyn') -- already enabled through roslyn.nvim
vim.lsp.enable('clangd')
