return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua", -- lazy-load sur la commande
    opts = function()
      local fzf = require("fzf-lua")
      fzf.setup({
        files = {
          -- Utiliser fd au lieu de find
          cmd = "fd --type f --hidden --follow --exclude .git",
        },
      })
    end,
  }
}
