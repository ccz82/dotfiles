return {
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000, config = function()
    vim.cmd("colorscheme gruvbox")
  end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  --   config = function()
  --     local hr = tonumber(os.date('%H', os.time()))
  --     if hr > 7 and hr < 19 then
  --       vim.cmd("colorscheme kanagawa-wave")
  --     else
  --       vim.cmd("colorscheme kanagawa-dragon")
  --     end
  --   end,
  }
}
