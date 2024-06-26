-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd("autocmd FileType * inoremap ' '")
vim.cmd("autocmd FileType * inoremap ( (")
vim.cmd("autocmd FileType * inoremap [ [")
vim.cmd("autocmd FileType * inoremap < <")
vim.cmd('autocmd FileType * inoremap " "')
-- vim.cmd("autocmd FileType * inoremap { {")
vim.cmd("autocmd FileType * inoremap ` `")
vim.cmd("autocmd FileType norg setlocal conceallevel=3")
vim.cmd("autocmd FileType norg setlocal concealcursor=c")
