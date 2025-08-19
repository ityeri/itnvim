-- LSP keymaps
local opts = { noremap = true, silent = true }

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
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
