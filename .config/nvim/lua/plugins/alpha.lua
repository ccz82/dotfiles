return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                                             ]],
        [[      ████ ██████           █████      ██]],
        [[     ███████████             █████ ]],
        [[     █████████ ███████████████████ ███   ███████████]],
        [[    █████████  ███    █████████████ █████ ██████████████]],
        [[   █████████ ██████████ █████████ █████ █████ ████ █████]],
        [[ ███████████ ███    ███ █████████ █████ █████ ████ █████]],
        [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", "  > New file", "<Cmd>ene <BAR> startinsert<CR>"),
        dashboard.button("r", "  > Recent files", "<Cmd>Telescope frecency<CR>"),
        dashboard.button("f", "  > Find file", "<Cmd>Telescope find_files<CR>"),
        dashboard.button("g", "  > Find text", "<Cmd>Telescope live_grep<CR>"),
        dashboard.button("u", "  > Update plugins", "<Cmd>Lazy update<CR>"),
        dashboard.button("l", "󰒲  > Lazy", "<Cmd>Lazy<CR>"),
        dashboard.button("m", "󰌘  > Mason", "<Cmd>Mason<CR>"),
        dashboard.button("s", "  > Settings", "<Cmd>e $MYVIMRC<CR> | <Cmd>cd %:p:h<CR>"),
        dashboard.button("q", "  > Quit", "<Cmd>qa<CR>"),
      }

      -- Center horizontally and vertically
      dashboard.opts.layout[1].val = 6

      return dashboard
    end,
    config = function(_, dashboard)
      -- Close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      -- Show Neovim version and plugins loaded
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100) / 100
          local version = " "
              .. vim.version().major
              .. "."
              .. vim.version().minor
              .. "."
              .. vim.version().patch
          local plugins = "󱐌 Loaded " .. stats.loaded .. " plugins in " .. ms .. "ms"
          dashboard.section.footer.val = plugins .. "\t" .. version .. "\n"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
