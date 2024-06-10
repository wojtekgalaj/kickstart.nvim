local conform = require("conform")

-- This method checks for if a config file for your formatter exists before
-- returning the formatters table or nil
---@param formatters? table
---@return table?
local use_these_if_prettierrc_found = function(formatters)
  if not formatters then
    formatters = { "prettierd", "prettier" }
  end
  local prettierrc_exists = vim.fn.findfile(".prettierrc", ".;")
  local prettierrc_json_exists = vim.fn.findfile(".prettierrc.json", ".;")
  if prettierrc_exists or prettierrc_json_exists then
    return formatters
  else
    return nil
  end
end


conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = use_these_if_prettierrc_found(),
    typescriptreact = use_these_if_prettierrc_found(),
    javascript = use_these_if_prettierrc_found(),
    json = use_these_if_prettierrc_found(),
  },
  format_on_save = {
    lsp_fallback=nil
  }
})
