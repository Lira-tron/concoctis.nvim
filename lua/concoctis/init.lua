local M = {}

-- default configs
M.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  override_colors = {},
  override_highlights = {},
  dim_inactive = false,
  transparent_mode = false,
}

function M.setup(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function()
  -- reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "concoctis"
  vim.o.termguicolors = true

  local groups = require("concoctis.groups").setup(M.config)

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
