-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
    {
        "ts-comments.nvim",
        opts = {
            keymaps = false,
        },
    },

    {
        "numToStr/Comment.nvim",
        dependencies = {
            "nvim-ts-context-commentstring",
        },
        opts = function()
            local present, ctx = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
            return {
                pre_hook = present and ctx.create_pre_hook() or nil,
            }
        end,
    },
    {
        "nvim-ts-context-commentstring",
        opts = {},
    },
}
