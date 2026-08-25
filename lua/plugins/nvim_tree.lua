return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function() require("nvim-tree").setup() end,
  opts = {
    view = {
      relativenumber = true
    }
  },
  keys = {
    {";", "<cmd>NvimTreeToggle<cr>"}
  }
}

