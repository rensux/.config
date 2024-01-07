local builtin = require('telescope.builtin')

local get_dir = function()
    local dir = vim.fn.expand("%:p:h")
    if string.sub(dir, 1, 3) == "oil" then
        return string.sub(dir, 7, -1) -- we are in oil (aka a directory) so remove oil:// prefix
    else
        return dir
    end
end

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ cwd = get_dir(), hidden = true })
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

