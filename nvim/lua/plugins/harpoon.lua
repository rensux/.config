local hlist = function() return require("harpoon"):list() end

return {
    "ThePrimeagen/harpoon",
    name = "harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() require("harpoon"):setup() end,
    keys = {
        { "<leader>a", function() hlist():append() end, mode = "n" },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(hlist()) end, mode = "n" },
        { "<C-h>", function() hlist():select(1) end, mode = "n" },
        { "<C-t>", function() hlist():select(2) end, mode = "n" },
        { "<C-n>", function() hlist():select(3) end, mode = "n" },
        { "<C-s>", function() hlist():select(4) end, mode = "n" },
    },
}

