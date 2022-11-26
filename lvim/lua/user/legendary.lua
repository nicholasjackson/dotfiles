local M = {}

function M.setup()
  require("legendary").setup { include_builtin = true, { which_key = { auto_register = true } } }
end

return M
