return {
  {
    -- Nom : vim-floaterm
    -- Adresse : https://github.com/voldikss/vim-floaterm
    'voldikss/vim-floaterm',
    cmd = { 
      "FloatermToggle", "FloatermNew", "FloatermPrev", "FloatermNext", 
      "FloatermKill", "FloatermSend", "FloatermFirst", "FloatermLast" 
    },
    keys = {
      { "<leader>tg", "<cmd>FloatermNew --title=Lazygit --width=0.9 --height=0.9 lazygit<cr>", desc = "Launch Lazygit" },
      { "<leader>td", "<cmd>FloatermNew --title=Lazydocker --width=0.9 --height=0.9 lazydocker<cr>", desc = "Launch Lazydocker" },
      { "<leader>tb", "<cmd>FloatermNew --title=Btop --width=0.9 --height=0.9 btop<cr>", desc = "Launch Btop" },
      { "<leader>ty", "<cmd>FloatermNew --title=Yazi --width=0.9 --height=0.9 yazi<cr>", desc = "Launch Yazi" },
      { "<leader>tt", "<cmd>FloatermNew --title=Terminal --width=0.9 --height=0.9<cr>", desc = "Launch Terminal" },
      { "<leader>tc", "<cmd>FloatermNew --title=CmdLine --width=0.9 --height=0.2<cr>", desc = "Launch Commandline" },
    },
    init = function()
      vim.g.floaterm_title = "CmdLine($1|$2)"
      vim.g.floaterm_titleposition = "right"
      vim.g.floaterm_position = "bottom"
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_autoclose = 1
    end,
  },
}
