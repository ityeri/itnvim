-- automatic enable: In lua/plugins/mason.lus
-- lsp settings in here are for additional settings

-- lua_ls setting hooks is exists for the double quote formmating setting
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
-- issue: taplo lsp ignores every .toml file because of some workspace issue
vim.lsp.config("taplo", {
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { ".taplo.toml", "taplo.toml", ".git" })
    on_dir(root or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
  end
})

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
