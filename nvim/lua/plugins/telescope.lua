return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
				} }
		}
	end
}
