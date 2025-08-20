return {
  {
    -- Nom : Comment.nvim
    -- Adresse : https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local comment = require('Comment')
      comment.setup({
        -- Ajouter un espace après le marqueur de commentaire
        padding = true,
        -- Préserver l'indentation lors du commentaire
        sticky = true,
        -- Ignorer les lignes vides
        ignore = '^$',
        -- Mappings pour le mode normal
        toggler = {
          line = 'gcc',  -- Commenter/décommenter une ligne
          block = 'gbc', -- Commenter/décommenter un bloc
        },
        -- Mappings pour le mode opérateur
        opleader = {
          line = 'gc',   -- Commenter/décommenter avec motion
          block = 'gb',  -- Commenter/décommenter un bloc avec motion
        },
        -- Mappings supplémentaires
        extra = {
          above = 'gcO', -- Ajouter un commentaire au-dessus
          below = 'gco', -- Ajouter un commentaire en dessous
          eol = 'gcA',   -- Ajouter un commentaire à la fin de ligne
        },
        -- Mappings pour le mode visuel
        mappings = {
          basic = true,    -- gcc, gbc, gc[count]{motion}, gb[count]{motion}
          extra = true,    -- gco, gcO, gcA
        },
        -- Hook pour intégrer ts-context-commentstring
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
}
