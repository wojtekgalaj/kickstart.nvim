return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
