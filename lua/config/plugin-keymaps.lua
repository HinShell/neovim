-- ~/.config/nvim/lua/config/plugin-keymaps.lua
-- Mappings spécifiques aux plugins (temporaire pendant la migration)

local utils = require("utils")
local map = utils.map

-- =============================================
-- MAPPINGS SPÉCIFIQUES AUX PLUGINS
-- (Ces mappings seront déplacés dans les fichiers de plugins respectifs)
-- =============================================

-- Which-key
map("n", "<leader>?", function()
  require('which-key').show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- Nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Bufferline
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })

-- Floaterm
map("t", "<C-@>", "<cmd>FloatermToggle<CR>")
map("n", "<C-@>", "<cmd>FloatermToggle<CR>")
map("t", "<C-é>", "<cmd>FloatermNext<CR>")
map("t", "<C-&>", "<cmd>FloatermPrev<CR>")

map("n", "<leader>tg", "<cmd>FloatermNew --title=Lazygit --width=0.9 --height=0.9 lazygit<cr>", { desc = "Launch Lazygit" })
map("n", "<leader>td", "<cmd>FloatermNew --title=Lazydocker --width=0.9 --height=0.9 lazydocker<cr>", { desc = "Launch Lazydocker" })
map("n", "<leader>tb", "<cmd>FloatermNew --title=Btop --width=0.9 --height=0.9 btop<cr>", { desc = "Launch Btop" })
map("n", "<leader>ty", "<cmd>FloatermNew --title=Yazi --width=0.9 --height=0.9 yazi<cr>", { desc = "Launch Yazi" })
map("n", "<leader>tt", "<cmd>FloatermNew --title=Terminal --width=0.9 --height=0.9<cr>", { desc = "Launch Terminal" })
map("n", "<leader>tc", "<cmd>FloatermNew --title=CmdLine --width=0.9 --height=0.2<cr>", { desc = "Launch Commandline" })

-- Noice
map("n", "<leader>np", "<cmd>Noice pick<cr>", { desc = "Noice pick"})

-- Copilot
map("n", "<leader>cp", "<cmd>Copilot panel<cr>", { desc = "Copilot panel"})
map("i", "<C-l>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Copilot accept line" })
map("i", "<C-j>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", { desc = "Copilot accept word" })
map("i", "<C-ç>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot next suggestion" })
map("n", "<leader>cc", "<cmd>Copilot<cr>", { desc = "Copilot toggle" })
map("n", "<leader>cs", "<cmd>Copilot status<cr>", { desc = "Copilot status" })

-- Git mappings (Gitsigns)
-- Navigation
map('n', ']c', function()
  local gitsigns = require('gitsigns')
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end, { desc = 'Next Git hunk' })

map('n', '[c', function()
  local gitsigns = require('gitsigns')
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end, { desc = 'Previous Git hunk' })

-- Actions
map('n', '<leader>hs', function() require('gitsigns').stage_hunk() end, { desc = 'Stage hunk' })
map('n', '<leader>hr', function() require('gitsigns').reset_hunk() end, { desc = 'Reset hunk' })
map('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage hunk' })
map('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset hunk' })
map('n', '<leader>hS', function() require('gitsigns').stage_buffer() end, { desc = 'Stage buffer' })
map('n', '<leader>hu', function() require('gitsigns').undo_stage_hunk() end, { desc = 'Undo stage hunk' })
map('n', '<leader>hR', function() require('gitsigns').reset_buffer() end, { desc = 'Reset buffer' })
map('n', '<leader>hp', function() require('gitsigns').preview_hunk() end, { desc = 'Preview hunk' })
map('n', '<leader>hb', function() require('gitsigns').blame_line{full=true} end, { desc = 'Blame line' })
map('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end, { desc = 'Toggle line blame' })
map('n', '<leader>hd', function() require('gitsigns').diffthis() end, { desc = 'Diff this' })
map('n', '<leader>hD', function() require('gitsigns').diffthis('~') end, { desc = 'Diff this ~' })
map('n', '<leader>td', function() require('gitsigns').toggle_deleted() end, { desc = 'Toggle deleted' })

-- Text object
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })

-- Minimap mappings
map('n', '<leader>mm', '<cmd>MinimapToggle<CR>', { desc = 'Toggle Minimap' })
map('n', '<leader>mr', '<cmd>MinimapRefresh<CR>', { desc = 'Refresh Minimap' })
map('n', '<leader>mc', '<cmd>MinimapClose<CR>', { desc = 'Close Minimap' })
map('n', '<leader>mo', '<cmd>Minimap<CR>', { desc = 'Open Minimap' })
