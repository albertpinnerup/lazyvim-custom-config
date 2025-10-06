-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
--
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

vim.keymap.set("n", "<S-tab>", function()
    require("snacks").dashboard()
end, { desc = "open snacks dashboard" })

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
