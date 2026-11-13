do -- Load extrenal config, modules
  require("config.lazy_setup")
  require("config.lsp")
end

do -- General nvim native settings
  vim.opt.clipboard = "unnamedplus"
  vim.g.mapleader = " "

  vim.opt.number = true
  vim.opt.relativenumber = true

  vim.diagnostic.config({ virtual_text = true })

  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.statuscolumn = " %@v:lua.require'snacks.statuscolumn'@%s%=%l │"

  vim.opt.timeoutlen = 300 -- Timeout between keymap chain (ms)

  -- Error & Warning message displaying
  vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true
  })
end

do
  local line_nr_color = "#5a6283"
  vim.api.nvim_set_hl(0, "LineNr", { fg = line_nr_color })
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = line_nr_color })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = line_nr_color })
end

do -- Native feature keymap settings
  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
  vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
  vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

  vim.keymap.set("n", "-", "^", { desc = "Goto start of the line" })

  vim.keymap.set("n", "gn", vim.lsp.buf.rename)
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

  vim.keymap.set("n", "<leader>bdc", function()
    local cur = vim.api.nvim_get_current_buf()

    -- Non-text buffers and unsaved changes keep native :bd behavior
    if vim.bo[cur].buftype ~= "" or vim.fn.buflisted(cur) == 0 or vim.bo[cur].modified then
      return vim.cmd("bdelete " .. cur)
    end

    local target
    local alt = vim.fn.bufnr("#")
    if alt ~= cur and vim.fn.buflisted(alt) == 1 then
      target = alt
    else
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= cur and vim.fn.buflisted(buf) == 1 then
          target = buf
          break
        end
      end
    end
    target = target or vim.api.nvim_create_buf(true, false)

    for _, win in ipairs(vim.fn.win_findbuf(cur)) do
      vim.api.nvim_win_set_buf(win, target)
    end
    pcall(vim.api.nvim_buf_delete, cur, { force = false })
  end, { desc = "Close current buffer, keep window" })

  vim.keymap.set("n", "<leader>bda", function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.bo[buf].buftype == "" then
        pcall(vim.api.nvim_buf_delete, buf, { force = false })
      end
    end
  end, { desc = "Close all buffers" })
  vim.keymap.set("n", "<leader>bdd", function()
    local cur = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= cur and vim.bo[buf].buftype == "" then
        pcall(vim.api.nvim_buf_delete, buf, { force = false })
      end
    end
  end, { desc = "Close all buffers except current" })
end
