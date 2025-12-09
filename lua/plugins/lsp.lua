return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },
    opts = {
        servers = {
            -- keep Psalm only when a config exists (avoids exit code 1)
            psalm = {
                single_file_support = false,
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern("psalm.xml", "psalm.xml.dist")(fname)
                end,
            },
            -- optional: disable phpactor while debugging
            phpactor = {
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern("composer.json", ".git")(fname)
                end,
                single_file_support = false,
            },
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
            cssls = {
                settings = {
                    css = {
                        completion = {
                            completePropertyWithSemiColon = true,
                        },
                    },
                    scss = {
                        completion = {
                            completePropertyWithSemicolon = true,
                            triggerPropertyValueCompletion = false,
                        },
                    },
                },
            },
        },
    },
}
