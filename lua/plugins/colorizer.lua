return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            filetypes = {
                "*",
                html = { mode = "foreground" },
            },
        },
    },
}
