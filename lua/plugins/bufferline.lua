return {
  {
    -- Nom : bufferline.nvim
    -- Adresse : https://github.com/akinsho/bufferline.nvim
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        always_show_bufferline = false,
        numbers = "buffer_id",
        close_command = function(bufnum)
            -- Aller au buffer suivant avant de fermer
            vim.cmd("BufferLineCycleNext")
            vim.cmd("bdelete! " .. bufnum)
          end,
        right_mouse_command = function(bufnum)
            -- Aller au buffer suivant avant de fermer
            vim.cmd("BufferLineCycleNext")
            vim.cmd("bdelete! " .. bufnum)
          end,
        left_trunc_marker = '<',
        right_trunc_marker = '>',
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        show_buffer_close_icons = false,
        show_close_icon = false,
        indicator_icon = '▎',
        color_icons = true,
        diagnostics = "nvim_lsp",
        show_tab_indicators = true,
        offsets = {
          {
            filetype = "NvimTree",
            --        text = "File Explorer",
            text_align = "center", -- Custom text over NvimTree
            separator = false,    -- Disable bufferline separator
          }
        },
        custom_filter = function(buf_number)
          local filetype = vim.bo[buf_number].filetype
          if filetype == "NvimTree" then
            return false   -- Hides NvimTree buffer
          end
          return true  -- Shows other buffers normally
        end,
      },
    },
  },
}
