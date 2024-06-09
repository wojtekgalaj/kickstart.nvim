return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      -- Autoformatting
      "stevearc/conform.nvim",
      -- Schema information
      "b0o/SchemaStore.nvim",
      -- Diagnostics for all the project
      "artemave/workspace-diagnostics.nvim",
    },
    config = function()
      require "custom.lsp"
    end,
  },
}
