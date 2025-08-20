# Configuration Neovim

Une configuration Neovim moderne et élégante avec intégration IA, orientée développement et productivité.

## ✨ Fonctionnalités

- 🚀 **Gestionnaire de plugins moderne** avec [Lazy.nvim](https://github.com/folke/lazy.nvim)
- 🤖 **Intégration GitHub Copilot** complète avec chat et suggestions
- 🎨 **Interface soignée** avec thème Catppuccin et composants UI modernes
- 📁 **Explorateur de fichiers** avec Nvim-tree et Telescope
- 🔧 **LSP intégré** avec configuration simplifiée via LSP-zero
- 🌳 **Coloration syntaxique avancée** avec Treesitter
- 🖥️ **Terminal flottant** avec applications intégrées
- 🗺️ **Minimap** pour navigation visuelle dans les fichiers
- 📏 **Guides d'indentation** pour une meilleure lisibilité
- 🔀 **Intégration Git** avec indicateurs visuels et commandes

## 📋 Prérequis

- Neovim >= 0.9.0
- Git
- Node.js (pour certains serveurs LSP)
- [Nerd Font](https://www.nerdfonts.com/) pour les icônes
- Rust et Cargo (pour la minimap)
- GitHub Copilot (optionnel)

## 🚀 Installation

### Installation rapide

```bash
# Sauvegarde de votre configuration existante (optionnel)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone de cette configuration
git clone <votre-repo> ~/.config/nvim

# Lancer Neovim (les plugins s'installeront automatiquement)
nvim
```

### Première utilisation

1. **Installation des plugins** : Au premier lancement, Lazy.nvim installera automatiquement tous les plugins
2. **Installation des serveurs LSP** : Utilisez `:Mason` pour installer des serveurs LSP supplémentaires
3. **Mise à jour Treesitter** : `:TSUpdate` pour mettre à jour les parsers
4. **Installation Markdown Preview** : Si le plugin markdown-preview ne fonctionne pas :
   ```bash
   cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
   npm install
   ```

## 🔧 Plugins Inclus

### Interface Utilisateur
- **[Catppuccin](https://github.com/catppuccin/nvim)** - Thème de couleurs élégant
- **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** - Barre de statut
- **[Bufferline](https://github.com/akinsho/bufferline.nvim)** - Gestion des onglets
- **[Which-key](https://github.com/folke/which-key.nvim)** - Aide pour les raccourcis
- **[Noice](https://github.com/folke/noice.nvim)** - Interface moderne pour les messages
- **[Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)** - Guides d'indentation
- **[Minimap](https://github.com/wfxr/minimap.vim)** - Carte visuelle du fichier

### Navigation et Fichiers
- **[Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)** - Explorateur de fichiers
- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder

### Documentation et Markdown
- **[Markdown-preview](https://github.com/iamcco/markdown-preview.nvim)** - Prévisualisation Markdown en temps réel

### Git Integration
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Indicateurs Git et navigation dans les hunks

### Édition de Code
- **[Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Coloration syntaxique
- **[Nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Fermeture automatique
- **[Nvim-surround](https://github.com/kylechui/nvim-surround)** - Manipulation des entourages
- **[Comment.lua](https://github.com/numToStr/Comment.nvim)** - Gestion des commentaires

### LSP et Complétion
- **[LSP-zero](https://github.com/VonHeikemen/lsp-zero.nvim)** - Configuration LSP simplifiée
- **[Mason](https://github.com/williamboman/mason.nvim)** - Gestionnaire de serveurs LSP
- **[Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Moteur de complétion
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Moteur de snippets

### Intelligence Artificielle
- **[Copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot
- **[Copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)** - Intégration avec nvim-cmp
- **[CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** - Chat avec Copilot

### Terminal
- **[Vim-floaterm](https://github.com/voldikss/vim-floaterm)** - Terminal flottant

## ⌨️ Raccourcis Clavier

### Général
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<Space>` | Leader | Touche leader principale |
| `<leader>q` | `:q` | Quitter |
| `<leader>w` | `:w` | Sauvegarder |
| `<leader>x` | `:bd` | Fermer le buffer |
| `<leader>?` | Which-key | Afficher les raccourcis |

### Navigation
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<C-n>` | NvimTreeToggle | Basculer l'explorateur |
| `<leader>e` | NvimTreeFocus | Focus sur l'explorateur |
| `<Tab>` | Buffer suivant | Navigation entre buffers |
| `<S-Tab>` | Buffer précédent | Navigation entre buffers |
| `]c` / `[c` | Git hunks | Navigation entre les changements Git |

### Minimap
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<leader>mm` | MinimapToggle | Basculer la minimap |
| `<leader>mr` | MinimapRefresh | Actualiser la minimap |
| `<leader>mc` | MinimapClose | Fermer la minimap |
| `<leader>mo` | Minimap | Ouvrir la minimap |

### Git (Gitsigns)
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<leader>hs` | Stage hunk | Stage le hunk courant |
| `<leader>hr` | Reset hunk | Reset le hunk courant |
| `<leader>hS` | Stage buffer | Stage tout le fichier |
| `<leader>hR` | Reset buffer | Reset tout le fichier |
| `<leader>hp` | Preview hunk | Prévisualiser le hunk |
| `<leader>hb` | Blame line | Git blame de la ligne |
| `<leader>tb` | Toggle blame | Basculer blame permanent |
| `<leader>hd` | Diff this | Diff du fichier |

### Terminal
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<leader>tt` | Terminal | Terminal flottant |
| `<leader>tc` | CmdLine | Ligne de commande |
| `<leader>tb` | Btop | Moniteur système |
| `<leader>ty` | Yazi | Gestionnaire de fichiers |

### GitHub Copilot
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<C-l>` | Accepter ligne | Accepter ligne Copilot |
| `<C-j>` | Accepter mot | Accepter mot Copilot |
| `<C-ç>` | Suggestion suivante | Copilot suivant |
| `<leader>cc` | Toggle Copilot | Activer/désactiver |
| `<leader>cp` | Panel Copilot | Ouvrir le panel |

### Utilitaires
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<leader>pp` | Copier chemin | Chemin complet du fichier |
| `<leader>ps` | Copier nom | Nom du fichier uniquement |
| `<leader>np` | Noice pick | Sélecteur Noice |

### Markdown
| Raccourci | Action | Description |
|-----------|--------|-------------|
| `<leader>mp` | Toggle Preview | Basculer prévisualisation Markdown |
| `<leader>ms` | Start Preview | Démarrer prévisualisation |
| `<leader>me` | Stop Preview | Arrêter prévisualisation |

## 🛠️ Configuration

### Langages Supportés (Treesitter)
- C/C++
- Lua
- Vim/Vimscript
- Elixir/Heex
- JavaScript
- HTML
- CMake

### Serveurs LSP Configurés
- **lua_ls** - Lua Language Server
- **bashls** - Bash Language Server
- **yamlls** - YAML Language Server

## 📁 Structure du Projet

```
~/.config/nvim/
├── init.lua                    # Point d'entrée principal
├── lazy-lock.json             # Verrouillage des versions
├── minimal.lua                # Configuration minimale
├── README.md                   # Cette documentation
├── lua/
│   ├── config/
│   │   └── lazy.lua           # Configuration Lazy.nvim
│   ├── custom/
│   │   ├── mappings.lua       # Raccourcis personnalisés
│   │   └── options.lua        # Options Neovim
│   └── plugins/               # Configuration des plugins
│       ├── bufferline.lua
│       ├── catppuccin.lua
│       ├── copilot.lua
│       ├── gitsigns.lua
│       ├── indent-blankline.lua
│       ├── lsp-zero.lua
│       ├── markdown-preview.lua
│       ├── minimap.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       └── ...
```

## 🔧 Personnalisation

### Ajouter un nouveau plugin

1. Créez un fichier dans `lua/plugins/nom-du-plugin.lua`
2. Configurez le plugin selon le format Lazy.nvim :

```lua
return {
  {
    "author/plugin-name",
    config = function()
      -- Configuration du plugin
    end
  }
}
```

### Modifier les raccourcis

Éditez `lua/custom/mappings.lua` :

```lua
Map('n', '<leader>nn', ':nouvelle-commande<CR>', { desc = 'Description' })
```

### Ajouter des options

Éditez `lua/custom/options.lua` :

```lua
vim.opt.nouvelle_option = true
```

## 🐛 Résolution de Problèmes

### Plugins non installés
```vim
:Lazy sync
```

### Serveurs LSP manquants
```vim
:Mason
```

### Mise à jour Treesitter
```vim
:TSUpdate
```

### Installation de code-minimap (si nécessaire)
```bash
cargo install --locked code-minimap
```

### Problèmes avec Markdown Preview
Si la prévisualisation Markdown ne fonctionne pas :
```bash
# Installation manuelle des dépendances Node.js
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
npm install

# Test de fonctionnement
nvim test.md
:MarkdownPreview
```

### Redémarrer LSP Lua (si warnings)
```vim
:LspRestart
```

### Nettoyage complet
```vim
:Lazy clean
:Mason uninstall-all
```

## 📚 Ressources

- [Documentation Neovim](https://neovim.io/doc/)
- [Lazy.nvim Guide](https://github.com/folke/lazy.nvim)
- [GitHub Copilot](https://github.com/features/copilot)
- [Catppuccin Theme](https://catppuccin.com/)

## 🤝 Contribution

N'hésitez pas à proposer des améliorations ou signaler des problèmes !

## 📄 Licence

Cette configuration est distribuée sous licence MIT.
