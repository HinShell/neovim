-- ~/.config/nvim/lua/utils/functions.lua
-- Fonctions utilitaires pour la configuration Neovim

local M = {}

-- Fonction Map globale améliorée
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Fonction pour créer des mappings conditionnels
function M.map_if_exists(mode, lhs, cmd, fallback, opts)
  if vim.fn.exists(':' .. cmd) > 0 then
    M.map(mode, lhs, '<cmd>' .. cmd .. '<cr>', opts)
  elseif fallback then
    M.map(mode, lhs, fallback, opts)
  end
end

-- Vérifier si un plugin est chargé
function M.is_plugin_loaded(plugin_name)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin_name] ~= nil
end

-- Fonction pour créer des autocommandes avec groupe
function M.augroup(name, fn)
  return fn(vim.api.nvim_create_augroup("nvim_config_" .. name, { clear = true }))
end

-- Fonction pour afficher des messages colorés
function M.notify(msg, level, title)
  local notify_ok, notify = pcall(require, "notify")
  if notify_ok then
    notify(msg, level, { title = title or "Neovim" })
  else
    vim.notify(msg, level)
  end
end

-- Fonction pour vérifier si on est dans un projet Git
function M.is_git_repo()
  return vim.fn.system("git rev-parse --is-inside-work-tree"):gsub("%s+", "") == "true"
end

-- Fonction pour obtenir la racine du projet Git
function M.get_git_root()
  if M.is_git_repo() then
    return vim.fn.system("git rev-parse --show-toplevel"):gsub("%s+", "")
  end
  return vim.fn.getcwd()
end

return M
