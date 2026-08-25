return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- These names are from the package name. See the next of the lsp name in mason setting view
        "lua_ls",
        "rust_analyzer",
        "yamlls",
        "kube-linter"
      },
      automatic_enable = true
    },
    dependencies = { "neovim/nvim-lspconfig" }
  }
}
