local c = require "nvim-treesitter.configs"
c.setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    "bash",
    "http",
    "go",
    "lua",
    "javascript",
    "typescript",
    "ninja",
    "svelte",
    "html",
    "json",
    "markdown",
    "hurl",
  },

  sync_install = true,
  ignore_install = { "javascript" },
  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true, disable = { "python" } },
  incremental_selection = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  modules = {},
  textobjects = {
    enable = true,
  },
}

local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
