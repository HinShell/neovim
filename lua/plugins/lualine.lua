return {
  {
    -- Nom : lualine.nvim
    -- Adresse : https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local lualine = require('lualine')
      -- Fonction pour afficher le LSP actif
      local function lsp_client()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients == 0 then
          return "No LSP"
        end
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        return table.concat(names, ", ")
      end
      -- Fonction pour afficher le nombre de mots en mode sélection
      local function word_count()
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'v' or mode == 'V' or mode == '' then
          local start_pos = vim.fn.getpos("'<")
          local end_pos = vim.fn.getpos("'>")
          local lines = vim.fn.getline(start_pos[2], end_pos[2])
          local word_count = 0
          for _, line in ipairs(lines) do
            _, word_count = string.gsub(line, "%S+", "")
            word_count = word_count + (word_count or 0)
          end
          return word_count .. " words"
        end
        return ""
      end
      -- Fonction pour afficher la taille du fichier
      local function file_size()
        local size = vim.fn.getfsize(vim.fn.expand('%:p'))
        if size <= 0 then return '' end
        local units = {'B', 'KB', 'MB', 'GB'}
        local i = 1
        while size > 1024 and i < #units do
          size = size / 1024
          i = i + 1
        end
        return string.format('%.1f%s', size, units[i])
      end
      lualine.setup({
        options = {
          theme = 'catppuccin',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = {
            {
              'branch',
              icon = '',
            },
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
            },
            {
              'diagnostics',
              sources = { 'nvim_diagnostic', 'nvim_lsp' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_c = {
            {
              'filename',
              file_status = true,
              newfile_status = false,
              path = 1, -- 0: juste le nom, 1: chemin relatif, 2: chemin absolu
              symbols = {
                modified = '[+]',
                readonly = '[-]',
                unnamed = '[No Name]',
                newfile = '[New]',
              },
            },
          },
          lualine_x = {
            {
              word_count,
              cond = function()
                local mode = vim.api.nvim_get_mode().mode
                return mode == 'v' or mode == 'V' or mode == ''
              end,
            },
            {
              lsp_client,
              icon = ' ',
              color = { gui = 'bold' },
            },
            {
              'encoding',
              cond = function()
                return vim.bo.fileencoding ~= 'utf-8'
              end,
            },
            {
              'fileformat',
              symbols = {
                unix = '', -- e712
                dos = '',  -- e70f
                mac = '',  -- e711
              },
              cond = function()
                return vim.bo.fileformat ~= 'unix'
              end,
            },
            'filetype',
          },
          lualine_y = {
            {
              file_size,
            },
            'progress',
          },
          lualine_z = {
            {
              'location',
              fmt = function(str)
                return str .. ' '
              end,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {
          'nvim-tree',
          'trouble',
          'fugitive',
          'man',
          'quickfix',
        },
      })
    end,
  },
}
