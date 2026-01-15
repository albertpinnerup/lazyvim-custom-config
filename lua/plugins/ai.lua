return {
    -- Make sure copilot.lua is actually set up early
    {
        "zbirenbaum/copilot.lua",
        -- This plugin already has opts from LazyVim's ai.copilot extra.
        -- We only change WHEN it loads.
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,

                    -- IMPORTANT for your Blink setup:
                    keymap = {
                        accept = "<C-CR>", -- do NOT use Tab / Space
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = false }, -- keep it inline-only
            })
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
