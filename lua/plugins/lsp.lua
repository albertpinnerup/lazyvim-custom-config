return {
    "neovim/nvim-lspconfig",

    event = { "BufReadPre", "BufNewFile" },
    opts = {
        servers = {
            intelephense = {
                single_file_support = true,
                root_dir = function(fname)
                    local util = require("lspconfig.util")
                    local uv = vim.uv or vim.loop
                    local start = fname or (uv and uv.cwd()) or vim.fn.getcwd()
                    -- prefer a git repo if present
                    local git = vim.fs.find(".git", { path = start, upward = true })[1]
                    if git then
                        return vim.fs.dirname(git)
                    end
                    -- then common PHP roots
                    local root = util.root_pattern("composer.json", "psalm.xml", "psalm.xml.dist")(start)
                    -- fallback = CWD so it *always* attaches
                    return root or (uv and uv.cwd()) or vim.fn.getcwd()
                end,
            },
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
        },
    },
}
