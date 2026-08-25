vim.lsp.config(
  "rust-analyzer",
  {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" }
  }
)
vim.lsp.enable("rust-analyzer")

vim.lsp.config(
  "lua-language-server",
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
vim.lsp.enable("lua-language-server")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.supports_method("textDocument/formatting") then
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

vim.lsp.completion.enable()
