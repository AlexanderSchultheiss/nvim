--if true then
--  return {}
--end
return {
  -- vimtex
  {
    "lervag/vimtex",
    ft = "tex",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "tex" },
      },
    },
  },
}
