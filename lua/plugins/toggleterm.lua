return
{
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    lazy = false,
    keys = {
        { "<leader>th", "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm Horizontal" },
        { "<leader>tv", "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm Vertical" }
    }
}
