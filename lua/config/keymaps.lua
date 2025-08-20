-- ~/.config/nvim/lua/config/keymaps.lua
-- Mappings génériques de base (pas spécifiques aux plugins)

local utils = require("utils")
local map = utils.map

-- Configuration de la touche leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- =============================================
-- GESTION DES FICHIERS ET BUFFERS
-- =============================================

-- Sauvegarder et quitter
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all force" })

-- Sauvegarde rapide avec Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Gestion des buffers (raccourcis de base)
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Delete buffer force" })

-- =============================================
-- NAVIGATION ENTRE FENÊTRES
-- =============================================

-- Navigation directionnelle
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Redimensionnement des fenêtres
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- =============================================
-- ÉDITION DE TEXTE
-- =============================================

-- Déplacement de lignes en mode visuel
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Déplacement de lignes en mode normal
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Indentation continue en mode visuel
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Sélection rapide
map("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- =============================================
-- NAVIGATION DANS LE TEXTE
-- =============================================

-- Navigation par paragraphe plus fluide
map("n", "J", "mzJ`z", { desc = "Join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- Navigation de recherche centrée
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- =============================================
-- UTILITAIRES
-- =============================================

-- Copie de chemin de fichier
map("n", "<leader>pp", "<cmd>let @+ = expand('%')<CR>", { desc = "Copy relative path" })
map("n", "<leader>pP", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Copy absolute path" })
map("n", "<leader>pf", "<cmd>let @+ = expand('%:t')<CR>", { desc = "Copy filename" })
map("n", "<leader>pd", "<cmd>let @+ = expand('%:p:h')<CR>", { desc = "Copy directory path" })

-- Effacer la recherche
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Recharger la configuration
map("n", "<leader>R", "<cmd>source $MYVIMRC<CR>", { desc = "Reload config" })

-- =============================================
-- LIGNE DE COMMANDE
-- =============================================

-- Navigation en mode commande
map("c", "<C-j>", "<Down>", { desc = "Next command" })
map("c", "<C-k>", "<Up>", { desc = "Previous command" })

-- =============================================
-- MODE INSERTION
-- =============================================

-- Sortie du mode insertion
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- =============================================
-- TERMINAL
-- =============================================

-- Sortie du mode terminal
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- =============================================
-- DIAGNOSTICS
-- =============================================

-- Diagnostics de base (si pas de plugin spécialisé)
map("n", "<leader>sd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show line diagnostics" })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
