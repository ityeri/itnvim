-- LSP keymaps
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

-- Go to declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

-- Find references
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

-- Go to implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

-- Hover documentation
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

-- Signature help
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Rename symbol
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Code actions
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)

-- Show floating error
vim.keymap.set("n", "E", vim.diagnostic.open_float, opts)

-- Window navigation with Ctrl + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('t', '<Esc>', function()
    if vim.b.term_title and vim.b.term_title:match("zellij") then
        return "<Esc>"
    end
    return "<C-\\><C-n>"
end, { expr = true, silent = true })

vim.keymap.set('t', '<C-Esc>', "<C-\\><C-n>", opts)
