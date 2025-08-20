return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip"
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
            lsp_zero.configure("lua_ls", {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            })
          end,
        }
      })

      -- Apply lsp-zero configurations
      lsp_zero.setup()
    end
  }
}
