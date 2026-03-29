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
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            vim.lsp.config(server, config)
        end

        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config("clangd", {
            capabilities = capabilities,
            cmd = { vim.fn.stdpath("config") .. "/shell/clangd-direnv.sh" }
        })

        vim.lsp.enable("hls")
    end,
}
