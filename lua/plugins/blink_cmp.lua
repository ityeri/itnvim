  return { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    version = "2.*",
    build = function()
      -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
      -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
      require("blink.cmp").build():pwait()
    end,
    dependencies = {
      "saghen/blink.lib"
    },
    opts = {
      keymap = {
        ["<Tab>"] = { "select_and_accept", "fallback" }
      },
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100
          }
        }
      }
    }
  }
