return{
    "nvim-treesitter/nvim-treesitter",
    build= ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "javascript", "typescript", "go", "python", "sql", "markdown" },
            highlight = { enable = true },
            indent = { enable = true},
        })
    end
}
