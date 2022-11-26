-- disable space moving cursoi
vim.cmd 'nmap <Space> <Leader>'
-- lvim.builtin.which_key.mappings = {
--   ["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
--   ["<F10>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
--   ["<F11>"] = { "<cmd>dlua require('dap').step_into()<CR>", "Step Into" },
--   ["<F12>"] = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
-- }

lvim.keys.normal_mode["<Tab>"] = false

lvim.keys.normal_mode["<C-p>"] = "<cmd>lua require('lvim.core.telescope.custom-finders').find_project_files{}<CR>"
lvim.keys.normal_mode["<S-p>"] = "<cmd>Telescope commands<CR>"

lvim.builtin.which_key.mappings["t"] = {
  ["d"] = { "<cmd>lua require('dap-go').debug_test()<CR>", "Debug Test" },
  ["t"] = { "<cmd>lua require('dap-go').debug_last_test()<CR>", "Last Test" },
}

lvim.builtin.which_key.mappings["dm"] = {
  "<cmd>lua require('user.dap-ui-minimal').toggle()<CR>",
  "Toggle Minimal Debug UI"
}
