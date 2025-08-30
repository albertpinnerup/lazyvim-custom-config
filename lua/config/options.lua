-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- -- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
--
local opt = vim.opt

opt.relativenumber = false

-- Treesitter-based folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- -- opt.foldcolumn = '0'
-- -- opt.foldtext = ""

-- -- Make folds nice to work with
-- opt.foldlevel = 99 -- open all folds by default
-- -- opt.foldlevelstart = 1 -- don’t start folded
-- opt.foldenable = true -- enable folding

-- function _G.fold_text()
--     local start_line = vim.fn.getline(vim.v.foldstart)
--     local end_line = vim.fn.getline(vim.v.foldend)
--     local n_lines = vim.v.foldend - vim.v.foldstart + 1

--     local text = ""

--     -- If it starts with a JSX tag
--     local tag = start_line:match("<(%w+)")
--     if tag then
--         text = string.format("<%s> … </%s> [%d lines]", tag, tag, n_lines)
--     elseif start_line:match("{") then
--         -- Curly brace block
--         text = string.format("{…} [%d lines]", n_lines)
--     else
--         -- Fallback
--         local trimmed = start_line:gsub("^%s+", ""):gsub("%s+$", "")
--         if #trimmed > 50 then
--             trimmed = trimmed:sub(1, 50) .. "..."
--         end
--         text = string.format("%s [%d lines]", trimmed, n_lines)
--     end

--     return " " .. text .. " "
-- end
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
vim.opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.fillchars = {
    fold = "▸",
    foldopen = "▾",
    foldsep = "│"
}

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {
    desc = "Move line down"
})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {
    desc = "Move line up"
})

-- Move selected lines up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down"
})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up"
})

