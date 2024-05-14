-- Disable mouse input
vim.opt.mouse = ""

-- Disable swap files
vim.opt.swapfile = false

-- Disable line wrap
vim.opt.wrap = false

-- Do not show current mode in command line
vim.opt.showmode = false

-- Show line numbers
vim.opt.number = true

-- Highlight cursorline
vim.opt.cursorline = true

-- Always draw sign column
vim.opt.signcolumn = "yes"

-- Completion menu behavior
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable 24-bit RGB color support
vim.opt.termguicolors = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- -- Enable yank support on WSL
-- if vim.fn.has("wsl") == true then
--   vim.g.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of TAB
vim.opt.tabstop = 2 -- Number of spaces that a TAB character represents
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting with << or >>

vim.opt.autoindent = true -- Copy indentation from previous line
vim.opt.smartindent = true
