-- ~/.config/nvim/lua/config/autocmds.lua
-- Autocommandes pour améliorer l'expérience utilisateur

local utils = require("utils")
local autocmd = vim.api.nvim_create_autocmd

-- Formatage automatique à la sauvegarde (si LSP disponible)
utils.functions.augroup("format_on_save", function(augroup)
  autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
      -- Seulement si LSP est attaché au buffer
      if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
        vim.lsp.buf.format({ async = false })
      end
    end,
  })
end)

-- Retour à la dernière position dans le fichier
utils.functions.augroup("restore_cursor", function(augroup)
  autocmd("BufReadPost", {
    group = augroup,
    pattern = "*",
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
        vim.api.nvim_win_set_cursor(0, mark)
      end
    end,
  })
end)

-- Mise en évidence temporaire des yanks
utils.functions.augroup("highlight_yank", function(augroup)
  autocmd("TextYankPost", {
    group = augroup,
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ timeout = 400 })
    end,
  })
end)

-- Auto-création des répertoires manquants
utils.functions.augroup("auto_create_dir", function(augroup)
  autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
      local dir = vim.fn.expand("<afile>:p:h")
      if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
      end
    end,
  })
end)

-- Désactiver les numéros de ligne en mode terminal
utils.functions.augroup("terminal_settings", function(augroup)
  autocmd("TermOpen", {
    group = augroup,
    pattern = "*",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  })
end)

-- Fermer automatiquement certains types de buffers avec 'q'
utils.functions.augroup("close_with_q", function(augroup)
  autocmd("FileType", {
    group = augroup,
    pattern = {
      "help",
      "startuptime",
      "qf",
      "lspinfo",
      "man",
      "checkhealth",
      "null-ls-info",
    },
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
  })
end)

-- Redimensionner les fenêtres en cas de redimensionnement du terminal
utils.functions.augroup("resize_splits", function(augroup)
  autocmd("VimResized", {
    group = augroup,
    callback = function()
      local current_tab = vim.fn.tabpagenr()
      vim.cmd("tabdo wincmd =")
      vim.cmd("tabnext " .. current_tab)
    end,
  })
end)
