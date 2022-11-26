local M = {
  isMinimal = false,

  defaultLayouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },

  minimalLayouts = {
    {
      elements = {
        "repl",
        "scopes",
      },
      size = 0.15, -- 15% of total lines
      position = "bottom",
    },
  },
}

function M.toggle()
  local dap = require('dapui')

  if M.isMinimal ~= true then
    dap.setup({
      layouts = M.minimalLayouts
    })
    dap.open()
    M.isMinimal = true
  else
    dap.setup({
      layouts = M.defaultLayouts
    })
    dap.open()
    M.isMinimal = false
  end
end

return M
