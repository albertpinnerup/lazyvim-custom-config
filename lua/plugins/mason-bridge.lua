return {
    -- Ensure mason-lspconfig auto-sets up servers with lspconfig
    "mason-org/mason-lspconfig.nvim",
    opts = {
        handlers = {
            function(server)
                require("lspconfig")[server].setup({})
            end,
        },
    },
}
