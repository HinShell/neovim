return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },


    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <CR>", {})
      -- Configuration du plugin markdown-preview
      vim.g.mkdp_auto_start = 0         -- N'ouvre pas automatiquement la prévisualisation
      vim.g.mkdp_auto_close = 1         -- Ferme automatiquement la prévisualisation à la fermeture du buffer
      vim.g.mkdp_refresh_slow = 0       -- Actualisation en temps réel
      vim.g.mkdp_command_for_global = 0 -- Disponible seulement pour les fichiers markdown
      vim.g.mkdp_open_to_the_world = 0  -- Prévisualisation accessible seulement en local
      vim.g.mkdp_open_ip = ''           -- IP d'écoute (vide = localhost)
      vim.g.mkdp_browser = ''           -- Navigateur par défaut (vide = navigateur par défaut)
      vim.g.mkdp_echo_preview_url = 0   -- N'affiche pas l'URL dans la ligne de commande
      vim.g.mkdp_browserfunc = ''       -- Fonction personnalisée pour ouvrir le navigateur
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,     -- Synchronisation du scroll activée
        sync_scroll_type = 'middle', -- Type de synchronisation
        hide_yaml_meta = 1,          -- Cache les métadonnées YAML
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false, -- Contenu non éditable dans la prévisualisation
        disable_filename = 0,     -- Affiche le nom du fichier
        toc = {}
      }
      vim.g.mkdp_markdown_css = '' -- CSS personnalisé (vide = CSS par défaut)
      vim.g.mkdp_highlight_css = '' -- CSS pour la coloration syntaxique
      vim.g.mkdp_port = '' -- Port personnalisé (vide = port aléatoire)
      vim.g.mkdp_page_title = '「${name}」' -- Titre de la page
      vim.g.mkdp_filetypes = { 'markdown' } -- Types de fichiers supportés
      vim.g.mkdp_theme = 'dark' -- Thème (dark ou light)

      -- Raccourcis clavier pour markdown-preview
      local function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.keymap.set(mode, lhs, rhs, options)
      end

      -- Mappings spécifiques aux fichiers markdown
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview", buffer = true })
          map("n", "<leader>ms", "<cmd>MarkdownPreview<CR>", { desc = "Start Markdown Preview", buffer = true })
          map("n", "<leader>me", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Markdown Preview", buffer = true })
        end,
      })
    end,
  },
}
