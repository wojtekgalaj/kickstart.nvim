return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-smart-history.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "rcarriga/nvim-notify" },
    },
    config = function()
      require "custom.telescope"
    end,
  },
}
