return {
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {
      path_to_love_library = vim.fn.stdpath "data" .. "/lazy/love2d.nvim/love2d/library/love",
    },
    config = function() end,
  },
}
