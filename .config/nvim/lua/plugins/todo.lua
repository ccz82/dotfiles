return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<Leader>ft",
      function()
        vim.cmd(":TodoTelescope")
      end,
      desc = "Find all todos",
    },
  },
  config = true,
}
