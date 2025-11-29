return {
    filetypes = { "haskell", "lhaskell" },
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    settings = {
        haskell = {
            formattingProvider = "fourmolu"
        }
    }
}
