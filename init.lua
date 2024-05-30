-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.harpoon")
require("config.texlab")
require("config.tokyonight")
require("config.rust")
require("config.chatgpt")
require("config.battery")
vim.cmd("source ~/.config/nvim/vim/vimtex.vim")
vim.cmd("source ~/.config/nvim/vim/neomake.vim")
require("config.java")
require("config.neorg")
require("config.image")

-- colorscheme
-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd("colorscheme darcula-solid")
vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("set termguicolors")
