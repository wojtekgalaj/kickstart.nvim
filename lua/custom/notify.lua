local notify = require "notify"

notify.setup {
  background_colour = "NotifyBackground",
  fps = 1,
  level = vim.log.levels.INFO,
  render = "minimal",
  stages = "static",
  timeout = 1500,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  min_width = 50,
  time_formats = {
    notification = "%T",
    notification_history = "%FT%T",
  },
  top_down = true,
}
