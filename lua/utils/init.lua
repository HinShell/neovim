-- ~/.config/nvim/lua/utils/init.lua
-- Point d'entrée pour les utilitaires

-- Importer les fonctions utilitaires
local functions = require("utils.functions")

-- Exporter la fonction Map globalement pour compatibilité
_G.Map = functions.map

-- Exporter toutes les fonctions utilitaires
return functions
