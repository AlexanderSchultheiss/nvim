local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>ra", function()
  vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr, desc = "code action" })

vim.keymap.set("n", "<leader>rdd", function()
  vim.cmd.RustLsp({
    "debuggables",
  })
end, { silent = true, buffer = bufnr, desc = "debuggables" })

vim.keymap.set("n", "<leader>rdl", function()
  vim.cmd.RustLsp({
    "debuggables",
    "last" --[[ optional ]],
  })
end, { silent = true, buffer = bufnr, desc = "debuggables last" })

vim.keymap.set("n", "<leader>rrr", function()
  vim.cmd.RustLsp({
    "runnables",
  })
end, { silent = true, buffer = bufnr, desc = "runnables" })

vim.keymap.set("n", "<leader>rrl", function()
  vim.cmd.RustLsp({
    "runnables",
    "last" --[[ optional ]],
  })
end, { silent = true, buffer = bufnr, desc = "runnables last" })

vim.keymap.set("n", "<leader>rm", function()
  vim.cmd.RustLsp("expandMacro")
end, { silent = true, buffer = bufnr, desc = "expand macros" })

vim.keymap.set("n", "<leader>rp", function()
  vim.cmd.RustLsp("rebuildProcMacros")
end, { silent = true, buffer = bufnr, desc = "rebuild proc macros" })

vim.keymap.set("n", "<leader>rk", function()
  vim.cmd.RustLsp({ "moveItem", "up" })
end, { silent = true, buffer = bufnr, desc = "move item up" })
vim.keymap.set("n", "<leader>rj", function()
  vim.cmd.RustLsp({ "moveItem", "down" })
end, { silent = true, buffer = bufnr, desc = "move item down" })

vim.keymap.set("n", "<leader>rh", function()
  vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr, desc = "hover actions" })

vim.keymap.set("n", "<leader>rl", function()
  vim.cmd.RustLsp({ "hover", "range" })
end, { silent = true, buffer = bufnr, desc = "hover range" })

vim.keymap.set("n", "<leader>re", function()
  vim.cmd.RustLsp("explainError")
end, { silent = true, buffer = bufnr, desc = "explain error" })

vim.keymap.set("n", "<leader>rC", function()
  vim.cmd.RustLsp("openCargo")
end, { silent = true, buffer = bufnr, desc = "open cargo" })

vim.keymap.set("n", "<leader>rP", function()
  vim.cmd.RustLsp("parentModule")
end, { silent = true, buffer = bufnr, desc = "parent module" })

vim.keymap.set("n", "<leader>rJ", function()
  vim.cmd.RustLsp("joinLines")
end, { silent = true, buffer = bufnr, desc = "join lines" })

vim.keymap.set("n", "<leader>rs", function()
  vim.cmd.RustLsp({
    "ssr",
    "<query>" --[[ optional ]],
  })
end, { silent = true, buffer = bufnr, desc = "search and replace" })

vim.keymap.set("n", "<leader>rg", function()
  vim.cmd.RustLsp({ "crateGraph", "[backend]", "[output]" })
end, { silent = true, buffer = bufnr, desc = "crate graph" })

vim.keymap.set("n", "<leader>rT", function()
  vim.cmd.RustLsp("syntaxTree")
end, { silent = true, buffer = bufnr, desc = "syntax tree" })

vim.keymap.set("n", "<leader>rH", function()
  vim.cmd.RustLsp({ "view", "hir" })
end, { silent = true, buffer = bufnr, desc = "view HIR" })
vim.keymap.set("n", "<leader>rM", function()
  vim.cmd.RustLsp({ "view", "mir" })
end, { silent = true, buffer = bufnr, desc = "view MIR" })

vim.keymap.set("n", "<leader>rcc", function()
  vim.cmd.Neomake("cargo")
end, { silent = true, buffer = bufnr, desc = "cargo check" })
