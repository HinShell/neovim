return {
  {
    -- Nom : minimap.vim
    -- Adresse : https://github.com/wfxr/minimap.vim
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
    config = function()
      -- Configuration de la minimap
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 0  -- Ne démarre pas automatiquement
      vim.g.minimap_auto_start_win_enter = 0
      vim.g.minimap_highlight_range = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1
      vim.g.minimap_cursor_color = 'MinimapCurrentLine'
      vim.g.minimap_range_color = 'MinimapRange'
      vim.g.minimap_search_color = 'MinimapSearch'
      
      -- Position de la minimap (left ou right)
      vim.g.minimap_left = 0  -- 0 = droite, 1 = gauche
      
      -- Fermeture automatique
      vim.g.minimap_close_filetypes = {'startify', 'netrw', 'vim-plug', 'help', 'dashboard', 'alpha'}
      
      -- Largeur minimale de la fenêtre pour afficher la minimap
      vim.g.minimap_window_width_threshold = 80
    end,
  },
}
