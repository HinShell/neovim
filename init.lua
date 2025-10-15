-- =============================================
-- NEOVIM CONFIGURATION MODERNE
-- =============================================

-- Charger les utilitaires en premier
require("utils")

-- Configuration de base
require("config.options")  -- Options Neovim
require("config.keymaps")  -- Mappings génériques
require("config.autocmds") -- Autocommandes
require("config.terminal") -- Configuration terminal spécifique
require("config.lazy")     -- Gestionnaire de plugins
