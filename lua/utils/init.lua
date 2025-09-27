-- ~/.config/nvim/lua/utils/init.lua
local M = {}
M.functions = require("utils.functions")
-- Ajouter d’autres modules ici
_G.Map = M.functions.map
return M
