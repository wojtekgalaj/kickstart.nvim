-- local pattern_type_table = {
--   {
--     pattern = "*.gitlab-ci*.{yml,yaml}",
--     filetype = "yaml.gitlab",
--   },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.gitlab-ci*.{yml,yaml}",
--   callback = function()
--     vim.bo.filetype = "yaml.gitlab"
--   end,
-- })
--
-- function find_filetype_for_pattern(pattern)
--   local p = pattern_type_table
-- end
--
--

local pattern_type_table = {
  {
    pattern = "*.gitlab-ci*.{yml,yaml}",
    filetype = "yaml.gitlab",
  },
  {
    pattern = "deno",
    filetype = "deno.typescript",
  },
}

-- Helper function to check if a file path matches a pattern
local function match_pattern(path, pattern)
  local match = string.match(path, pattern)
  return match ~= nil
end

-- Function to find the filetype for a given file path
function find_filetype_for_pattern(path)
  for _, entry in ipairs(pattern_type_table) do
    if match_pattern(path, entry.pattern) then
      return entry.filetype
    end
  end
  return nil -- No match found
end

-- Set the filetype based on the pattern
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    local path = vim.fn.expand "%:p" -- Get the full file path
    if path then
      print("buf read path" .. path)
    end
    local filetype = find_filetype_for_pattern(path)
    if filetype then
      print("buf read filetype" .. filetype)
      vim.bo.filetype = filetype
    end
  end,
})
