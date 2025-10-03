return {
  {
    -- Nom : which-key.nvim
    -- Adresse : https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons"
    },
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({
        -- Configuration générale
        preset = "modern",
        delay = 200,
        expand = 1,
        notify = true,

        -- Triggers
        triggers = {
          { "<auto>", mode = "nixsotc" },
          { "a",      mode = { "n", "v" } },
        },

        -- Configuration de l'interface
        win = {
          no_overlap = true,
          border = "rounded",
          padding = { 1, 2 },
          title = true,
          title_pos = "center",
          zindex = 1000,
          wo = {
            winblend = 10,
          },
        },

        -- Configuration de la disposition
        layout = {
          width = { min = 20 },
          spacing = 3,
        },

        -- Icônes
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
          ellipsis = "…",
          mappings = true,
          rules = {},
          colors = true,
          keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "󱊷 ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
          },
        },

        -- Désactiver pour certains types de fichiers
        disable = {
          buftypes = {},
          filetypes = { "TelescopePrompt" },
        },
      })

      -- Configuration des groupes de raccourcis
      wk.add({
        -- Leader mappings
        { "<leader>b", group = "📄 Buffer" },
        { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Liste des buffers" },
        { "<leader>bd", "<cmd>bd<cr>", desc = "Fermer buffer" },
        { "<leader>bD", "<cmd>bd!<cr>", desc = "Forcer fermeture buffer" },
        { "<leader>bn", "<cmd>bnext<cr>", desc = "Buffer suivant" },
        { "<leader>bp", "<cmd>bprevious<cr>", desc = "Buffer précédent" },
        { "<leader>br", "<cmd>e!<cr>", desc = "Recharger buffer" },
        { "<leader>bs", "<cmd>w<cr>", desc = "Sauvegarder buffer" },

        { "<leader>c", group = "💬 Code" },
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions de code" },
        { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Aller à la définition" },
        { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Formater le code" },
        { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Afficher info" },
        { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Renommer" },
        { "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Aide signature" },

        { "<leader>f", group = "🔍 Rechercher" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Rechercher buffers" },
        { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Rechercher commandes" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Rechercher fichiers" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Rechercher dans fichiers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Rechercher aide" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Rechercher raccourcis" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fichiers récents" },
        { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Rechercher mot sous curseur" },

        { "<leader>g", group = "🔀 Git" },
        { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame ligne" },
        { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff fichier" },
        { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Aperçu hunk" },
        { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Hunk suivant" },
        { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Hunk précédent" },
        { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
        { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
        { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage hunk" },

        { "<leader>h", group = "ℹ️  Aide" },
        { "<leader>hc", "<cmd>Telescope commands<cr>", desc = "Commandes" },
        { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Tags d'aide" },
        { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Raccourcis clavier" },
        { "<leader>hm", "<cmd>Telescope man_pages<cr>", desc = "Pages man" },

        { "<leader>l", group = "🔧 LSP" },
        { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Aller à la déclaration" },
        { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Aller à la définition" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Formater" },
        { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implémentation" },
        { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Références" },
        { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Aide signature" },
        { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Définition de type" },

        { "<leader>q", group = "🚪 Quitter" },
        { "<leader>qq", "<cmd>qa<cr>", desc = "Quitter Neovim" },
        { "<leader>qQ", "<cmd>qa!<cr>", desc = "Forcer quitter" },
        { "<leader>qw", "<cmd>wqa<cr>", desc = "Sauver et quitter" },

        { "<leader>s", group = "🔍 Recherche/Remplace" },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Rechercher dans buffer" },
        { "<leader>sc", "<cmd>nohl<cr>", desc = "Effacer surbrillance" },
        { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Recherche globale" },
        { "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Remplacer mot" },
        { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Rechercher chaîne" },

        { "<leader>t", group = "🪟 Terminal/Onglets" },
        { "<leader>tf", "<cmd>FloatermToggle<cr>", desc = "Terminal flottant" },
        { "<leader>tn", "<cmd>FloatermNew<cr>", desc = "Nouveau terminal" },
        { "<leader>tt", "<cmd>terminal<cr>", desc = "Terminal" },

        { "<leader>w", group = "🪟 Fenêtres" },
        { "<leader>wc", "<cmd>close<cr>", desc = "Fermer fenêtre" },
        { "<leader>wh", "<C-w>h", desc = "Aller à gauche" },
        { "<leader>wj", "<C-w>j", desc = "Aller en bas" },
        { "<leader>wk", "<C-w>k", desc = "Aller en haut" },
        { "<leader>wl", "<C-w>l", desc = "Aller à droite" },
        { "<leader>wo", "<cmd>only<cr>", desc = "Fermer autres fenêtres" },
        { "<leader>ws", "<cmd>split<cr>", desc = "Division horizontale" },
        { "<leader>wv", "<cmd>vsplit<cr>", desc = "Division verticale" },
        { "<leader>ww", "<C-w>w", desc = "Changer de fenêtre" },

        -- Mappings pour les modes visuels
        { "<leader>", group = "VISUAL <leader>", mode = { "v" } },
        { "<leader>c", group = "💬 Code", mode = { "v" } },
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Actions de code", mode = { "v" } },
        { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Formater sélection", mode = { "v" } },

        -- Mappings globaux (sans leader)
        { "g", group = "📍 Goto" },
        { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Aller à la définition" },
        { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Aller à la déclaration" },
        { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Aller à l'implémentation" },
        { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Afficher références" },
        { "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Aller au type" },

        { "]", group = "📍 Suivant" },
        { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Diagnostic suivant" },
        { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Hunk Git suivant" },

        { "[", group = "📍 Précédent" },
        { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Diagnostic précédent" },
        { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Hunk Git précédent" },

        { "z", group = "🔍 Plier/Déplier" },
        { "za", desc = "Toggle pli" },
        { "zc", desc = "Fermer pli" },
        { "zo", desc = "Ouvrir pli" },
        { "zR", desc = "Ouvrir tous les plis" },
        { "zM", desc = "Fermer tous les plis" },
      })
    end,
  }
}
