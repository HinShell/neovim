return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" }, -- Charger à la première commande
    keys = {
      { "<leader>e", group = "🗂️  Explorateur" },
      { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Explorer NeoTree" },
      { "<leader>ef", "<cmd>Neotree focus<CR>", desc = "Focus explorateur" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
  }
}
