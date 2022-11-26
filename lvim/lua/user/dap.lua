local M

function M.setup()
  local dap = require('dapui')

  dap.setup({
    layouts = {
      {
        elements = {
          "console",
          "scopes",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
  })
end

return M
