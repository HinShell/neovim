return {
  {
    -- Nom : nvim-tree.lua
    -- Adresse : https://github.com/nvim-tree/nvim-tree.lua
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeCollapse" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus file explorer" },
      { "<leader>fe", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in explorer" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
            },
            git = { unmerged = "" },
          },
        },
      },
    }
  },
}
