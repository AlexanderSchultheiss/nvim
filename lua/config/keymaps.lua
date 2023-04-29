-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>vs", "<cmd> RustDebuggables <CR>", { desc = "Start debugging" })
map("n", "<leader>vb", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>vo", "<cmd> DapStepOver <CR>", { desc = "Step Over" })
map("n", "<leader>vi", "<cmd> DapStepInto <CR>", { desc = "Step into" })
map("n", "<leader>vc", "<cmd> DapContinue <CR>", { desc = "Continue" })
map("n", "<leader>vt", "<cmd> DapTerminate <CR>", { desc = "Terminate Debugging" })
map("n", "<leader>vd", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })
