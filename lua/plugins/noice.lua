return {
    {
        "folke/noice.nvim",
        opts = {
            -- control how long the small popups stay
            views = {
                -- used for a lot of short messages
                mini = {
                    timeout = 8000, -- 8 seconds
                },

                -- used for notification-style popups
                notify = {
                    timeout = 8000, -- 8 seconds
                },
            },
        },
    },
}
