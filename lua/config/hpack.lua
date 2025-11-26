local function hpack()
    vim.fn.system("hpack")
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "package.yaml",
    callback = hpack,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.hs",
    callback = hpack,
})
