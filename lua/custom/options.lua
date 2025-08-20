
---@diagnostic disable: undefined-global

-- Set some basic settings
vim.o.number = true        -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.tabstop = 2          -- Number of spaces that a <Tab> in the file counts for
vim.o.shiftwidth = 2       -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true     -- Convert tabs to spaces
vim.o.termguicolors = true -- Enable 24-bit RGB color in the terminal UI
vim.cmd('syntax on')        -- Enable syntax highlighting
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.shortmess:append "sI"

vim.g.floaterm_title="CmdLine($1|$2)"
vim.g.floaterm_titleposition="right"
vim.g.floaterm_position="bottom"
vim.g.floaterm_width=0.9
vim.g.floaterm_autoclose=1

