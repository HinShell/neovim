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
    config = function()
      require("neo-tree").setup({
        use_libuv_file_watcher = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          use_libuv_file_watcher = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "none", -- Évite les conflits avec leader
          },
        },
        default_component_configs = {
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "",
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            }
          },
        },
      })
    end,
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


-- dependencies = {
--   "nvim-lua/plenary.nvim",
--   "nvim-tree/nvim-web-devicons",
--   "MunifTanjim/nui.nvim",
--   {
--     "s1n7ax/nvim-window-picker",
--     version = "2.*",
--     config = function()
--       require("window-picker").setup({
--         filter_rules = {
--           include_current_win = false,
--           autoselect_one = true,
--           bo = {
--             filetype = { "neo-tree", "neo-tree-popup", "notify" },
--             buftype = { "terminal", "quickfix" },
--           },
--         },
--       })
--     end,
--   },
-- },
--   }
-- }
