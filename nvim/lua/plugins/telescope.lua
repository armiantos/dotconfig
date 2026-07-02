return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-telescope/telescope-ui-select.nvim',
	},
	keys = {
		{ '<leader>p', function() require('telescope.builtin').find_files() end, desc = "Find files" },
		{ '<leader><C-p>', function() require('telescope.builtin').find_files({ hidden = true }) end, desc = "Find files (with hidden files)" },
		{ '<leader>b', function() require('telescope.builtin').buffers() end, desc = "Buffers" },
		{ '<leader>F', function() require('telescope.builtin').live_grep() end, desc = "Global search" },
		{ '<leader>P', function() require('telescope.builtin').commands() end, desc = "Commands" },
		{ '<leader>;', function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end, desc = "Find config files" },
		{ 'grr', function() require('telescope.builtin').lsp_references() end, desc = "List references" },
		{ 'gri', function() require('telescope.builtin').lsp_implementations() end, desc = "List implementations" },
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown()
		}
	},
	config = function()
		require('telescope').load_extension('ui-select')
		require('telescope').load_extension('fzf')
		require('telescope').setup {
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			defaults = {
				preview = false,
				layout_strategy = 'flex',
				layout_config = {
					flip_columns = 160
				},
				vimgrep_arguments = {
					"rg",
					"-F", -- Fixed strings only
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case"
				},
				path_display = { 'filename_first' }
			}
		}
	end
}
