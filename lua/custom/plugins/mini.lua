return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
      require("mini.comment").setup()
      require("mini.ai").setup {}
      require("mini.surround").setup {}
      require("mini.comment").setup {}
      require("mini.statusline").setup {}
    end,
  },
}
