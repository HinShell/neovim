-- ~/.config/nvim/lua/config/plugin-keymaps.lua
-- Mappings spécifiques aux plugins (temporaire pendant la migration)
-- IMPORTANT: Ces mappings seront progressivement déplacés dans les fichiers plugins respectifs

local utils = require("utils")
local map = utils.map

-- =============================================
-- MAPPINGS RESTANTS À MIGRER
-- =============================================

-- Floaterm - Mappings conservés ici temporairement (dans le plugin maintenant)
map("t", "<C-@>", "<cmd>FloatermToggle<CR>")
map("n", "<C-@>", "<cmd>FloatermToggle<CR>")
map("t", "<C-é>", "<cmd>FloatermNext<CR>")
map("t", "<C-&>", "<cmd>FloatermPrev<CR>")

-- Noice
map("n", "<leader>np", "<cmd>Noice pick<cr>", { desc = "Noice pick"})

-- Copilot - Mappings spécifiques (déjà optimisés dans les plugins AI)
map("n", "<leader>cp", "<cmd>Copilot panel<cr>", { desc = "Copilot panel"})
map("i", "<C-l>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Copilot accept line" })
map("i", "<C-j>", "<cmd>lua require('copilot.suggestion').accept_word()<CR>", { desc = "Copilot accept word" })
map("i", "<C-ç>", "<cmd>lua require('copilot.suggestion').next()<CR>", { desc = "Copilot next suggestion" })
map("n", "<leader>cc", "<cmd>Copilot<cr>", { desc = "Copilot toggle" })
map("n", "<leader>cs", "<cmd>Copilot status<cr>", { desc = "Copilot status" })

-- Git mappings (Gitsigns) - À migrer dans le plugin gitsigns
map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    require('gitsigns').nav_hunk('next')
  end
end, { desc = 'Next Git hunk' })

map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    require('gitsigns').nav_hunk('prev')
  end
end, { desc = 'Previous Git hunk' })

-- Actions Gitsigns
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
