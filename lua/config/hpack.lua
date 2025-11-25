local function hpack()
    local err = vim.fn.system("hpack")
    if vim.v.shell_error ~= 0 then
        print(err)
    end
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "package.yaml",
    callback = hpack,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.hs",
    callback = hpack,
})
