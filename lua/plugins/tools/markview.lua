return {
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "md" }, -- Charger seulement pour fichiers Markdown
    cmd = { "Markview" },      -- Ou si des commandes existent
    event = "BufRead *.md",    -- Alternative avec pattern

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- }
  }
};
