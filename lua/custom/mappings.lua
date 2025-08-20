-- ~/.config/nvim/custom/mappings.lua
---@diagnostic disable: undefined-global

vim.g.mapleader = ' '

Map('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
Map('n', '<leader>w', ':w<CR>', { desc = 'Write' })
Map('n', '<leader>?', function()
  require('which-key').show({ global = false })
end, { desc = 'Buffer Local Keymaps (which-key)' })
Map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
Map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
Map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
Map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
Map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close Buffer" })
Map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
Map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })

Map("t", "<C-@>", "<cmd>FloatermToggle<CR>")
Map("n", "<C-@>", "<cmd>FloatermToggle<CR>")
Map("t", "<C-é>", "<cmd>FloatermNext<CR>")
Map("t", "<C-&>", "<cmd>FloatermPrev<CR>")

Map("n", "<leader>tg", "<cmd>FloatermNew --title=Lazygit --width=0.9 --height=0.9 lazygit<cr>", { desc = "Launch Lazygit" })
Map("n", "<leader>td", "<cmd>FloatermNew --title=Lazydocker --width=0.9 --height=0.9 lazydocker<cr>", { desc = "Launch Lazydocker" })
Map("n", "<leader>tb", "<cmd>FloatermNew --title=Btop --width=0.9 --height=0.9 btop<cr>", { desc = "Launch Btop" })
Map("n", "<leader>ty", "<cmd>FloatermNew --title=Yazi --width=0.9 --height=0.9 yazi<cr>", { desc = "Launch Yazi" })
Map("n", "<leader>tt", "<cmd>FloatermNew --title=Terminal --width=0.9 --height=0.9<cr>", { desc = "Launch Terminal" })
Map("n", "<leader>tc", "<cmd>FloatermNew --title=CmdLine --width=0.9 --height=0.2<cr>", { desc = "Launch Commandline" })

Map("n", "<leader>np", "<cmd>Noice pick<cr>", { desc = "Noice pick"})
Map("n", "<leader>cp", "<cmd>Copilot panel<cr>", { desc = "Copilot panel"})
Map("i", "<C-l>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Copilot accept line" })
Map("i", "<C-j>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", { desc = "Copilot accept word" })
Map("i", "<C-ç>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot next suggestion" })
Map("n", "<leader>cc", "<cmd>Copilot<cr>", { desc = "Copilot toggle" })
Map("n", "<leader>cs", "<cmd>Copilot status<cr>", { desc = "Copilot status" })

Map("n", "<leader>pp", "<cmd>:let @+ = expand('%')<CR>", { desc = "Copy file path to clipboard" })
Map("n", "<leader>ps", "<cmd>:let @+ = expand('%:t')<CR>", { desc = "Copy file name to clipboard" })
Map("n", "<leader>pv", "<cmd>:let @+ = expand('%:p')<CR>", { desc = "Copy file path to clipboard (fullpath)" })
Map("n", "<leader>pP", "<cmd>:let @+ = expand('%:p:h')<CR>", { desc = "Copy file path to parent directory to clipboard" })

Map("n", "<leader>sd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostics"})

-- Git mappings (Gitsigns)
-- Navigation
Map('n', ']c', function()
  local gitsigns = require('gitsigns')
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = 'Next Git hunk' })

Map('n', '[c', function()
  local gitsigns = require('gitsigns')
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = 'Previous Git hunk' })

-- Actions
Map('n', '<leader>hs', function() require('gitsigns').stage_hunk() end, { desc = 'Stage hunk' })
Map('n', '<leader>hr', function() require('gitsigns').reset_hunk() end, { desc = 'Reset hunk' })
Map('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage hunk' })
Map('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset hunk' })
Map('n', '<leader>hS', function() require('gitsigns').stage_buffer() end, { desc = 'Stage buffer' })
Map('n', '<leader>hu', function() require('gitsigns').undo_stage_hunk() end, { desc = 'Undo stage hunk' })
Map('n', '<leader>hR', function() require('gitsigns').reset_buffer() end, { desc = 'Reset buffer' })
Map('n', '<leader>hp', function() require('gitsigns').preview_hunk() end, { desc = 'Preview hunk' })
Map('n', '<leader>hb', function() require('gitsigns').blame_line{full=true} end, { desc = 'Blame line' })
Map('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end, { desc = 'Toggle line blame' })
Map('n', '<leader>hd', function() require('gitsigns').diffthis() end, { desc = 'Diff this' })
Map('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = 'Diff this ~' })
Map('n', '<leader>td', function() require('gitsigns').toggle_deleted() end, { desc = 'Toggle deleted' })

-- Text object
Map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })

-- Minimap mappings
Map('n', '<leader>mm', '<cmd>MinimapToggle<CR>', { desc = 'Toggle Minimap' })
Map('n', '<leader>mr', '<cmd>MinimapRefresh<CR>', { desc = 'Refresh Minimap' })
Map('n', '<leader>mc', '<cmd>MinimapClose<CR>', { desc = 'Close Minimap' })
Map('n', '<leader>mo', '<cmd>Minimap<CR>', { desc = 'Open Minimap' })
