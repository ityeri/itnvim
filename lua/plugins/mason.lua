return {
  {
    "mason-org/mason.nvim",
    opts = {
    }
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Theas names could be either the package name or lspconfig name by mason-lspconfig plugin
        -- ex: lua-language-server is a package name and lua_ls is a lspconfig name. Both of them is recognizable
        -- std: package name
        "lua-language-server",
        "rust-analyzer",
        "yaml-language-server",
        "kube-linter"
      },
    },
dependencies = {
      "mason-org/mason.nvim",
      {
        "mason-org/mason-lspconfig.nvim",
        opts = { automatic_enable = true },
        dependencies = { "neovim/nvim-lspconfig" },
      },
    },
  }
}
