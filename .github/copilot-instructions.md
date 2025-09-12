# Copilot Instructions - Neovim Configuration

## Architecture Overview

This is a modern, performance-optimized Neovim configuration using **Lazy.nvim** with aggressive lazy loading. The architecture follows a strict modular pattern:

- `lua/config/` - Core Neovim configuration (options, keymaps, autocmds)
- `lua/plugins/` - Plugin configurations organized by function (ai/, editor/, lsp/, navigation/, tools/, ui/)
- `lua/utils/` - Reusable Lua helper functions and utilities

**Critical**: All plugins MUST use lazy loading (`event`, `cmd`, `keys`, `ft`) - startup time target is <50ms.

## Key Patterns & Conventions

### Plugin Configuration Structure
```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- Always specify loading trigger
    dependencies = { "required/plugin" },
    keys = { { "<leader>x", "<cmd>Command<cr>", desc = "Description" } },
    opts = { /* configuration */ },
  },
}
```

### Leader Key Architecture
- Leader: `<Space>` (defined in `lua/config/lazy.lua`)
- **Terminal mode exception**: Space key capture is explicitly prevented in `lua/config/terminal.lua`
- All mappings must include `desc` for which-key integration

### LSP & Language Support
- Use `lsp-zero.nvim` for simplified LSP setup
- Auto-installation via Mason in `ensure_installed` arrays
- Current servers: `lua_ls`, `bashls`, `yamlls` - extend this list when adding language support

### Utils Pattern
- Access via `local utils = require("utils")` 
- Use `utils.map()` for consistent keymap creation
- Use `utils.augroup()` for organized autocommands

## Development Workflows

### Adding New Plugins
1. Create file in appropriate `lua/plugins/category/` directory
2. Follow lazy loading pattern - never load on startup unless critical
3. Add keys with descriptions for which-key integration
4. Test with `:Lazy profile` to verify no startup impact

### Performance Validation
```bash
nvim --startuptime startup.log +qall  # Measure startup time
# In Neovim: :Lazy profile              # Check plugin load times
```

### Configuration Testing
Use `minimal.lua` for isolated testing:
```bash
nvim -u ~/.config/nvim/minimal.lua
```

## Critical Integration Points

### Copilot Integration
- Uses `zbirenbaum/copilot.lua` (NOT vim plugin)
- Chat integration via `CopilotChat.nvim`
- Accept: `<M-l>`, Navigate: `<M-[>/<M-]>`

### Terminal Configuration
**Special handling**: `lua/config/terminal.lua` prevents leader key capture in terminal mode. When modifying terminal-related plugins, ensure Space key remains functional.

### Theme Integration
Catppuccin theme is globally integrated across:
- Core colorscheme
- Lualine theme
- Buffer/tab styling  
- Plugin highlight groups

## File Organization Rules

- **Never** add configuration to `init.lua` directly - use modular imports
- Plugin categories: ai/, editor/, git/, lsp/, navigation/, tools/, ui/
- One plugin per file, named after the main plugin
- Utils go in `lua/utils/functions.lua`

## Common Maintenance

### Health Checks
```
:checkhealth lazy
:LspInfo
:Mason
```

### Updates
```
:Lazy update    # Update all plugins
:Lazy clean     # Remove unused
:Lazy restore   # Reset to lazy-lock.json versions
```

This configuration prioritizes performance, modularity, and developer experience. Always test changes don't regress startup time.