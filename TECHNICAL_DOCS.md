# 📚 Documentation Technique - Configuration Neovim

> Guide technique approfondi pour développeurs et contributeurs

## 🔧 Architecture Interne

### 🗂️ Structure Modulaire

La configuration suit une architecture modulaire stricte pour faciliter la maintenance et l'évolutivité :

```
lua/
├── config/          # Configuration de base Neovim
│   ├── autocmds.lua # Autocommandes et événements
│   ├── keymaps.lua  # Mappings génériques
│   ├── lazy.lua     # Bootstrap et configuration Lazy.nvim
│   └── options.lua  # Options vim.opt.*
├── plugins/         # Configuration des plugins
│   ├── ai/         # Plugins d'intelligence artificielle
│   ├── editor/     # Plugins d'édition de code
│   ├── git/        # Intégration Git
│   ├── lsp/        # Language Server Protocol
│   ├── navigation/ # Navigation et exploration
│   ├── tools/      # Outils et utilitaires
│   └── ui/         # Interface utilisateur
└── utils/          # Utilitaires et helpers Lua
    ├── functions.lua # Fonctions helper
    └── init.lua     # Point d'entrée utils
```

### 🚀 Lazy Loading Strategy

#### Événements de Chargement

```lua
-- Stratégies de chargement optimisées
{
  event = "VeryLazy",           -- Après interface chargée
  event = { "BufReadPre", "BufNewFile" }, -- Ouverture fichier
  event = "InsertEnter",        -- Mode insertion
  cmd = { "Command" },          -- Commande spécifique
  keys = { "<leader>x" },       -- Raccourci spécifique
  ft = { "lua", "python" },     -- Type de fichier
}
```

#### Performance Metrics

```lua
-- Temps de chargement typiques
Init Load:     ~20ms    -- Configuration de base
Plugin Load:   ~30ms    -- Plugins lazy-loadés
First Buffer:  ~50ms    -- Premier buffer
Full Ready:    ~80ms    -- Tout chargé
```

## 🔌 Plugins - Configuration Détaillée

### 🤖 Intelligence Artificielle

#### Copilot.lua
```lua
{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,          -- ms avant suggestion
      keymap = {
        accept = "<M-l>",     -- Alt+L
        next = "<M-]>",       -- Alt+]
        prev = "<M-[>",       -- Alt+[
        dismiss = "<C-]>",    -- Ctrl+]
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",      -- Alt+Enter
      },
      layout = {
        position = "bottom",   -- bottom | top | left | right
        ratio = 0.4,
      },
    },
    -- Désactiver pour certains types de fichiers
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      ["."] = false,
    },
  },
}
```

#### CopilotChat.nvim
```lua
{
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    question_header = "## User ",
    answer_header = "## Copilot ",
    error_header = "## Error ",
    prompts = {
      Explain = {
        prompt = "/COPILOT_EXPLAIN Écris une explication du code sélectionné en français.",
      },
      Review = {
        prompt = "/COPILOT_REVIEW Révise le code sélectionné et suggère des améliorations.",
      },
      Fix = {
        prompt = "/COPILOT_GENERATE Il y a un problème dans ce code. Réécris le code pour le corriger.",
      },
      Optimize = {
        prompt = "/COPILOT_GENERATE Optimise le code sélectionné pour améliorer les performances et la lisibilité.",
      },
    },
  },
  keys = {
    { "<leader>cch", "<cmd>CopilotChatHistory<cr>", desc = "Chat History" },
    { "<leader>cct", "<cmd>CopilotChatToggle<cr>", desc = "Chat Toggle" },
    { "<leader>ccr", "<cmd>CopilotChatReset<cr>", desc = "Chat Reset" },
  },
}
```

### 🎨 Interface Utilisateur

#### Catppuccin Theme
```lua
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = true,
      mini = true,
      treesitter = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
    },
  },
}
```

#### Lualine Configuration
```lua
{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin",
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha" } },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
      lualine_x = {
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = { fg = "#ff9e64" },
        },
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = { fg = "#ff9e64" },
        },
        { "encoding" },
        { "fileformat" },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
```

