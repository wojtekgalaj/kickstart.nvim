require("mason").setup()

local servers = {
  "lua_ls",
  "gopls",
  "svelte",
  "tailwindcss",
  "tsserver",
  "eslint",
  "yamlls",
  "cssls",
  "emmet_language_server",
  "graphql",
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

print('runtime_path for lspconfig', runtime_path)

local on_attach = function(client, bufnr)
  require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then

      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
        checkThirdParty = true,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}
