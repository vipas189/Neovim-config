return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.language.formatting",
    },
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
        event = "User FilePost",
        config = function()
            require "configs.language.lsp"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = true,
        },
    },
    {
        "mfussenegger/nvim-lint",
        event = "User FilePost",
        config = function()
            require "configs.language.linting"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require "configs.nvim-tree"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "jay-babu/mason-nvim-dap.nvim", "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        cmd = {
            "DapToggleBreakpoint",
            "DapContinue",
            "DapStepOver",
            "DapStepInto",
            "DapStepOut",
            "DapRestart",
            "DapStop",
        },
        config = function()
            require "configs.language.debugger"
        end,
    },
    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "hrsh7th/cmp-cmdline" },
        event = "VeryLazy",
        config = function()
            require "configs.noice"
        end,
    },
    {
        "CRAG666/code_runner.nvim",
        cmd = "RunCode",
        config = function()
            require "configs.code_runner"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = {
            experimental = {
                ghost_text = true, -- Enable ghost text
            },
        },
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        opts = {
            lang = "python",
        },
    },
}
