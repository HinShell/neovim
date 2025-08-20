return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" }, -- Chargé à l'ouverture de fichiers
    build = ":TSUpdate",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", 
          "javascript", "html", "cmake", "typescript", "python", 
          "json", "yaml", "markdown", "bash"
        },
        auto_install = true, -- Installer automatiquement les parsers manquants
        sync_install = false,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end
  }
}
