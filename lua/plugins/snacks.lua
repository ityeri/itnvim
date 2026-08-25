return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    indent = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 5, total = 500 },
        easing = "inOutCubic"
      },
      animate_repeat = {
        delay = 100,
        duration = { step = 5, total = 50 },
        easing = "outCubic"
      }
    }
  }
}
