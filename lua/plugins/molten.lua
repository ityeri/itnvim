return {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    lazy = false,
    dependencies = {
        "3rd/image.nvim",
    },
    keys = {
        { "<leader>mi", "<Cmd>MoltenInit<CR>",             desc = "Molten Init" },
        { "<leader>me", "<Cmd>MoltenEvaluateOperator<CR>", desc = "Molten Evaluate Operator" },
        { "<leader>ml", "<Cmd>MoltenEvaluateLine<CR>",     desc = "Molten Evaluate Line" },
        { "<leader>mr", "<Cmd>MoltenReevaluateCell<CR>",   desc = "Molten Re-evaluate Cell" },
    },
    config = function()
        vim.g.molten_auto_open_output = true
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_wrap_output = true
    end,
}
