return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.html.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Displays hover information about the symbol under the cursor
                    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

                    -- Jump to the definition
                    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

                    -- Jump to declaration
                    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

                    -- Lists all the implementations for the symbol under the cursor
                    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

                    -- Jumps to the definition of the type symbol
                    bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

                    -- Lists all the references
                    bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

                    -- Displays a function's signature information
                    bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

                    -- Renames all references to the symbol under the cursor
                    bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

                    -- Selects a code action available at the current cursor position
                    bufmap({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

                    -- Show diagnostics in a floating window
                    bufmap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>")

                    -- Move to the previous diagnostic
                    bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

                    -- Move to the next diagnostic
                    bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
                end,
            })
        end,
    },
}
