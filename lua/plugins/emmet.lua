return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            emmet_language_server = {
                filetypes = {
                    "html",
                    "css",
                    "scss",
                    "sass",
                    "less",
                    "javascriptreact",
                    "typescriptreact",
                    "php",
                    "blade",
                },
            },
        },
    },
}
