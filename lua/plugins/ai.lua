return {
    -- Make sure copilot.lua is actually set up early
    {
        "zbirenbaum/copilot.lua",
        -- This plugin already has opts from LazyVim's ai.copilot extra.
        -- We only change WHEN it loads.
        event = "bufReadPre",
        config = function()
            require("copilot").setup({})
        end,
    },

    -- Ensure Avante waits for copilot.lua to be ready
    {
        "yetone/avante.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
        },
        opts = function(_, opts)
            opts = opts or {}
            opts.provider = "copilot" -- same as LazyExtra, just explicit

            opts.web_search_engine = {
                provider = "google",
                proxy = nil,
            }
            return opts
        end,
    },
}
