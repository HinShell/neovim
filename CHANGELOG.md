# Changelog

All notable changes to this Neovim configuration project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2025-10-08

### 🚀 Nouvelles Fonctionnalités
- **Explorateur de fichiers** : Migration de nvim-tree vers Neo-tree pour une expérience moderne
- **Plugin Store** : Ajout de `store.nvim` avec `markview.nvim` pour la gestion des plugins
- **Format on Save** : Nouvelle option dans MegaToggler pour activer/désactiver le formatage automatique

### ✨ Améliorations
- **Interface utilisateur** : Configuration améliorée de Noice avec intégration nvim-notify
- **Configuration** : Ajout d'un fichier `.editorconfig` pour la cohérence du formatage
- **Raccourcis clavier** : Réorganisation des mappings vers les fichiers de plugins respectifs
- **Dépendances** : Mise à jour de tous les plugins vers leurs versions les plus récentes

### 🔧 Changements Techniques
- **Neo-tree** : Remplacement complet de nvim-tree avec nouveaux raccourcis (`<leader>ee`, `<leader>ef`)
- **Bufferline** : Suppression de la configuration spécifique à NvimTree
- **Noice** : Configuration LSP améliorée avec support markdown et documentation
- **MegaToggler** : Intégration du formatage automatique avec gestion des augroups

### 📦 Plugins Ajoutés
- `nvim-neo-tree/neo-tree.nvim` - Explorateur de fichiers moderne
- `alex-popov-tech/store.nvim` - Gestionnaire de plugins avec interface markdown
- `OXY2DEV/markview.nvim` - Rendu markdown amélioré (dépendance de Store)
- `rcarriga/nvim-notify` - Système de notifications élégant

### 📦 Plugins Supprimés
- `nvim-tree/nvim-tree.lua` - Remplacé par Neo-tree

### 🐛 Corrections
- **Which-key** : Suppression des raccourcis obsolètes de nvim-tree
- **Configuration** : Nettoyage des mappings de touches redondants
- **Bufferline** : Suppression des offsets et filtres spécifiques à nvim-tree

## [1.0.0] - 2025-12-09

### 🚀 Major Initial Release
Complete modern Neovim configuration with Lazy.nvim, LSP integration, and AI-powered development tools.

### ✨ Added
- **Core Configuration**: Complete Neovim setup with Lazy.nvim plugin manager
- **AI Integration**: GitHub Copilot with native Lua integration and chat support
- **LSP Support**: Comprehensive Language Server Protocol setup with Mason auto-installation
- **UI Enhancement**: Modern interface with Catppuccin theme, Lualine statusline, and enhanced bufferline
- **Navigation**: Telescope fuzzy finder and nvim-tree file explorer
- **Terminal Integration**: Enhanced terminal support with vim-floaterm and improved key handling
- **Documentation**: Comprehensive README, technical documentation, and AI assistant prompts
- **Plugin Ecosystem**: Curated selection of 38+ plugins with optimized lazy loading

### 🎯 Features by Category

#### **🤖 AI & Development**
- GitHub Copilot native integration (`zbirenbaum/copilot.lua`)
- Copilot Chat for interactive AI assistance
- GitHub Expert and Neovim Expert assistant prompts
- Intelligent code completion and suggestions

#### **🎨 User Interface**
- Catppuccin colorscheme with consistent theme integration
- Lualine statusline with Git integration and LSP information
- Enhanced bufferline with slant separators and hover effects
- Which-key integration for discoverable keybindings
- Noice.nvim for elegant notifications and command-line

#### **🔧 Language Support**
- LSP-Zero for simplified Language Server setup
- Mason for automatic LSP server installation
- Treesitter for enhanced syntax highlighting
- Auto-completion with nvim-cmp
- Support for Lua, Bash, YAML, and extensible for other languages

#### **📁 Navigation & File Management**
- Telescope for fuzzy finding files, buffers, and content
- nvim-tree for file system exploration
- Advanced search capabilities with live grep
- Recent files and help tag navigation

#### **⚙️ Development Tools**
- Markdown preview with real-time rendering
- Git integration with gitsigns for diff visualization
- Terminal management with floaterm
- Code minimap for file overview
- Trouble.nvim for diagnostics management

#### **✏️ Editing Enhancement**
- Intelligent auto-pairs for brackets and quotes
- Advanced commenting with treesitter context awareness
- Surround text manipulation
- Indent guides with scope highlighting

