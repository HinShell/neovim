return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>np", "<cmd>Noice pick<cr>", desc = "Noice pick" },
      { "<leader>nl", "<cmd>Noice last<cr>", desc = "Noice last message" },
      { "<leader>nh", "<cmd>Noice history<cr>", desc = "Noice history" },
      { "<leader>na", "<cmd>Noice all<cr>", desc = "Noice all messages" },
      { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss all messages" },
    },
    opts = {
      require("noice").setup({
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      --"rcarriga/nvim-notify",
    }
  },
}
