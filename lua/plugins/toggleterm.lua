return
{
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    lazy = false,
    keys = {
        --[[ { "<leader>th", "<Cmd>ToggleTerm direction=horizontal size=10<CR>", desc = "ToggleTerm Horizontal" }, ]]
        --[[ { "<leader>tv", "<Cmd>ToggleTerm direction=vertical size=80<CR>",   desc = "ToggleTerm Vertical" } ]]
        { "'", "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm Float" }
    }
}
