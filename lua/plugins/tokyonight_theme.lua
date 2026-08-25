return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight.colors").setup()
    vim.cmd[[colorscheme tokyonight]]
  end
}

