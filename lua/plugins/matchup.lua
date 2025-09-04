--[[ -- Using lazy.nvim
return {
    "andymass/vim-matchup",
    event = "BufRead",
    init = function()
        vim.g.matchup_enabled = 0
        vim.g.matchup_html_infer_tag = 1

        vim.g.matchup_matchparen_offscreen = {}
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_timeout = 50
    end,
} ]]
