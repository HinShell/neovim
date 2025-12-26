return {
  {
    "folke/snacks.nvim",
    lazy = false,    -- IMPORTANT: pas de lazy-loading
    priority = 1000, -- IMPORTANT: chargé très tôt
    opts = {
      -- Active/désactive les modules Snacks ici
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      image = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = true }, -- par ex. si tu le veux
      picker = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = true },
      toggle = { enabled = true },
      words = { enabled = false },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
    end,
  }
}
