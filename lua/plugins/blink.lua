local last_mode = nil
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
                    return { "lsp", "path", "snippets", "buffer" }
                end,
                providers = {
                    lsp = { fallbacks = { "buffer" } },
                    buffer = { score_offset = -2, min_keyword_length = 3 },
                },
            },
            keymap = {
                preset = "default",

                ["<Tab>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return
                        end
                        local idx = cmp.get_selected_item_idx() or 0
                        if idx == 0 then
                            return cmp.select_next()
                        else
                            return cmp.select_next()
                        end
                    end,
                    "fallback",
                },

                ["<S-Tab>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return
                        end
                        local idx = cmp.get_selected_item_idx() or 0
                        if idx > 0 then
                            return cmp.select_prev()
                        end
                    end,
                    "fallback",
                },

                ["<Space>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return
                        end
                        local idx = cmp.get_selected_item_idx() or 0
                        if idx > 0 then
                            return cmp.accept()
                        end
                    end,
                    "fallback",
                },

                -- Esc: only cancel suggestions if you're actually "in" the list (something selected).
                -- Otherwise Esc should exit insert mode normally.
                ["<Esc>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return
                        end
                        local idx = cmp.get_selected_item_idx() or 0
                        if idx > 0 then
                            return cmp.cancel()
                        end
                    end,
                    "fallback",
                },

                -- Enter: accept only when an item is selected, otherwise keep normal Enter behavior
                ["<CR>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return
                        end
                        local idx = cmp.get_selected_item_idx() or 0
                        if idx > 0 then
                            return cmp.accept()
                        end
                    end,
                    "fallback",
                },

                -- Show only LSP completions
                ["<C-Space>"] = {
                    function(cmp)
                        last_mode = nil
                        return cmp.show()
                    end,
                },

                -- LSP only (toggle)
                ["<C-l>"] = {
                    function(cmp)
                        if last_mode == "lsp" then
                            last_mode = nil
                            return cmp.show()
                        end
                        last_mode = "lsp"
                        return cmp.show({ providers = { "lsp" } })
                    end,
                },

                -- snippets only (toggle)
                ["<C-s>"] = {
                    function(cmp)
                        if last_mode == "snippets" then
                            last_mode = nil
                            return cmp.show()
                        end
                        last_mode = "snippets"
                        return cmp.show({ providers = { "snippets" } })
                    end,
                },

                -- buffer only (toggle)
                ["<C-b>"] = {
                    function(cmp)
                        if last_mode == "buffer" then
                            last_mode = nil
                            return cmp.show()
                        end
                        last_mode = "buffer"
                        return cmp.show({ providers = { "buffer" } })
                    end,
                },

                -- path only (toggle)
                ["<C-p>"] = {
                    function(cmp)
                        if last_mode == "path" then
                            last_mode = nil
                            return cmp.show()
                        end
                        last_mode = "path"
                        return cmp.show({ providers = { "path" } })
                    end,
                },
            },
        },
    },
}
