-- ~/.config/nvim/lua/config/terminal.lua
-- Configuration spécifique pour empêcher la capture de la leader key en mode terminal

-- Timeout configuration pour terminal
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Désactiver complètement les mappings automatiques en mode terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Configuration locale pour le terminal
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    -- Empêcher tout mapping automatique de la leader key
    -- Supprimer tous les mappings <Space> en mode terminal pour ce buffer
    pcall(vim.keymap.del, 't', '<Space>', { buffer = true })
    pcall(vim.keymap.del, 't', '<leader>', { buffer = true })

    -- S'assurer qu'aucun plugin ne peut capturer Space
    vim.defer_fn(function()
      -- Double vérification après chargement des plugins
      pcall(vim.keymap.del, 't', '<Space>', { buffer = true })
      pcall(vim.keymap.del, 't', '<leader>', { buffer = true })
    end, 100)

    -- Démarrer en mode insertion
    vim.cmd("startinsert")
  end,
  desc = "Disable leader key capture in terminal"
})

-- Configuration pour floaterm spécifiquement
vim.api.nvim_create_autocmd("FileType", {
  pattern = "floaterm",
  callback = function()
    -- Supprimer explicitement tout mapping Space/leader en mode terminal
    pcall(vim.keymap.del, 't', '<Space>', { buffer = true })
    pcall(vim.keymap.del, 't', '<leader>', { buffer = true })

    -- Attendre un peu et vérifier à nouveau
    vim.defer_fn(function()
      pcall(vim.keymap.del, 't', '<Space>', { buffer = true })
      pcall(vim.keymap.del, 't', '<leader>', { buffer = true })
    end, 200)
  end,
  desc = "Remove Space mappings in floaterm"
})

