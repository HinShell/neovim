return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = { "BufReadPre", "BufNewFile" }, -- Chargé à l'ouverture de fichiers
    cmd = { "Mason", "LspInfo", "LspStart", "LspStop", "LspRestart" },
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall" },
        build = ":MasonUpdate",
      },
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-cmdline",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
      },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      -- Initialize lsp-zero with preset options
      lsp_zero.preset("recommended")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "yamlls",
        },
        handlers = {
          -- Handler for every supported server
          function(server_name)
            lsp_zero.setup(server_name)
          end,

          -- Custom handler for Lua language server
          lua_ls = function()
            lsp_zero.configure("lua_ls", {})
          end,
        }
      })

      -- Apply lsp-zero configurations
      lsp_zero.setup()
    end
  }
}
