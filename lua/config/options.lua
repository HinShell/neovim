-- ~/.config/nvim/lua/config/options.lua
-- Configuration des options de base de Neovim

-- =============================================
-- APPARENCE ET UI
-- =============================================

-- Numéros de ligne
vim.opt.number = true          -- Numéros de ligne absolus
vim.opt.relativenumber = true  -- Numéros de ligne relatifs
vim.opt.signcolumn = "yes"     -- Toujours afficher la colonne des signes
vim.opt.cursorline = true      -- Surligner la ligne courante

-- Couleurs et thème
vim.opt.termguicolors = true   -- Support des couleurs 24-bit
vim.opt.background = "dark"    -- Thème sombre par défaut

-- Interface
vim.opt.cmdheight = 1          -- Hauteur de la ligne de commande
vim.opt.showmode = false       -- Masquer le mode (affiché dans lualine)
vim.opt.showcmd = true         -- Afficher les commandes partielles
vim.opt.laststatus = 3         -- Barre de statut globale
vim.opt.showtabline = 2        -- Toujours afficher la ligne des onglets

-- Messages
vim.opt.shortmess:append("sI") -- Raccourcir les messages

-- =============================================
-- ÉDITION ET INDENTATION
-- =============================================

-- Tabulations et espaces
vim.opt.tabstop = 2            -- Largeur des tabulations
vim.opt.shiftwidth = 2         -- Largeur de l'indentation automatique
vim.opt.softtabstop = 2        -- Largeur des tabulations en insertion
vim.opt.expandtab = true       -- Convertir les tabulations en espaces
vim.opt.smartindent = true     -- Indentation intelligente
vim.opt.autoindent = true      -- Indentation automatique
vim.opt.shiftround = true      -- Arrondir l'indentation aux multiples de shiftwidth

-- Gestion des lignes
vim.opt.wrap = false           -- Pas de retour à la ligne automatique
vim.opt.linebreak = true       -- Couper aux mots si wrap activé
vim.opt.breakindent = true     -- Indenter les lignes wrappées

-- =============================================
-- RECHERCHE
-- =============================================

vim.opt.hlsearch = true        -- Surligner les résultats de recherche
vim.opt.incsearch = true       -- Recherche incrémentale
vim.opt.ignorecase = true      -- Ignorer la casse
vim.opt.smartcase = true       -- Respecter la casse si majuscules présentes

-- =============================================
-- NAVIGATION ET COMPORTEMENT
-- =============================================

-- Souris et clavier
vim.opt.mouse = "a"            -- Support souris dans tous les modes
vim.opt.clipboard = "unnamedplus" -- Utiliser le presse-papier système

-- Scrolling
vim.opt.scrolloff = 8          -- Garder 8 lignes visibles autour du curseur
vim.opt.sidescrolloff = 8      -- Garder 8 colonnes visibles

-- Fenêtres
vim.opt.splitbelow = true      -- Diviser vers le bas
vim.opt.splitright = true      -- Diviser vers la droite

-- =============================================
-- PERFORMANCE ET SAUVEGARDES
-- =============================================

-- Temps d'attente
vim.opt.updatetime = 250       -- Temps avant écriture du swap
vim.opt.timeoutlen = 300       -- Temps d'attente pour les mappings

-- Fichiers et historique
vim.opt.undofile = true        -- Fichiers undo persistants
vim.opt.swapfile = false       -- Désactiver les fichiers swap
vim.opt.backup = false         -- Pas de fichiers de sauvegarde
vim.opt.writebackup = false    -- Pas de sauvegarde temporaire

-- Complétion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 15         -- Hauteur max du menu de complétion

-- =============================================
-- EXPLORATEUR DE FICHIERS (désactiver netrw)
-- =============================================

vim.g.loaded_netrw = 1         -- Désactiver netrw
vim.g.loaded_netrwPlugin = 1   -- Désactiver le plugin netrw

-- =============================================
-- FOLDING (PLIAGE)
-- =============================================

vim.opt.foldmethod = "expr"    -- Méthode de pliage par expression
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utiliser treesitter pour le pliage
vim.opt.foldlevel = 99         -- Déplier tout par défaut
vim.opt.foldlevelstart = 99    -- Commencer avec tout déplié

-- =============================================
-- FORMAT ET ENCODAGE
-- =============================================

vim.opt.encoding = "utf-8"     -- Encodage UTF-8
vim.opt.fileencoding = "utf-8" -- Encodage des fichiers
vim.opt.fileformat = "unix"    -- Format Unix pour les fins de ligne

-- =============================================
-- WILDMENU (COMPLÉTION LIGNE DE COMMANDE)
-- =============================================

vim.opt.wildmenu = true        -- Complétion améliorée
vim.opt.wildmode = "longest:full,full" -- Mode de complétion
vim.opt.wildignore:append({
  "*.o", "*.obj", "*.pyc", "*.so", "*.dll",
  "*/.git/*", "*/.hg/*", "*/.svn/*",
  "*/node_modules/*", "*/target/*"
})

-- =============================================
-- AUTRES OPTIONS
-- =============================================

vim.opt.hidden = true          -- Permettre les buffers cachés
vim.opt.confirm = true         -- Demander confirmation pour certaines actions
vim.opt.visualbell = true      -- Clignottement visuel au lieu de bip
vim.opt.history = 1000         -- Taille de l'historique des commandes

-- Caractères invisibles
vim.opt.list = false           -- Ne pas afficher par défaut
vim.opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "…",
  precedes = "…",
  nbsp = "␣"
}

-- =============================================
-- PROVIDERS EXTERNES (performance)
-- =============================================

-- Désactiver les providers non utilisés pour améliorer les performances
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0  -- Python 2
-- vim.g.loaded_python3_provider = 0  -- Garder Python 3 pour certains plugins

-- =============================================
-- DIAGNOSTIC
-- =============================================

-- Configuration des diagnostics
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- =============================================
-- TERMINAL
-- =============================================

-- Configuration pour préserver les keymaps globaux en mode terminal
-- Désactiver la capture automatique des touches par le terminal
vim.opt.timeout = true
vim.opt.timeoutlen = 300  -- Temps d'attente pour les combinaisons de touches

-- Autocommande pour configurer le comportement global du terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Pas de numéros de ligne dans les terminaux
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    
    -- Démarrer en mode insertion
    vim.cmd("startinsert")
  end,
  desc = "Terminal global configuration"
})
