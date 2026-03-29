return {
    'stevearc/aerial.nvim',
    opts = {
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

        layout = {
            min_width = 0.9
        },

        float = {
            relative = "win",
            min_height = 0.9
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "\\", "<Cmd>AerialToggle float<CR>", desc = "Aerial toggle floating" }
    },
}
