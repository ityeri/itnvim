return {
  "akinsho/toggleterm.nvim",
  config = true,
  lazy = false,
  keys = {
    { "'",  "<Cmd>ToggleTerm direction=horizontal size=15<CR>", ... },
    { "'v", "<Cmd>ToggleTerm direction=vertical size=80<CR>",   ... }
  }
}
