return {
  {
    "S1M0N38/love2d.nvim",
    cmd = { "LoveStart", "LoveRun" },
    config = function()
      local love = require "love2d"
      love.setup {}
    end,
  },
}
