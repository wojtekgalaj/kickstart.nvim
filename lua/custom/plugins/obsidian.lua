local path_to_vault = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/wojteks_vault"
return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre "
        .. path_to_vault
        .. "/**.md",
      "BufNewFile " .. path_to_vault .. "/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter",
      "pomo.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = path_to_vault,
        },
      },

      -- see below for full list of options 👇
    },
  },
}
