vim.lsp.config(
  "rust_analyzer",
  {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" }
  }
)
vim.lsp.enable("rust_analyzer")

vim.lsp.config(
  "lua_ls",
  {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    settings = {
      Lua = {
        format = {
          defaultConfig = {
            quote_style = "double",
            trailing_table_separator = "never"
          }
        }
      }
    }
  }
)
vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          for i = 1, 2 do
            vim.lsp.buf.format({ bufnr = args.buf })
          end
        end
      })
    end
  end
})
