vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- render whitespace
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', space = '·' }

require("config.lazy")

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Global search" })
vim.keymap.set('n', '<leader>P', builtin.commands, { desc = "Commands" })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- nvim-tree config
vim.keymap.set('n', '<leader>b', ':NvimTreeToggle<CR>', { desc = "Toggle file tree" })

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

-- vim.lsp.enable('roslyn') -- already enabled through roslyn.nvim
vim.lsp.enable('clangd')

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}
