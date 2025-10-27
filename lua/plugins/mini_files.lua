return {
    {
        "nvim-mini/mini.files",
        opts = {
            windows = {
                preview = true,
                width_focus = 30,
                width_preview = 50,
            },
        },
        config = function()
            require("mini.files").setup()
        end,
    },
}
