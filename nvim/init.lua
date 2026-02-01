vim.opt.number = true

require("config.lazy")

-- telescope config

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.git_files)
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

vim.lsp.config("roslyn", {
    on_attach = function()
        print("This will run when the server attaches!")
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})

vim.lsp.enable("roslyn")
