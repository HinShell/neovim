return {
  {
    -- Nom : bufferline.nvim
    -- Adresse : https://github.com/akinsho/bufferline.nvim
    'akinsho/bufferline.nvim',
    event = "VeryLazy", -- Charger après l'interface de base
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { "<Tab>",   "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Force delete buffer",
      },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        numbers = "buffer_id",
        -- separator_style = "slant",
        separator_style = "thick",
        offsets = {
          {
            filetype = "neo-tree",
            text = "", -- You can customize or set "" to hide
            highlight = "Directory",
            text_align = "left",
            separator = true -- or false, depending on your theme preference
          }
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
        close_command = function(bufnum)
          require("mini.bufremove").delete(bufnum, false)
        end,
        right_mouse_command = function(bufnum)
          require("mini.bufremove").delete(bufnum, false)
        end,
        left_trunc_marker = '<',
        right_trunc_marker = '>',
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        show_buffer_close_icons = false,
        show_close_icon = false,
        indicator = {
          style = 'underline',
        },
        color_icons = true,
        diagnostics = "nvim_lsp",
        show_tab_indicators = true,
      },
    },
  },
}