### 🔧 Technical Improvements
- **Performance**: Aggressive lazy loading targeting <50ms startup time
- **Architecture**: Modular Lua configuration with clear separation of concerns
- **Terminal Handling**: Special configuration to prevent leader key capture in terminal mode
- **Utils Pattern**: Reusable helper functions for consistent development
- **Module Loading**: Optimized utils modules loading system for better performance (commit 1ffb7f4)
- **UI Enhancement**: Added MegaToggler plugin for quick settings toggles (commit eb11142)

### 📚 Documentation
- Comprehensive README with installation and usage guides
- Technical documentation for developers and contributors
- AI assistant prompts for Git/GitHub and Neovim expertise
- Inline code documentation and comments

### 🛠️ Configuration Management
- Comprehensive .gitignore for clean repository management
- Cross-platform support (macOS, Windows, Linux)
- Environment management with Node.js integration
- Plugin version locking with lazy-lock.json

### 🔄 Refactoring & Organization
- Modular plugin organization by category (ai/, editor/, lsp/, navigation/, tools/, ui/)
- Centralized keymap management with which-key integration
- Autocommand organization with proper grouping
- Clean separation between core config and plugin configurations

### 🐛 Fixes & Improvements
- Fixed terminal leader key capture issues
- Resolved deprecated LSP function usage
- Improved yank highlighting timing
- Enhanced Git integration and file handling
- Cleaned up obsolete configuration files

### 📦 Plugin Ecosystem
**38 carefully selected plugins with optimized loading:**

**Core Management:**
- lazy.nvim (Plugin manager)
- plenary.nvim (Lua utilities)

**AI & Completion:**
- copilot.lua, copilot-cmp, CopilotChat.nvim
- nvim-cmp with multiple sources
- LuaSnip for snippets

**Language Support:**
- nvim-lspconfig, mason.nvim, mason-lspconfig.nvim
- lsp-zero.nvim for simplified setup
- nvim-treesitter with textobjects

**UI & Themes:**
- catppuccin colorscheme
- lualine.nvim statusline
- bufferline.nvim for buffer tabs
- which-key.nvim for key discovery
- noice.nvim for elegant notifications
- indent-blankline.nvim for visual guides
- megatoggler for quick settings toggles

**Navigation & Search:**
- telescope.nvim with fzf-native
- nvim-tree.lua file explorer

**Development Tools:**
- gitsigns.nvim for Git integration
- trouble.nvim for diagnostics
- markdown-preview.nvim
- vim-floaterm for terminal management
- minimap.vim for code overview

**Editing Enhancement:**
- nvim-autopairs, nvim-surround
- Comment.nvim with treesitter context
- nvim-ts-context-commentstring

### 🎯 Performance Metrics
- Startup time: Optimized for <50ms target
- Plugin loading: 92% lazy-loaded (35/38 plugins)
- Memory footprint: Minimal with aggressive lazy loading
- Loading strategy: Event-driven and command-based activation

---

## Development History

### Build Process
1. **Initial Setup** (8137a70): Foundation with Lazy.nvim
2. **UI Enhancement** (a5f93bd): Bufferline improvements  
3. **Feature Addition** (5cf1764): Markdown preview capability
4. **Architecture Refactor** (4085646): Modular plugin organization
5. **Performance Optimization** (8355b59): Lazy loading implementation
6. **Keymap Migration** (e5bd3cd): Plugin-specific keymap organization
7. **LSP Enhancement** (a9debcb): Lua LSP configuration
8. **Terminal Improvements** (305ece0, 51b72c2): Enhanced terminal support
9. **AI Integration** (60779d4): GitHub Copilot setup
10. **Documentation** (c097b02, 2964fee): Expert assistant prompts
11. **Final Polish** (483e9d9): Comprehensive .gitignore

### Configuration Philosophy
This configuration prioritizes:
- **Developer Experience**: Intuitive keybindings and discoverable features
- **Performance**: Fast startup and responsive editing
- **Modularity**: Maintainable and extensible architecture  
- **Modern Tools**: Latest Neovim features and ecosystem plugins
- **AI-Enhanced Workflow**: Integrated AI assistance for productivity

---

*This changelog is automatically generated from Git commit history and reflects the actual development progression of the configuration.*