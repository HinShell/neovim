---@diagnostic disable: undefined-global

-- =============================================
-- NEOVIM CONFIGURATION MODERNE
-- =============================================

-- Charger les utilitaires en premier
require("utils")

-- Configuration de base
require("config.options")    -- Options Neovim
require("config.keymaps")    -- Mappings génériques  
require("config.autocmds")   -- Autocommandes
require("config.lazy")       -- Gestionnaire de plugins

-- TODO: Temporaire - Sera supprimé quand les mappings seront dans les plugins
require("config.plugin-keymaps") -- Mappings spécifiques aux plugins

-- Appliquer le thème
vim.cmd('colorscheme catppuccin')
