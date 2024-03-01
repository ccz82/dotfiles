return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		-- "nvim-telescope/telescope-frecency.nvim",
	},
	cmd = "Telescope",
	keys = {
		{
			"<Leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<Leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find text",
		},
		{
			"<Leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffer",
		},
		{
			"<Leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find help tag",
		},
		{
			"<Leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Find keymap",
		},
		{
			"<Leader>fm",
			function()
				require("telescope.builtin").man_pages()
			end,
			desc = "Find man page",
		},
		{
			"<Leader>fc",
			function()
				require("telescope.builtin").colorscheme()
			end,
			desc = "Change colorscheme",
		},
		{
			"<Leader>fn",
			function()
				require("telescope").extensions.file_browser.file_browser()
			end,
			desc = "Open file explorer",
		},
		-- {
		-- 	"<Leader>fr",
		-- 	function()
		-- 		require("telescope").extensions.frecency.frecency()
		-- 	end,
		-- 	desc = "Find recent files",
		-- },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("ui-select")
		-- require("telescope").load_extension("frecency")
	end,
}
