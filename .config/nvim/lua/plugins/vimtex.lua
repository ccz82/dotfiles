return {
	{
		"lervag/vimtex",
		ft = "tex",
		config = function()
			vim.g.vimtex_compiler_method = "tectonic"
			vim.g.vimtex_view_general_viewer = "sumatraPDF.exe"
			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
		end,
	},
}
