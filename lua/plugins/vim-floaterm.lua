return {
  {
    -- Nom : vim-floaterm
    -- Adresse : https://github.com/voldikss/vim-floaterm
    'voldikss/vim-floaterm',
    lazy = false,
    keys = {
      -- Raccourcis principaux
      { "<leader>tf", "<cmd>FloatermToggle<cr>", desc = "Toggle terminal flottant" },
      { "<leader>tn", "<cmd>FloatermNew<cr>", desc = "Nouveau terminal" },
      { "<leader>tk", "<cmd>FloatermKill<cr>", desc = "Fermer terminal" },
      { "<leader>tp", "<cmd>FloatermPrev<cr>", desc = "Terminal précédent" },
      { "<leader>tN", "<cmd>FloatermNext<cr>", desc = "Terminal suivant" },
      
      -- Raccourcis rapides
      { "<C-\\>", "<cmd>FloatermToggle<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
      { "<F7>", "<cmd>FloatermToggle<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
      
      -- Terminaux spécialisés
      { "<leader>tg", "<cmd>FloatermNew --name=gitui gitui<cr>", desc = "GitUI" },
      { "<leader>th", "<cmd>FloatermNew --name=htop htop<cr>", desc = "Htop" },
      { "<leader>tl", "<cmd>FloatermNew --name=lazygit lazygit<cr>", desc = "LazyGit" },
      { "<leader>tr", "<cmd>FloatermNew --name=ranger ranger<cr>", desc = "Ranger" },
      { "<leader>tb", "<cmd>FloatermNew --name=btop btop<cr>", desc = "Btop" },
      
      -- Node.js et développement
      { "<leader>tnr", "<cmd>FloatermNew --name=node node<cr>", desc = "Node REPL" },
      { "<leader>tns", "<cmd>FloatermNew --name=npm npm start<cr>", desc = "NPM Start" },
      { "<leader>tni", "<cmd>FloatermNew --name=npm npm install<cr>", desc = "NPM Install" },
      
      -- Python
      { "<leader>tpy", "<cmd>FloatermNew --name=python python3<cr>", desc = "Python REPL" },
      { "<leader>tpi", "<cmd>FloatermNew --name=pip pip install<cr>", desc = "Pip Install" },
    },
    
    config = function()
      -- Configuration globale de vim-floaterm
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintype = 'float'
      vim.g.floaterm_position = 'center'
      vim.g.floaterm_title = '   Terminal ($1/$2)   '
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_rootmarkers = { '.project', '.git', '.hg', '.svn', '.root', '.gitignore' }
      vim.g.floaterm_opener = 'edit'
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_autohide = 1
      vim.g.floaterm_autoinsert = true
      vim.g.floaterm_shell = vim.o.shell
      
      -- Configuration des couleurs et de l'apparence
      vim.cmd([[
        highlight Floaterm guibg=#1e1e2e
        highlight FloatermBorder guifg=#cba6f7 guibg=#1e1e2e
        highlight FloatermNC guibg=#11111b
      ]])
      
      -- Auto-commandes pour une meilleure expérience
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "floaterm",
        callback = function()
          -- Désactiver les numéros de ligne dans le terminal
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          
          -- Mappings spécifiques au terminal
          local opts = { buffer = true, silent = true }
          
          -- Navigation entre les terminaux en mode terminal
          vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
          vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
          vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
          vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
          
          -- Sortir du mode terminal
          vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', opts)
          
          -- Toggle rapide
          vim.keymap.set('t', '<C-\\>', '<cmd>FloatermToggle<cr>', opts)
          vim.keymap.set('t', '<F7>', '<cmd>FloatermToggle<cr>', opts)
          
          -- Navigation entre les terminaux flottants
          vim.keymap.set('t', '<A-n>', '<cmd>FloatermNext<cr>', opts)
          vim.keymap.set('t', '<A-p>', '<cmd>FloatermPrev<cr>', opts)
          
          -- Nouveau terminal
          vim.keymap.set('t', '<A-t>', '<cmd>FloatermNew<cr>', opts)
          
          -- Fermer le terminal
          vim.keymap.set('t', '<A-q>', '<cmd>FloatermKill<cr>', opts)
        end,
      })
      
      -- Auto-commande pour entrer automatiquement en mode insertion
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
          if vim.bo.filetype == "floaterm" then
            vim.cmd("startinsert")
          end
        end,
      })
      
      -- Fonctions personnalisées pour des terminaux spécialisés
      local function create_specialized_terminal(name, cmd, width, height)
        width = width or 0.8
        height = height or 0.8
        local command = string.format("FloatermNew --name=%s --width=%s --height=%s %s", name, width, height, cmd or "")
        return command
      end
      
      -- Commandes personnalisées
      vim.api.nvim_create_user_command('FloatermLazygit', function()
        vim.cmd(create_specialized_terminal('lazygit', 'lazygit', 0.9, 0.9))
      end, { desc = "Ouvrir LazyGit dans un terminal flottant" })
      
      vim.api.nvim_create_user_command('FloatermHtop', function()
        vim.cmd(create_specialized_terminal('htop', 'htop', 0.8, 0.8))
      end, { desc = "Ouvrir Htop dans un terminal flottant" })
      
      vim.api.nvim_create_user_command('FloatermRanger', function()
        vim.cmd(create_specialized_terminal('ranger', 'ranger', 0.9, 0.9))
      end, { desc = "Ouvrir Ranger dans un terminal flottant" })
      
      vim.api.nvim_create_user_command('FloatermNode', function()
        vim.cmd(create_specialized_terminal('node', 'node', 0.7, 0.6))
      end, { desc = "Ouvrir Node REPL dans un terminal flottant" })
      
      vim.api.nvim_create_user_command('FloatermPython', function()
        vim.cmd(create_specialized_terminal('python', 'python3', 0.7, 0.6))
      end, { desc = "Ouvrir Python REPL dans un terminal flottant" })
      
      -- Terminal de taille compacte pour les commandes rapides
      vim.api.nvim_create_user_command('FloatermCompact', function()
        vim.cmd("FloatermNew --width=0.6 --height=0.4 --position=bottom")
      end, { desc = "Terminal compact en bas" })
      
      -- Terminal pleine taille pour le développement
      vim.api.nvim_create_user_command('FloatermFullsize', function()
        vim.cmd("FloatermNew --width=0.95 --height=0.95")
      end, { desc = "Terminal pleine taille" })
      
      -- Terminal latéral pour les logs
      vim.api.nvim_create_user_command('FloatermSidebar', function()
        vim.cmd("FloatermNew --width=0.4 --height=0.8 --position=right")
      end, { desc = "Terminal latéral droit" })
    end,
  },
}
