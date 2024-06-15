require("mason").setup()

local servers = {
  "lua_ls",
  "gopls",
  "svelte",
  "tailwindcss",
  "tsserver",
  "denols",
  "eslint",
  "yamlls",
  "cssls",
  "emmet_language_server",
  "graphql",
  "gitlab_ci_ls",
}

require("mason-tool-installer").setup {
  ensure_installed = servers,
}

-- Setup for diagnostics UI. I don't like virtual text or the underlines.
-- A mark in the gutter is cleaner and quite sufficient.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = false,
})

-- Lua Setup
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities,
  }
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover LSP docs" })
  end,
})

local config = require "lspconfig"

config.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

config.denols.setup {}
config.gitlab_ci_ls.setup {}
