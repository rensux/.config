return {
    {"nyoom-engineering/oxocarbon.nvim", priority = 1000},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup {
                color_overrides = {
                    all = {
                        base = "#17181f"
                    }
                },
                styles = {
                    keywords = { "bold" },
                    conditionals = { "bold" },
                    loops = { "bold" },
                },
                integrations = {
                    treesitter = true,
                },
                native_lsp = {
                    enabled = true
                }
            }
        end,
    },
}
