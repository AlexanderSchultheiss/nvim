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

-- ThePrimegean
-- J without cursor move
map("n", "J", "mzJ`z")
-- cursor staying in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- paste without loosing paste buffer
map("x", "<leader>p", '"_dP', { desc = "paste and keep buffer" })
-- yank into system clipboard
map("n", "<leader>y", '"+y', { desc = "yank into system clipboard" })
map("v", "<leader>y", '"+y', { desc = "yank into system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "yank EOL into system clipboard" })
-- delete to void buffer
map("n", "<leader>dd", '"_d', { desc = "delete into void" })
map("v", "<leader>dd", '"_d', { desc = "delete into void" })
-- misc
map("n", "Q", "<nop>")
map("n", "<S-Down>", "<cmd>cnext<CR>zz")
map("n", "<S-Up>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "next location" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "previous location" })

-- vimtex
vim.g.vimtex_mappings_prefix = "<leader>l"
vim.g.vimtex_imaps_leader = "#"
-- map("n", "<leader>li", "<Plug>(vimtex-info)", { desc = "vimtex info" })
-- map("n", "<leader>ll", "<Plug>(vimtex-compile)", { desc = "vimtex compile" })

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

-- undotree
map("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "undotree toggle " })

-- markdown-preview
map("n", "<leader>ml", vim.cmd.MarkdownPreview, { desc = "markdown preview" })

-- chatGPT
map({ "v", "n" }, "<leader>aE", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "edit with ChatGPT" })
map({ "v", "n" }, "<leader>aC", "<cmd>ChatGPT<CR>", { desc = "chat with ChatGPT" })
map({ "v", "n" }, "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "grammar correction" })
map({ "v", "n" }, "<leader>at", "<cmd>ChatGPTRun translate<CR>", { desc = "translate" })
map({ "v", "n" }, "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", { desc = "keywords" })
map({ "v", "n" }, "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", { desc = "docstring" })
map({ "v", "n" }, "<leader>au", "<cmd>ChatGPTRun add_tests<CR>", { desc = "add tests" })
map({ "v", "n" }, "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "optimize code" })
map({ "v", "n" }, "<leader>as", "<cmd>ChatGPTRun summarize<CR>", { desc = "summarize" })
map({ "v", "n" }, "<leader>ab", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "fix bugs" })
map({ "v", "n" }, "<leader>ae", "<cmd>ChatGPTRun explain_code<CR>", { desc = "explain code" })
map({ "v", "n" }, "<leader>ax", "<cmd>ChatGPTRun rocygen_edit<CR>", { desc = "roxygen edit" })
map({ "v", "n" }, "<leader>ar", "<cmd>ChatGPTRun code_readability_analysis<CR>", { desc = "readability analysis" })
