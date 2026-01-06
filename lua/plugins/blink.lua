return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },

        opts = {

            completion = {
                list = { selection = { preselect = false, auto_insert = false } },
                menu = {
                    draw = {
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    },
                },
            },

            sources = {
                default = function(ctx)
                    local ft = (ctx and ctx.filetype) or vim.bo.filetype
                    if ft == "css" or ft == "scss" or ft == "less" then
                        local line = vim.api.nvim_get_current_line()
                        local col = vim.fn.col(".")
                        local prev = col > 1 and line:sub(col - 1, col - 1) or ""
                        if prev == "{" or prev == "}" then
                            return {}
                        end
                    end
                    return { "lsp", "snippets", "path", "buffer" }
                end,
                providers = {
                    lsp = { fallbacks = { "buffer" } },
                    buffer = { score_offset = -2, min_keyword_length = 3 },
                },
            },
        },
    },
}
