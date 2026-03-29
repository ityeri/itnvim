return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
        { "<leader>dvo", "<Cmd>DiffviewOpen<CR>",       desc = "Open Diff view" },
        { "<leader>dvc", "<Cmd>DiffviewClose<CR>",      desc = "Close Diff view" },
        { "<leader>dvf", "<Cmd>DiffviewFocusFiles<CR>", desc = "Focus file in Diff view" },
    },
}
