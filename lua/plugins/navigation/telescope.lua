return {
  {
    -- Nom : telescope.nvim
    -- Adresse : https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },
      { "<leader>fs", "<cmd>Telescope grep_string<CR>", desc = "Grep string under cursor" },
    },
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = {
            "node_modules/",
            ".git/",
            "*.lock",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
      
      -- Charger l'extension fzf-native si disponible
      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
