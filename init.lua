vim.opt.termguicolors = true

vim.cmd("colorscheme eldar")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("set clipboard+=unnamedplus")
vim.api.nvim_set_hl(0, "Normal", { bg = "#040404" })

vim.diagnostic.config({
    underline = true, -- enable underline
    virtual_text = true,
    signs = true,     -- keep gutter signs
    update_in_insert = false,
    severity_sort = true,
})

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    callback = function()
        pcall(vim.lsp.codelens.refresh)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf })
    end,
})

-- Format immediately after pasting in normal/visual mode
local function format_after_paste(keys)
    return function()
        vim.api.nvim_feedkeys(keys, "n", false) -- perform the paste
        vim.lsp.buf.format({ async = true })    -- format buffer asynchronously
    end
end

vim.keymap.set({ "n", "x" }, "p", format_after_paste("p"), { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "P", format_after_paste("P"), { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual", -- highlight style
            timeout = 150, -- duration in milliseconds
        })
    end,
})

require("config.keymaps")
require("config.lazy")
