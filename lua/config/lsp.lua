-- automatic enable: In lua/plugins/mason.lus

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
