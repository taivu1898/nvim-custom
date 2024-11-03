return {
    -- theme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd "colorscheme gruvbox"
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    -- icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    {
        "nvim-lua/plenary.nvim",
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.configs.ui.statusline").setup()
        end,
    },

    -- toggle file
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.configs.utils.nvim-tree").setup()
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.configs.utils.which-key").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("plugins.configs.utils.nvim-treesitter").setup()
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
            },
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.configs.utils.cmp").setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require("plugins.configs.utils.autopairs").setup()
        end,
    },

    {
        'numToStr/Comment.nvim',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('Comment').setup()
        end,
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("plugins.configs.editor.lsp.mason").setup()
            require("plugins.configs.editor.lsp.lspconfig").setup()
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
            { "folke/neodev.nvim",                   opts = {} },
        },
        config = function()
            require("plugins.configs.editor.lsp.lspconfig").setup()
        end,

    },

    {
        "stevearc/conform.nvim",
        config = function()
            require("plugins.configs.editor.conform").setup()
        end,
    }

}
