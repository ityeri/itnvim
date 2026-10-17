return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  keys = {
    { "gd", "<CMD>Glance definitions<CR>",      desc = "Glance definitions" },
    { "gr", "<CMD>Glance references<CR>",       desc = "Glance references" },
    { "gt", "<CMD>Glance type_definitions<CR>", desc = "Glance type definitions" },
    { "gi", "<CMD>Glance implementations<CR>",  desc = "Glance implementations" }
    -- gn, ga mapping is in the init.lua file as a vim native feature
  }
}
