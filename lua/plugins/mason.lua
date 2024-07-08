return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "lua-language-server",
        "pyright",
        "shfmt",
        "stylua",
        "json-lsp",
        "google-java-format",
        "ruff",
        "black",
      },
    },
  },
}
