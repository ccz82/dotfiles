return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	keys = {
		{
			"<Leader>P",
			"<Cmd>MarkdownPreviewToggle<CR>",
			desc = "Preview Markdown",
		},
	},
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
