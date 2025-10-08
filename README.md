<div align="center">

![Neovim Config Header](https://raw.githubusercontent.com/HinShell/neovim/main/.github/assets/neovim-config-header.png)

# 🚀 Configuration Neovim Moderne

> Configuration Neovim optimisée avec Lazy.nvim, LSP, et intégration GitHub Copilot  
> **Version 1.1.0** - Neo-tree, Store.nvim, et améliorations UI

</div>

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green?style=flat-square&logo=neovim)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1+-blue?style=flat-square&logo=lua)](https://lua.org)
[![Lazy.nvim](https://img.shields.io/badge/Lazy.nvim-Plugin%20Manager-orange?style=flat-square)](https://lazy.folke.io)

## 📋 Table des Matières

- [🎯 Vue d'ensemble](#-vue-densemble)
- [⚡ Installation Rapide](#-installation-rapide)
- [📁 Architecture](#-architecture)
- [🔧 Plugins et Fonctionnalités](#-plugins-et-fonctionnalités)
- [⌨️ Raccourcis Clavier](#️-raccourcis-clavier)
- [🛠️ Configuration Technique](#️-configuration-technique)
- [🚀 Optimisation et Performance](#-optimisation-et-performance)
- [📝 Contribution](#-contribution)

## 🎯 Vue d'ensemble

Cette configuration Neovim moderne offre un environnement de développement complet avec :

- **🤖 IA intégrée** : GitHub Copilot avec chat interactif
- **🔍 Navigation avancée** : Telescope + Neo-tree pour l'exploration
- **💡 LSP complet** : Support multi-langages avec Mason
- **🎨 Interface élégante** : Thème Catppuccin avec composants UI modernes
- **⚡ Performance optimisée** : Lazy loading et configuration fine-tunée

## ⚡ Installation Rapide

### Prérequis

```bash
# macOS
brew install neovim git node npm ripgrep fd

# Vérifications
nvim --version  # v0.9.0+
node --version  # v18.0.0+
git --version   # v2.0.0+
```

### Installation

```bash
# Backup de votre configuration existante
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# Clone de cette configuration
git clone https://github.com/HinShell/neovim ~/.config/nvim

# Premier lancement (les plugins s'installent automatiquement)
nvim
```

### Configuration minimale (test)

```bash
# Test avec configuration isolée
nvim -u ~/.config/nvim/minimal.lua
```

## 📁 Architecture

```
~/.config/nvim/
├── 📄 init.lua                 # Point d'entrée principal
├── 📄 lazy-lock.json           # Versions verrouillées des plugins
├── 📄 minimal.lua              # Configuration de test minimal
├── 📄 README.md                # Cette documentation
├── 📄 TECHNICAL_DOCS.md        # Documentation technique détaillée
├── 📁 lua/
│   ├── 📁 config/              # Configuration de base
│   │   ├── 📄 options.lua      # Options Neovim
│   │   ├── 📄 keymaps.lua      # Raccourcis génériques
│   │   ├── 📄 autocmds.lua     # Autocommandes
│   │   ├── 📄 terminal.lua     # Configuration terminal
│   │   └── 📄 lazy.lua         # Configuration Lazy.nvim
│   ├── 📁 plugins/             # Plugins organisés par catégorie
│   │   ├── 📁 ai/              # Intelligence Artificielle
│   │   ├── 📁 editor/          # Édition de code
│   │   ├── 📁 git/             # Intégration Git
│   │   ├── 📁 lsp/             # Language Server Protocol
│   │   ├── 📁 navigation/      # Navigation et exploration
│   │   ├── 📁 tools/           # Outils divers
│   │   └── 📁 ui/              # Interface utilisateur
│   └── 📁 utils/               # Utilitaires Lua
│       ├── 📄 functions.lua    # Fonctions helper
│       └── 📄 init.lua         # Point d'entrée utils
└── 📁 env/                     # Environnement Node.js (auto-géré)
```

## 🔧 Plugins et Fonctionnalités

### 🤖 Intelligence Artificielle
| Plugin | Description | Raccourci |
|--------|-------------|-----------|
| **copilot.lua** | GitHub Copilot natif | `<M-l>` accepter |
| **copilot-cmp** | Intégration nvim-cmp | Auto-complétion |
| **CopilotChat.nvim** | Chat avec Copilot | `<leader>cc` |

### 🎨 Interface Utilisateur
| Plugin | Description | Fonction |
|--------|-------------|----------|
| **catppuccin** | Thème principal | Colorscheme moderne |
| **lualine.nvim** | Barre de statut | Infos contextuelles |
| **bufferline.nvim** | Onglets de buffers | Navigation buffers |
| **indent-blankline.nvim** | Guides d'indentation | Lisibilité du code |
| **which-key.nvim** | Aide raccourcis | Menu contextuel |
| **noice.nvim** | Interface messages | Notifications élégantes |

### 🔍 Navigation et Exploration
| Plugin | Description | Raccourci Principal |
|--------|-------------|-------------------|
| **telescope.nvim** | Fuzzy finder | `<leader>ff` |
| **neo-tree.nvim** | Explorateur fichiers moderne | `<leader>ee` |
| **telescope-fzf-native** | Recherche optimisée | Intégré à Telescope |

### 💻 Édition de Code
| Plugin | Description | Fonction |
|--------|-------------|----------|
| **nvim-treesitter** | Syntaxe avancée | Coloration, folding |
| **nvim-autopairs** | Pairs automatiques | `()`, `[]`, `{}` |
| **nvim-surround** | Manipulation surrounds | `ys`, `ds`, `cs` |
| **comment.nvim** | Commentaires | `gcc`, `gbc` |

### ⚙️ LSP et Complétion
| Plugin | Description | Rôle |
|--------|-------------|------|
| **lsp-zero.nvim** | Configuration LSP simplifiée | Setup LSP |
| **mason.nvim** | Gestionnaire serveurs LSP | Installation LSP |
| **nvim-cmp** | Moteur de complétion | Auto-complétion |
| **LuaSnip** | Moteur de snippets | Modèles de code |

### 🔀 Intégration Git
| Plugin | Description | Fonctionnalités |
|--------|-------------|-----------------|
| **gitsigns.nvim** | Indicateurs Git | Diff, blame, hunks |

### 🛠️ Outils Divers
| Plugin | Description | Usage |
|--------|-------------|-------|
| **markdown-preview.nvim** | Préview Markdown | `<leader>mp` |
| **trouble.nvim** | Diagnostics | Liste erreurs/warnings |
| **vim-floaterm** | Terminal flottant | `<leader>ft` |
| **minimap.vim** | Mini-carte | Vue d'ensemble fichier |
| **store.nvim** | Gestionnaire de plugins | Interface markdown pour plugins |
| **markview.nvim** | Rendu markdown avancé | Améliore l'affichage markdown |

### 🔔 Notifications et Interface
| Plugin | Description | Fonction |
|--------|-------------|----------|
| **nvim-notify** | Système de notifications | Notifications élégantes |
| **megatoggler** | Basculement rapide d'options | Toggle format on save, etc. |

## ⌨️ Raccourcis Clavier

### 🎯 Raccourcis Généraux
```
<Space>        -- Leader key
<leader>ee     -- Toggle Neo-tree
<leader>ef     -- Focus Neo-tree
<C-h/j/k/l>    -- Navigation fenêtres
<S-h/l>        -- Navigation buffers
<Esc><Esc>     -- Clear search highlight
```

### 🔍 Telescope
```
<leader>ff     -- Find files
<leader>fg     -- Live grep
<leader>fb     -- Buffers
<leader>fh     -- Help tags
<leader>fr     -- Recent files
<leader>fs     -- Grep string
```

### 🗂️ Neo-tree (Explorateur)
```
<leader>ee     -- Toggle Neo-tree
<leader>ef     -- Focus Neo-tree
```

### 🤖 Copilot
```
<M-l>          -- Accept suggestion
<M-[>          -- Previous suggestion
<M-]>          -- Next suggestion
<leader>cc     -- Chat toggle
<leader>cq     -- Quick chat
```

### 🔀 Git (gitsigns)
```
]c             -- Next hunk
[c             -- Previous hunk
<leader>hs     -- Stage hunk
<leader>hr     -- Reset hunk
<leader>hp     -- Preview hunk
<leader>hb     -- Blame line
```

### 📝 Édition
```
gcc            -- Toggle comment line
gbc            -- Toggle comment block
ys{motion}     -- Add surround
ds{char}       -- Delete surround
cs{old}{new}   -- Change surround
```

### 🛠️ Outils
```
<leader>mp     -- Markdown preview
<leader>ft     -- Float terminal
<leader>xx     -- Trouble toggle
<leader>td     -- Todo list
```

## 🛠️ Configuration Technique

> 📚 **Pour la documentation technique complète**, consultez [TECHNICAL_DOCS.md](TECHNICAL_DOCS.md)

### 🎛️ Options Principales

```lua
-- Performance
vim.opt.updatetime = 250           -- Réactivité
vim.opt.timeoutlen = 500          -- Timeout mappings

-- Interface
vim.opt.number = true             -- Numéros de ligne
vim.opt.relativenumber = true     -- Numéros relatifs
vim.opt.termguicolors = true      -- Couleurs vraies

-- Édition
vim.opt.expandtab = true          -- Espaces au lieu de tabs
vim.opt.tabstop = 2               -- Taille tab
vim.opt.shiftwidth = 2            -- Indentation
vim.opt.autoindent = true         -- Auto-indentation
```

### 🔧 Serveurs LSP Configurés

```lua
-- Installation automatique via Mason
ensure_installed = {
  "lua_ls",      -- Lua Language Server
  "bashls",      -- Bash Language Server  
  "yamlls",      -- YAML Language Server
}

-- Parsers Treesitter
ensure_installed = {
  "lua", "vim", "vimdoc", "query",
  "elixir", "heex", "javascript", 
  "typescript", "html", "css",
  "python", "json", "yaml", 
  "markdown", "bash", "cmake"
}
```

## 🚀 Optimisation et Performance

### ⚡ Métriques de Performance
```
📊 Statistiques Configuration (v1.1.0)
├── 🔌 Plugins Total : 44
├── ⚡ Temps démarrage : ~50ms
├── 💾 Taille config : ~500KB
├── 🎯 Lazy loaded : ~80%
└── 🔧 LSP Servers : 3+
```

### 🔧 Maintenance

```bash
# Mise à jour plugins
:Lazy update

# Nettoyage plugins non utilisés
:Lazy clean

# Profil de performance
:Lazy profile

# Vérifications santé
:checkhealth
```

### 🐛 Debugging

```bash
# Configuration minimale de test
nvim -u minimal.lua

# Logs et diagnostics
:messages
:LspInfo
:LspLog

# Profile de démarrage
nvim --startuptime startup.log
```

## 📝 Personnalisation

### 🎛️ Ajout d'un Plugin

1. **Créer le fichier plugin** dans `lua/plugins/category/`
2. **Structure recommandée** :
```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- Lazy loading
    config = function()
      -- Configuration du plugin
    end,
  },
}
```

### ⚙️ Modification des Options

Éditer `lua/config/options.lua` pour personnaliser les options Neovim.

### 🔤 Nouveaux Raccourcis

Ajouter dans `lua/config/keymaps.lua` ou directement dans la configuration plugin.

## 🆘 Dépannage

### ❌ Problèmes Courants

| Problème | Solution |
|----------|----------|
| **Plugin ne se charge pas** | `:Lazy reload <plugin>` |
| **LSP ne fonctionne pas** | `:LspInfo` puis `:Mason` |
| **Copilot inactif** | `:Copilot status` |
| **Performance lente** | `:Lazy profile` |

### 🔍 Support

- 📚 **Documentation technique** : [TECHNICAL_DOCS.md](TECHNICAL_DOCS.md)
- 🐛 **Issues** : Ouvrir une issue sur GitHub
- 💬 **Discussions** : Section Discussions du repository

## 🤝 Contribution

1. **Fork** le repository
2. **Créer une branche** : `git checkout -b feature/nouvelle-fonctionnalité`
3. **Tester** avec `minimal.lua`
4. **Commit** : `git commit -m "feat: nouvelle fonctionnalité"`
5. **Pull Request**

### 📝 Guidelines

- **Lazy loading** obligatoire pour nouveaux plugins
- **Documentation** des nouveaux raccourcis
- **Tests** avec configuration minimale
- **Performance** : pas de régression startup

---

<div align="center">

**🚀 Configuration Neovim Moderne**

*Optimisé pour la productivité et la performance*

[![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</div>
