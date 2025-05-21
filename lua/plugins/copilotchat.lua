return {
    {
        "zbirenbaum/copilot.lua", -- or zbirenbaum/copilot.lua
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",                   -- Only on MacOS or Linux
        opts = {},
        keys = {
            { "<leader>tt", ":CopilotChatToggle<cr>", mode = "n", desc = "toggle chat pannel" },
        },
    },
}
