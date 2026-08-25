return {
  "nvim-telescope/telescope-ui-select.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = require("telescope.themes").get_cursor({})
      }
    })
    require("telescope").load_extension("ui-select")
  end
}
