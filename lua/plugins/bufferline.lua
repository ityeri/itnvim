return {
  "akinsho/bufferline.nvim",
  lazy = false,
  keys = {
    { "<S-h>",   "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>",   "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<C-S-h>", "<cmd>BufferLineMovePrev<cr>",  desc = "Move buffer prev" },
    { "<C-S-l>", "<cmd>BufferLineMoveNext<cr>",  desc = "Move buffer next" }
  },
  config = function()
    require("bufferline").setup {
      options = {
        indicator = { style = "underline" }
      }
    }
  end
}
