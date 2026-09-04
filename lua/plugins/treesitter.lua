return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    -- ensure_installed was removed in the nvim-treesitter rewrite (8b98b44).
    -- Install parsers explicitly; no-op if already installed.
    -- lua/vim/vimdoc parsers are bundled with the nvim 0.12 runtime.
    require("nvim-treesitter").install({ "rust" }):wait(300000)
  end,
}
