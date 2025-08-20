return {
  {
    -- Nom : gitsigns.nvim
    -- Adresse : https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      -- Navigation entre hunks
      { "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            require('gitsigns').nav_hunk('next')
          end
        end, desc = "Next Git hunk" },
      { "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            require('gitsigns').nav_hunk('prev')
          end
        end, desc = "Previous Git hunk" },
      
      -- Actions sur les hunks
      { "<leader>hs", function() require('gitsigns').stage_hunk() end, desc = "Stage hunk" },
      { "<leader>hr", function() require('gitsigns').reset_hunk() end, desc = "Reset hunk" },
      { "<leader>hs", function() 
          require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} 
        end, mode = "v", desc = "Stage hunk" },
      { "<leader>hr", function() 
          require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} 
        end, mode = "v", desc = "Reset hunk" },
      
      -- Actions sur le buffer
      { "<leader>hS", function() require('gitsigns').stage_buffer() end, desc = "Stage buffer" },
      { "<leader>hu", function() require('gitsigns').undo_stage_hunk() end, desc = "Undo stage hunk" },
      { "<leader>hR", function() require('gitsigns').reset_buffer() end, desc = "Reset buffer" },
      
      -- Prévisualisation et blame
      { "<leader>hp", function() require('gitsigns').preview_hunk() end, desc = "Preview hunk" },
      { "<leader>hb", function() require('gitsigns').blame_line{full=true} end, desc = "Blame line" },
      { "<leader>tb", function() require('gitsigns').toggle_current_line_blame() end, desc = "Toggle line blame" },
      
      -- Diff
      { "<leader>hd", function() require('gitsigns').diffthis() end, desc = "Diff this" },
      { "<leader>hD", function() require('gitsigns').diffthis('~') end, desc = "Diff this ~" },
      { "<leader>td", function() require('gitsigns').toggle_deleted() end, desc = "Toggle deleted" },
      
      -- Text objects
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = {"o", "x"}, desc = "Select hunk" },
    },
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        -- Configuration par défaut pour gitsigns
      end
    },
  },
}
