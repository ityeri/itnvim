return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    lazy = false,

    -- example using `opts` for defining servers
    opts = {
        inlay_hints = { enabled = true },
        servers = {
            lua_ls = {}
        }
    },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        local capabilities = require('blink.cmp').get_lsp_capabilities()

        lspconfig['clangd'].setup({
            capabilities = capabilities,
            cmd = { vim.fn.stdpath("config") .. "/shell/clangd-direnv.sh" }
        })

        lspconfig.hls.setup({
            capabilities = capabilities,
            filetypes = { 'haskell', 'lhaskell' },
            cmd = { "haskell-language-server-wrapper", "--lsp" },
            settings = {
                haskell = {
                    formattingProvider = "fourmolu"
                }
            }
        })
    end,
}
