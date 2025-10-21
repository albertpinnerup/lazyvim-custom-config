return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = 20,
            open_mapping = nil,
            insert_mappings = false,
            direction = "horizontal", -- can be "vertical", "float", etc.
            autochdir = true,
            terminal_mappings = false,
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)

            -- Terminal buffers: keep Esc from closing the window
            --
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "toggleterm",
                callback = function(ev)
                    -- In terminal-insert: Esc -> terminal-normal
                    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
                        buffer = ev.buf,
                        noremap = true,
                        nowait = true,
                        silent = true,
                    })
                    -- In terminal-normal: Esc should NOT close the window
                    -- pick one:
                    -- a) do nothing destructive
                    vim.keymap.set("n", "<Esc>", "<Esc>", {
                        buffer = ev.buf,
                        noremap = true,
                        nowait = true,
                        silent = true,
                    })
                    -- b) or literally do nothing:
                    -- vim.keymap.set("n", "<Esc>", "<Nop>", { buffer = ev.buf, noremap = true, nowait = true, silent = true })
                end,
            })

            local Terminal = require("toggleterm.terminal").Terminal

            local float_term = nil

            local terminals = {}

            -- In terminal mode: ESC leaves terminal mode. Add a second key if you want close-on-ESC for floats:
            vim.keymap.set("n", "q", function()
                local win = vim.api.nvim_get_current_win()
                local cfg = vim.api.nvim_win_get_config(win)
                if cfg.relative ~= "" and float_term and float_term:is_open() then
                    float_term:toggle()
                else
                    for _, term in ipairs(terminals) do
                        if term.direction ~= "float" and term:is_open() then
                            term:toggle()
                        end
                    end
                end
            end, { desc = "Close float or exit terminal mode" })

            vim.keymap.set("n", "<leader>tq", function()
                local buf = vim.api.nvim_get_current_buf()
                for i, term in ipairs(terminals) do
                    if term.bufnr == buf then
                        term:shutdown()
                        table.remove(terminals, i)
                        break
                    end
                end
            end, { desc = "Kill terminal in current window" })
            -- Open a new terminal
            vim.keymap.set("n", "<leader>tn", function()
                local win = vim.api.nvim_get_current_win()
                local cfg = vim.api.nvim_win_get_config(win)
                if cfg.relative ~= "" and float_term and float_term:is_open() then
                    float_term:toggle()
                end

                local term = Terminal:new({
                    direction = "horizontal", -- change to "float" or "vertical" if desired
                    close_on_exit = false,
                    auto_scroll = true,
                })
                table.insert(terminals, term)
                term:toggle()
                vim.cmd("startinsert")
            end, { desc = "Open new terminal" })

            vim.keymap.set("n", "<leader>tf", function()
                if float_term == nil then
                    float_term = Terminal:new({
                        direction = "float",
                        close_on_exit = false,
                        auto_scroll = true,
                        dir = "git_dir",
                    })
                    table.insert(terminals, float_term)
                end
                float_term:toggle()
                vim.cmd("startinsert")
            end, { desc = "Open floating terminal" })

            -- toggle the last terminal if exists, otherwise open a new one
            vim.keymap.set("n", "<leader>tt", function()
                local win = vim.api.nvim_get_current_win()
                local cfg = vim.api.nvim_win_get_config(win)
                if cfg.relative ~= "" and float_term and float_term:is_open() then
                    float_term:toggle()
                end

                if #terminals == 0 then
                    local term = Terminal:new({
                        direction = "horizontal",
                        close_on_exit = false,
                        auto_scroll = true,
                    })
                    table.insert(terminals, term)
                    term:toggle()
                    vim.cmd("startinsert")
                else
                    for _, term in ipairs(terminals) do
                        if term.direction ~= "float" then
                            term:toggle()
                            vim.cmd("startinsert")
                        end
                    end
                end
            end, { desc = "Toggle last terminal" })

            -- Close the terminal in the current buffer
            vim.keymap.set("n", "<leader>th", function()
                local buf = vim.api.nvim_get_current_buf()
                for _, term in ipairs(terminals) do
                    if term.bufnr == buf then
                        term:toggle()
                    end
                end
            end, { desc = "Hide terminal in current window" })
        end,
    },
}
