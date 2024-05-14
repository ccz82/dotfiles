local lspServers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  clangd = {
    cmd = { "clangd", "--offset-encoding=utf-16" },
  },
  csharp_ls = {},
  rust_analyzer = {},
  pyright = {},
  tsserver = {},
  html = {},
  cssls = {},
  tailwindcss = {
    root_dir = function(fname)
      local root_pattern =
        require("lspconfig").util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "tailwind.config.ts")
      return root_pattern(fname)
    end,
  },
  marksman = {},
  texlab = {
    keys = {
      { "<Leader>k", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
    },
  },
}

local get_keys = function(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

local get_lsp_servers = function(lsp_servers, on_attach, capabilities)
  local servers = {}
  for server, config in pairs(lsp_servers) do
    ---@diagnostic disable-next-line: deprecated
    local server_name, _ = unpack(vim.split(server, "@"))

    config = vim.tbl_deep_extend("keep", config, {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {},
    })

    servers[server_name] = config
  end

  return servers
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = {
          pip = {
            upgrade_pip = true,
          },
          ui = {
            border = "rounded",
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },

      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local on_attach = function(_, bufnr)
        local bufopts = {
          noremap = true,
          silent = true,
          buffer = bufnr,
        }

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "<Leader>gs", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<Leader>gI", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<Leader>gt", vim.lsp.buf.type_definition, bufopts)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = get_lsp_servers(lspServers, on_attach, capabilities)

      require("mason-lspconfig").setup({
        ensure_installed = get_keys(lspServers),
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local config = servers[server_name] or {}
          require("lspconfig")[server_name].setup(config)
        end,
      })

      local lsp_diagnostics_sign_icons = {
        Error = "✘",
        Warn = "▲",
        Hint = "⚑",
        Info = "",
      }

      for name, icon in pairs(lsp_diagnostics_sign_icons) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = { spacing = 2, prefix = "●" },
        float = true,
        signs = true,
      })
    end,
  },
}
