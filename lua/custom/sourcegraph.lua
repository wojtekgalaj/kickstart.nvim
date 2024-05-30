require("sg").setup {}

local function get_visual_range()
  local _, line_start = unpack(vim.fn.getpos "v")
  local _, line_end = unpack(vim.fn.getpos ".")

  -- minus one here because we want to include the first line,
  -- even if we started visual from the middle or end of it
  return line_start - 1, line_end
end

local function cody_ask_range()
  local bufnr = vim.api.nvim_get_current_buf()

  local line_start, line_end = get_visual_range()

  local commands = require "sg.cody.commands"
  local msg = vim.fn.input "Ask cody about the selection: " or "Explain this code: "

  commands.ask_range(bufnr, line_start, line_end, msg, {
    window_type = "float",
  })
end

local function cody_ask()
  local commands = require "sg.cody.commands"
  local msg = vim.fn.input "Ask cody anything: "

  local msgs = vim.split(msg, "\n")
  commands.ask(msgs)
end

local function cody_task()
  local bufnr = vim.api.nvim_get_current_buf()

  local line_start, line_end = get_visual_range()

  local commands = require "sg.cody.commands"
  local msg = vim.fn.input "Ask cody to do a task: "

  commands.do_task(bufnr, line_start, line_end, msg)
end

local wk = require "which-key"

-- visual mode
wk.register({
  ["<leader>"] = {
    c = {
      name = "[C]ody",
      r = {
        cody_ask_range,
        "Ask Range",
      },
      t = { cody_task, "Ask to do a Task" },
    },
  },
}, { mode = "v", silent = true, noremap = true })

-- normal mode
wk.register({
  ["<leader>"] = {
    c = {
      name = "[C]ody",
      a = { cody_ask, "Ask Anything" },
    },
  },
}, { mode = "n", silent = true, noremap = true })
