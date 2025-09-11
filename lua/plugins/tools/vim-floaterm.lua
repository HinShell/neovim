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
      
      -- Fix pour PageUp/PageDown dans le terminal
      { "<PageUp>", "<C-\\><C-n><PageUp>i", mode = "t", desc = "Page Up in terminal" },
      { "<PageDown>", "<C-\\><C-n><PageDown>i", mode = "t", desc = "Page Down in terminal" },
      
      -- Alternatives avec Shift+Arrow pour scroll
      { "<S-Up>", "<C-\\><C-n><C-u>i", mode = "t", desc = "Scroll up in terminal" },
      { "<S-Down>", "<C-\\><C-n><C-d>i", mode = "t", desc = "Scroll down in terminal" },
      
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
      
      -- Configuration pour capturer les touches spéciales
      vim.g.floaterm_keymap_toggle = '<C-@>'
      vim.g.floaterm_keymap_new = '<leader>tn'
      vim.g.floaterm_keymap_kill = '<leader>tk'
    end,
    config = function()
      -- Autocommande pour configurer le terminal mode
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "floaterm",
        callback = function()
          -- Permettre le scroll avec la molette
          vim.keymap.set('t', '<ScrollWheelUp>', '<C-\\><C-n><ScrollWheelUp>', { buffer = true, silent = true })
          vim.keymap.set('t', '<ScrollWheelDown>', '<C-\\><C-n><ScrollWheelDown>', { buffer = true, silent = true })
          
          -- Permettre Ctrl+C pour interrompre
          vim.keymap.set('t', '<C-c>', '<C-c>', { buffer = true, silent = true })
          
          -- Escape pour sortir du terminal mode
          vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = true, silent = true })
        end,
      })
    end,
  },
}
