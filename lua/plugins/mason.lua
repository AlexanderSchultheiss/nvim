return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "lua-language-server",
        "python-lsp-server",
        "shfmt",
        "stylua",
        "json-lsp",
      },
    },
  },
}
