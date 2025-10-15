return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    keys = {
      { "<leader>cp", "<cmd>Copilot panel<cr>",                                   desc = "Copilot panel" },
      { "<leader>cc", "<cmd>Copilot<cr>",                                         desc = "Copilot toggle" },
      { "<leader>cs", "<cmd>Copilot status<cr>",                                  desc = "Copilot status" },
      { "<M-l>",      function() require('copilot.suggestion').accept() end,      mode = "i",             desc = "Accept suggestion" },
      { "<M-j>",      function() require('copilot.suggestion').accept_word() end, mode = "i",             desc = "Accept word" },
      { "<M-k>",      function() require('copilot.suggestion').accept_line() end, mode = "i",             desc = "Accept line" },
    },
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = "<M-j>",
            accept_line = "<M-k>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
}
