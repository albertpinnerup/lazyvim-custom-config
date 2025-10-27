return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },

        opts = {

            completion = {
                list = { selection = { preselect = true, auto_insert = false } },
                menu = {
                    draw = {
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    },
                },
            },

            sources = {
                default = { "lsp", "snippets", "path", "buffer" },
                providers = {
                    lsp = { fallbacks = { "buffer" } },
                    buffer = { score_offset = -2, min_keyword_length = 3 },
                },
            },
        },
    },
}
