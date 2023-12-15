return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
				-- layout_config = {
				-- 	horizontal = {
				-- 		preview_cutoff = 0,
				-- 	},
				-- },
			},
		})
	end,
	keys = {

		{ "<leader>ff", require("telescope.builtin").find_files },
		{ "<leader>fg", require("telescope.builtin").live_grep },
		{ "<leader>fb", require("telescope.builtin").buffers },
		{ "<leader>fh", require("telescope.builtin").help_tags },
	},
}
