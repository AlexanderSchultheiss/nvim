vim.g.rustaceanvim = function()
  -- Update this path
  local extension_path = vim.env.HOME .. ".vscode-oss/extensions/vadimcn.vscode-lldb-1.10.0-universal/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb"

  liblldb_path = liblldb_path .. (".so" or ".dylib")

  local cfg = require("rustaceanvim.config")
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end

vim.g.rustaceanvim()
