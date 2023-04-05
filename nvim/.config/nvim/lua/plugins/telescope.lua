return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
					},
				},
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
