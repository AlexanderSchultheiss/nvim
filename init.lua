-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.harpoon")
require("config.lldb")
require("config.rust-tools")
vim.cmd("source ~/.config/nvim/vim/vimtex.vim")
require("config.texlab")
require("config.rust-analyzer")
