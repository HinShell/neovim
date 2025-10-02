return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", group = "🗂️  Explorateur" },
      { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Explorer NeoTree" },
      { "<leader>ef", "<cmd>Neotree focus<CR>", desc = "Focus explorateur" },
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
  }
}
