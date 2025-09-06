return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = 20,
            open_mapping = [[<leader>tt]],
            insert_mappings = false,
            direction = "horizontal", -- can be "vertical", "float", etc.
            autchdir = true,
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)

            local Terminal = require("toggleterm.terminal").Terminal

            local terminals = {}

            -- Add any additional keymaps here
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
                desc = "Exit terminal mode",
            })

            -- Open a new terminal
            vim.keymap.set("n", "<leader>tn", function()
                local term = Terminal:new({
                    direction = "horizontal", -- change to "float" or "vertical" if desired
                    close_on_exit = false,
                    auto_scroll = true,
                })
                table.insert(terminals, term)
                term:toggle()
            end, { desc = "Open new terminal" })

            -- toggle the last terminal if exists, otherwise open a new one
            vim.keymap.set("n", "<leader>tt", function()
                if #terminals == 0 then
                    local term = Terminal:new({
                        direction = "horizontal",
                        close_on_exit = false,
                        auto_scroll = true,
                    })
                    table.insert(terminals, term)
                    term:toggle()
                else
                    for _, term in ipairs(terminals) do
                        term:toggle()
                    end
                end
            end, { desc = "Toggle last terminal" })

            -- Close the terminal in the current buffer
            vim.keymap.set("n", "<leader>td", function()
                local buf = vim.api.nvim_get_current_buf()
                for i, term in ipairs(terminals) do
                    if term.bufnr == buf then
                        term:close()
                        table.remove(terminals, i)
                        break
                    end
                end
            end, { desc = "Close terminal in current window" })
        end,
    },
}
