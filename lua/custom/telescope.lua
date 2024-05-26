-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "*-lock.json" },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    extensions = {},
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")

local which_key = require "which-key"
local builtin = require "telescope.builtin"
local notify = require("telescope").extensions.notify

which_key.register({
  ["<leader>"] = {
    ["<space>"] = {
      builtin.find_files,
      "[SPACE] List files in project",
    },
    ["/"] = {
      builtin.current_buffer_fuzzy_find,
      "[/] Fuzzily search in current buffer]",
    },
    s = {
      name = "[S]earch",
      a = {
        builtin.git_commits,
        "[A]ll commits",
      },
      c = {
        builtin.git_bcommits,
        "buffer [C]ommits",
      },
      d = {
        builtin.diagnostics,
        "[D]iagnostics",
      },
      g = {
        builtin.live_grep,
        "[G]rep in project",
      },
      h = {
        builtin.help_tags,
        "[H]elp tags",
      },
      j = {
        builtin.jumplist,
        "[J]umplist",
      },
      n = {
        notify.notify,
        "[N]otifications",
      },
      r = {
        builtin.resume,
        "[R]esume last search",
      },
      s = {
        builtin.buffers,
        "buffer[S]",
      },
      u = {
        builtin.grep_string,
        "grep whats [U]nder cursor",
      },
      q = {
        builtin.quickfixhistory,
        "[Q]uickfix history",
      },
    },
  },
}, { mode = "n", silent = true, noremap = true })
