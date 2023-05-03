-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

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

-- Rust Crates
map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "update crates" })

-- Change keymap of Lazy to 'L'
vim.keymap.del("n", "<leader>l")
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- vimtex
map("n", "<leader>v[[", "<Plug>(vimtex-[[)", { desc = "section vimtex-[[" })
map("n", "<leader>v]]", "<Plug>(vimtex-]])", { desc = "section vimtex-]]" })
map("n", "<leader>v[]", "<Plug>(vimtex-[])", { desc = "section vimtex-[]" })
map("n", "<leader>v][", "<Plug>(vimtex-][)", { desc = "section vimtex-][" })

map("n", "<leader>v[m", "<Plug>(vimtex-[m)", { desc = "env. vimtex-[m" })
map("n", "<leader>v[M", "<Plug>(vimtex-[M)", { desc = "env. vimtex-[M" })
map("n", "<leader>v]m", "<Plug>(vimtex-]m)", { desc = "env. vimtex-]m" })
map("n", "<leader>v]M", "<Plug>(vimtex-]M)", { desc = "env. vimtex-]M" })

map("n", "<leader>v[n", "<Plug>(vimtex-[n)", { desc = "math vimtex-[n" })
map("n", "<leader>v[N", "<Plug>(vimtex-[N)", { desc = "math vimtex-[N" })
map("n", "<leader>v]n", "<Plug>(vimtex-]n)", { desc = "math vimtex-]n" })
map("n", "<leader>v]N", "<Plug>(vimtex-]N)", { desc = "math vimtex-]N" })

map("n", "<leader>v[r", "<Plug>(vimtex-[r)", { desc = "frame vimtex-[r" })
map("n", "<leader>v[R", "<Plug>(vimtex-[R)", { desc = "frame vimtex-[R" })
map("n", "<leader>v]r", "<Plug>(vimtex-]r)", { desc = "frame vimtex-]r" })
map("n", "<leader>v]R", "<Plug>(vimtex-]R)", { desc = "frame vimtex-]R" })

map("n", "<leader>v[*", "<Plug>(vimtex-[*)", { desc = "comment vimtex-[*" })
map("n", "<leader>v]*", "<Plug>(vimtex-]*)", { desc = "comment vimtex-]*" })