### 🔍 Navigation

#### Telescope Configuration
```lua
{
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            require("telescope.builtin").find_files({ no_ignore = true, default_text = line })
          end,
          ["<a-h>"] = function()
            local action_state = require("telescope.actions.state")
            local line = action_state.get_current_line()
            require("telescope.builtin").find_files({ hidden = true, default_text = line })
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
    },
  },
}
```

### ⚙️ LSP Configuration

#### LSP-Zero Setup
```lua
{
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    
    lsp_zero.on_attach(function(client, bufnr)
      -- Keymaps LSP
      local opts = { buffer = bufnr, remap = false }
      
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)
    
    -- Configuration Mason
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls", "yamlls" },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end,
      }
    })
  end,
}
```

## 🎛️ Configuration Avancée

### 📝 Autocommandes

#### Optimisations Performance
```lua
-- Désactiver providers non utilisés
local utils = require("utils")

utils.augroup("disable_providers", function(augroup)
  vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup,
    callback = function()
      vim.g.loaded_perl_provider = 0
      vim.g.loaded_ruby_provider = 0
      vim.g.python3_host_prog = nil  -- Désactiver python3
      vim.g.node_host_prog = nil     -- Désactiver node
    end,
  })
end)
```

#### Formatage Automatique
```lua
utils.augroup("format_on_save", function(augroup)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
      -- Format seulement si LSP attaché
      if #vim.lsp.get_clients({ bufnr = 0 }) > 0 then
        vim.lsp.buf.format({ async = false })
      end
    end,
  })
end)
```

#### Gestion de Session
```lua
utils.augroup("session_management", function(augroup)
  -- Restaurer position curseur
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    pattern = "*",
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
        vim.api.nvim_win_set_cursor(0, mark)
      end
    end,
  })
  
  -- Highlight yank temporaire
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({ timeout = 400 })
    end,
  })
end)
```

### ⚙️ Options Avancées

#### Performance Tuning
```lua
-- Configuration mémoire et performance
vim.opt.updatetime = 250        -- Réduction délai événements
vim.opt.timeoutlen = 500        -- Timeout raccourcis
vim.opt.ttimeoutlen = 10        -- Timeout séquences touches
vim.opt.synmaxcol = 200         -- Limite syntaxe par ligne
vim.opt.lazyredraw = true       -- Pas de redraw pendant macros
vim.opt.ttyfast = true          -- Terminal rapide

-- Gestion mémoire
vim.opt.hidden = true           -- Buffers cachés
vim.opt.history = 1000          -- Historique commandes
vim.opt.undolevels = 1000       -- Niveaux undo
vim.opt.maxmempattern = 1000    -- Mémoire pour patterns
```

#### Interface Optimisée
```lua
-- Configuration visuelle
vim.opt.termguicolors = true    -- Couleurs 24-bit
vim.opt.signcolumn = "yes"      -- Colonne signes toujours visible
vim.opt.number = true           -- Numéros de ligne
vim.opt.relativenumber = true   -- Numéros relatifs
vim.opt.cursorline = true       -- Highlight ligne courante
vim.opt.colorcolumn = "80"      -- Colonne limite

-- Fenêtres et splits
vim.opt.splitbelow = true       -- Split horizontal vers bas
vim.opt.splitright = true       -- Split vertical vers droite
vim.opt.equalalways = false     -- Pas d'égalisation auto fenêtres
```

## 🔍 Debugging et Diagnostics

### 🐛 Profiling Performance

#### Startup Time Analysis
```bash
# Analyse temps de démarrage
nvim --startuptime startup.log +qall
cat startup.log | sort -k2 -n | tail -20

# Profile plugins Lazy
# Dans Neovim : :Lazy profile
```

#### Memory Usage
```lua
-- Fonction pour surveiller mémoire
function CheckMemoryUsage()
  local mem = vim.loop.resident_set_memory()
  print(string.format("Memory usage: %.2f MB", mem / 1024 / 1024))
end

-- Ajouter à keymaps pour test
vim.keymap.set("n", "<leader>dm", CheckMemoryUsage, { desc = "Debug Memory" })
```

### 📊 Health Checks

#### Configuration Health
```bash
# Vérifications santé globales
:checkhealth

# Vérifications spécifiques
:checkhealth lazy
:checkhealth lsp
:checkhealth treesitter
:checkhealth telescope
```

#### LSP Diagnostics
```bash
# Informations LSP
:LspInfo           # Serveurs actifs
:LspLog            # Logs LSP
:Mason             # Gestionnaire serveurs

# Debug LSP
:lua vim.lsp.set_log_level("debug")
:LspLog
```

## 🔧 Maintenance et Mise à Jour

### 📦 Gestion des Plugins

#### Commandes Lazy.nvim
```bash
# Interface Lazy
:Lazy              # Interface principale
:Lazy update       # Mise à jour tous plugins
:Lazy sync         # Sync avec lazy-lock.json
:Lazy clean        # Supprime plugins non utilisés
:Lazy profile      # Profile performance

# Gestion individuelle
:Lazy update telescope.nvim
:Lazy reload lualine.nvim
```

#### Lock File Management
```bash
# Le fichier lazy-lock.json verrouille les versions
# Commit ce fichier pour reproductibilité

# Mise à jour contrôlée
:Lazy restore      # Restaure versions lockées
:Lazy update       # Met à jour et update lock
```

### 🔄 Migration et Backup

#### Backup Configuration
```bash
#!/bin/bash
# Script backup automatique

BACKUP_DIR="$HOME/.config/nvim-backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/nvim_backup_$DATE.tar.gz" \
    -C "$HOME/.config" nvim

echo "Backup créé: $BACKUP_DIR/nvim_backup_$DATE.tar.gz"
```

#### Migration Script
```lua
-- Script migration configuration
local M = {}

function M.migrate_keymaps()
  -- Migration anciens mappings vers which-key
  local old_maps = vim.api.nvim_get_keymap('n')
  for _, map in ipairs(old_maps) do
    if map.lhs:match('<leader>') and not map.desc then
      print("Mapping sans description:", map.lhs, "->", map.rhs)
    end
  end
end

return M
```

## 📈 Métriques et Monitoring

### ⏱️ Performance Metrics

```lua
-- Utils pour mesurer performance
local M = {}

function M.measure_startup()
  local start_time = vim.fn.reltime()
  
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      local end_time = vim.fn.reltime()
      local duration = vim.fn.reltimestr(vim.fn.reltime(start_time, end_time))
      print(string.format("Startup time: %s seconds", duration))
    end,
  })
end

function M.plugin_load_times()
  -- Affiche temps de chargement plugins
  local lazy = require("lazy")
  for name, plugin in pairs(lazy.plugins()) do
    if plugin._.loaded then
      print(string.format("%s: loaded", name))
    end
  end
end

return M
```

### 📊 Usage Statistics

```lua
-- Tracking utilisation features
local stats = {
  telescope_searches = 0,
  lsp_actions = 0,
  copilot_accepts = 0,
}

-- Hooks pour tracking
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    stats.telescope_searches = stats.telescope_searches + 1
  end,
})

-- Export stats
function ShowStats()
  print(vim.inspect(stats))
end
```

---

## 🎯 Roadmap et Évolution

### 🚀 Fonctionnalités Planifiées

- [ ] **Session Management** avec persistence.nvim
- [ ] **Formatage avancé** avec conform.nvim  
- [ ] **Debug intégré** avec nvim-dap
- [ ] **Tests** avec neotest
- [ ] **Database** support avec vim-dadbod

### 🔄 Améliorations Continues

- [ ] **Performance** : Réduction temps démarrage < 50ms
- [ ] **Memory** : Optimisation usage mémoire
- [ ] **Plugins** : Évaluation nouveaux plugins
- [ ] **LSP** : Support langages additionnels

Cette documentation technique évolue avec la configuration. Consultez les commits pour historique des changements.

---

<div align="center">

**📚 Documentation Technique**

*Configuration Neovim - Guide Développeur*

</div>
