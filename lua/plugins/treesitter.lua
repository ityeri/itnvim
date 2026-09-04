return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    -- ensure_installed was removed in the nvim-treesitter rewrite (8b98b44).
    -- Install parsers explicitly; no-op if already installed.
    -- Mirrors mason.lua ensure_installed: rust-analyzer / yaml-language-server.
    -- lua/vim/vimdoc parsers are bundled with the nvim 0.12 runtime.
    require("nvim-treesitter").install({ "rust", "yaml" }):wait(300000)
  end,
}
