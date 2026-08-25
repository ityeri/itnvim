require("config.lazy_boot") -- Bootstrapping lazynvim

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '-', '^', { desc = 'Goto start of the line' })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.statuscolumn = " %@v:lua.require'snacks.statuscolumn'@%s%=%l │"

