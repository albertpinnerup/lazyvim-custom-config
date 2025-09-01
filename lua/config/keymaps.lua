-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
    desc = "Exit terminal mode",
})
-- in lua/config/keymaps.lua
-- vim.keymap.set("n", "<leader>tt", function()
-- require("toggleterm").toggle(1, 20, vim.loop.cwd(), "horizontal")
-- end, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tr", ":bd!<CR>", {
    desc = "Close terminal completely",
})

vim.api.nvim_create_user_command("Tutor", function()
    vim.cmd("silent! Tutor")
end, {})

-- Only act if a fold starts on the current line
local function fold_starts_here(lnum)
    if lnum <= 0 then
        return false
    end
    local lvl = vim.fn.foldlevel(lnum)
    if lvl <= 0 then
        return false
    end
    local prev = vim.fn.foldlevel(math.max(1, lnum - 1))
    return lvl > prev
end

local function safe_fold(cmd)
    local lnum = vim.fn.line(".")
    if fold_starts_here(lnum) then
        vim.cmd(("normal! %s"):format(cmd))
    else
        -- optional: comment this out if you prefer total silence
        -- vim.notify("No fold starts on this line", vim.log.levels.INFO, { title = "Folds" })
    end
end

-- Replace default fold keys with “safe” versions
vim.keymap.set("n", "zc", function()
    safe_fold("zc")
end, {
    desc = "Close fold (only if starts here)",
})
vim.keymap.set("n", "zo", function()
    safe_fold("zo")
end, {
    desc = "Open fold (only if starts here)",
})
vim.keymap.set("n", "za", function()
    safe_fold("za")
end, {
    desc = "Toggle fold (only if starts here)",
})

-- Correct keymaps: pass function, not result
vim.keymap.set("n", "zR", function()
    require("ufo").openAllFolds()
end, {
    desc = "Open all folds",
})
vim.keymap.set("n", "zM", function()
    require("ufo").closeAllFolds()
end, {
    desc = "Close all folds",
})
