local function hpack()
    local file = vim.fn.expand("%")
    local err = vim.fn.system("hpack " .. file)
    if vim.v.shell_error ~= 0 then
        print(err)
    end
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "package.yaml",
    callback = hpack,
})
