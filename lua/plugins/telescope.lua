return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>ff", "<Cmd>Telescope find_files<CR>",            desc = "Find files" },
        { "<leader>fg", "<Cmd>Telescope live_grep<CR>",             desc = "Live grep" },
        { "<leader>fb", "<Cmd>Telescope buffers<CR>",               desc = "Buffers" },
        { "<leader>fh", "<Cmd>Telescope help_tags<CR>",             desc = "Help tags" },

        -- ds -> document symbols
        { "<leader>ds", "<Cmd>Telescope lsp_document_symbols<CR>",  desc = "Document symbols" },
        -- ws -> workspace symbols
        { "<leader>ws", "<Cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
        -- gr -> LSP references
        { "<leader>gr", "<Cmd>Telescope lsp_references<CR>",        desc = "LSP references" },

        -- sa -> aerial
        { "<leader>sa", "<Cmd>Telescope aerial<CR>",                desc = "Aerial" },
    },
}
