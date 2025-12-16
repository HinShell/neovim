return {
  {
    -- Nom : vim-floaterm
    -- Adresse : https://github.com/voldikss/vim-floaterm
    'voldikss/vim-floaterm',
    cmd = { 
      "FloatermToggle", "FloatermNew", "FloatermPrev", "FloatermNext", 
      "FloatermKill", "FloatermSend", "FloatermFirst", "FloatermLast" 
    },
    keys = {
      -- Mappings de base
      { "<leader>tf", "<cmd>FloatermToggle<cr>", desc = "Toggle terminal" },
      { "<leader>tn", "<cmd>FloatermNew<cr>", desc = "New terminal" },
      { "<leader>tk", "<cmd>FloatermKill<cr>", desc = "Kill terminal" },
      { "<leader>tp", "<cmd>FloatermPrev<cr>", desc = "Previous terminal" },
      { "<leader>tN", "<cmd>FloatermNext<cr>", desc = "Next terminal" },
      
      -- Raccourcis rapides  
      { "<C-@>", "<cmd>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Toggle terminal" },
      { "<C-é>", "<cmd>FloatermNext<CR>", mode = "t", desc = "Next terminal" },
      { "<C-&>", "<cmd>FloatermPrev<CR>", mode = "t", desc = "Previous terminal" },
      
      -- Fix pour PageUp/PageDown dans le terminal (scroll naturel)
      { "<PageUp>", "<C-\\><C-n><C-u>i", mode = "t", desc = "Page Up in terminal" },
      { "<PageDown>", "<C-\\><C-n><C-d>i", mode = "t", desc = "Page Down in terminal" },
      
      -- Alternatives avec Shift+Arrow pour scroll
      { "<S-Up>", "<C-\\><C-n><C-u>i", mode = "t", desc = "Scroll up in terminal" },
      { "<S-Down>", "<C-\\><C-n><C-d>i", mode = "t", desc = "Scroll down in terminal" },
      
      -- Alternatives avec Ctrl+Arrow pour scroll (plus naturel)
      { "<C-Up>", "<C-\\><C-n><C-u>i", mode = "t", desc = "Scroll up in terminal" },
      { "<C-Down>", "<C-\\><C-n><C-d>i", mode = "t", desc = "Scroll down in terminal" },
      
      -- Terminaux spécialisés
      { "<leader>tg", "<cmd>FloatermNew --title=Lazygit --width=0.9 --height=0.9 lazygit<cr>", desc = "Launch Lazygit" },
      { "<leader>td", "<cmd>FloatermNew --title=Lazydocker --width=0.9 --height=0.9 lazydocker<cr>", desc = "Launch Lazydocker" },
      { "<leader>tb", "<cmd>FloatermNew --title=Btop --width=0.9 --height=0.9 btop<cr>", desc = "Launch Btop" },
      { "<leader>ty", "<cmd>FloatermNew --title=Yazi --width=0.9 --height=0.9 yazi<cr>", desc = "Launch Yazi" },
      { "<leader>tt", "<cmd>FloatermNew --title=Terminal --width=0.9 --height=0.9<cr>", desc = "Launch Terminal" },
      { "<leader>tc", "<cmd>FloatermNew --title=CmdLine --width=0.9 --height=0.2<cr>", desc = "Launch Commandline" },
    },
    init = function()
      vim.g.floaterm_title = "CmdLine($1|$2)"
      vim.g.floaterm_titleposition = "right"
      vim.g.floaterm_position = "bottom"
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_autoclose = 1
      
      -- Améliorer le comportement du terminal
      vim.g.floaterm_shell = vim.o.shell
      vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
      vim.g.floaterm_opener = 'edit'
      
      -- DÉSACTIVER les keymaps globaux de floaterm pour éviter la capture de leader
      vim.g.floaterm_keymap_toggle = '<F1>'     -- Utiliser une touche inutilisée
      vim.g.floaterm_keymap_new = '<F2>'        -- Utiliser une touche inutilisée  
      vim.g.floaterm_keymap_kill = '<F3>'       -- Utiliser une touche inutilisée
    end,
    config = function()
      -- Autocommande pour configurer le terminal mode
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "floaterm",
        callback = function()
          -- Configuration pour défilement naturel
          local opts = { buffer = true, silent = true }
          
          -- Scroll avec la molette de souris
          vim.keymap.set('t', '<ScrollWheelUp>', '<C-\\><C-n><C-y>i', opts)
          vim.keymap.set('t', '<ScrollWheelDown>', '<C-\\><C-n><C-e>i', opts)
          
          -- Permettre Ctrl+C pour interrompre
          vim.keymap.set('t', '<C-c>', '<C-c>', opts)
          
          -- Escape pour sortir du terminal mode vers mode normal
          vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
          
          -- Navigation window
          vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { buffer = true, silent = true, desc = "Window commands in terminal" })
          
          -- Scroll ligne par ligne (alternatives fiables)
          vim.keymap.set('t', '<C-y>', '<C-\\><C-n><C-y>i', { buffer = true, silent = true, desc = "Scroll up one line" })
          vim.keymap.set('t', '<C-e>', '<C-\\><C-n><C-e>i', { buffer = true, silent = true, desc = "Scroll down one line" })
          
          -- Scroll avec Ctrl+Shift (plus fiable sur macOS)
          vim.keymap.set('t', '<C-S-k>', '<C-\\><C-n><C-y>i', { buffer = true, silent = true, desc = "Scroll up one line" })
          vim.keymap.set('t', '<C-S-j>', '<C-\\><C-n><C-e>i', { buffer = true, silent = true, desc = "Scroll down one line" })
          
          -- Scroll avec fonction keys (toujours disponibles)
          vim.keymap.set('t', '<F9>', '<C-\\><C-n><C-y>i', { buffer = true, silent = true, desc = "Scroll up one line" })
          vim.keymap.set('t', '<F10>', '<C-\\><C-n><C-e>i', { buffer = true, silent = true, desc = "Scroll down one line" })
        end,
      })
    end,
  },
}
