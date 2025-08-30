return {{
    "nvim-treesitter/nvim-treesitter",
    opts = {
        -- add tsx and treesitter
        ensure_installed = {"tsx", "typescript", "javascript", "css", "html"},
        playground = {
            enable = true
        },
        highlight = {
            enable = true
        }
    }

}}
