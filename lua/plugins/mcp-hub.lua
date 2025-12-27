return {
    "ravitemer/mcphub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    build = "pnpm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    opts = {
        extensions = {
            copilotchat = {
                enabled = true,
                convert_tools_to_functions = true,
                convert_resources_to_functions = true,
                add_mcp_prefix = false,
            }
        }
    },
}
