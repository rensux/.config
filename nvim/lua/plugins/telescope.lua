
local get_dir = function()
    local dir = vim.fn.expand("%:p:h")
    if string.sub(dir, 1, 3) == "oil" then
        return string.sub(dir, 7, -1) -- we are in oil (aka a directory) so remove oil:// prefix
    else
        return dir
    end
end

return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    tag = "0.1.5",
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files({ cwd = get_dir() }) end, mode = "n" },
        { "<C-p>", function() require("telescope.builtin").git_files() end, mode = "n" },
        { "<leader>fs", function() require("telescope.builtin").grep_string({ cwd = get_dir(), search = vim.fn.input("Grep > ") }) end, mode = "n" },
    },
}


