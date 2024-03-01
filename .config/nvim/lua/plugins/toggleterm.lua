return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = {
    {
      "<Leader>x",
      "<Cmd>ToggleTerm direction=float<CR>",
      desc = "Toggle floating terminal",
    },
    {
      "<Leader>z",
      "<Cmd>ToggleTerm direction=vertical<CR>",
      desc = "Toggle vertical split terminal",
    },
  },
  opts = {
    size = function(term)
      if term.direction == "float" then
        return 18
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.33
      end
    end,
    hide_numbers = true,
    autochdir = true,
    shade_terminals = true,
    shading_factor = 2,
    shell = "bash",
    float_opts = {
      border = "curved",
    },
  },
}
