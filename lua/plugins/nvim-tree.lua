return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {
            "JMarkin/nvim-tree.lua-float-preview",
            lazy = true,
            -- default
            opts = {
                -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
                toggled_on = true,
                -- wrap nvimtree commands
                wrap_nvimtree_commands = true,
                -- lines for scroll
                scroll_lines = 20,
                -- window config
                window = {
                    style = "minimal",
                    relative = "win",
                    border = "rounded",
                    wrap = false,
                },
                mapping = {
                    -- scroll down float buffer
                    down = { "<C-d>" },
                    -- scroll up float buffer
                    up = { "<C-e>", "<C-u>" },
                    -- enable/disable float windows
                    toggle = { "<C-x>" },
                },
                -- hooks if return false preview doesn't shown
                hooks = {
                    pre_open = function(path)
                        -- if file > 5 MB or not text -> not preview
                        local size = require("float-preview.utils").get_size(path)
                        if type(size) ~= "number" then
                            return false
                        end
                        local is_text = require("float-preview.utils").is_text(path)
                        return size < 5 and is_text
                    end,
                    post_open = function(bufnr)
                        return true
                    end,
                },
            },
        },
    },
    opts = {
        view = {
            relativenumber = true,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    keys = {
        { ";", function() require("nvim-tree.api").tree.toggle({ focus = true }) end, desc = "Toggle nvim tree" }
    },
}
