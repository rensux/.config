require("rensux.remap")

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('rensux.config.treesitter') end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            -- Mason integration
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
            },
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = function() require('rensux.config.lsp') end,
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'catppuccin'
                }
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function() require('rensux.config.telescope') end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = function() require('rensux.config.colors') end,
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function() require('rensux.config.harpoon') end,
    },
    {
        "mbbill/undotree",
        lazy = false,
        config = function () require("rensux.config.undotree") end
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function () require("rensux.config.oil") end,
    }
})

