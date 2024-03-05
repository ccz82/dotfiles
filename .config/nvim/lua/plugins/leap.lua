return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  init = function()
    require("leap").add_default_mappings(true)

    -- Reset mappings for x and X back to default
    vim.keymap.del({ "x", "o" }, "x")
    vim.keymap.del({ "x", "o" }, "X")
  end,
}
