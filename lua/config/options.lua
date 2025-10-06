-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- -- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
--
local opt = vim.opt

opt.relativenumber = true

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

opt.smartindent = true
opt.autoindent = true
opt.expandtab = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
-- vim.opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.fillchars = {
--     fold = "▸",
--     foldopen = "▾",
--     foldsep = "│"
-- }

--[[ vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {
    desc = "Move line down",
})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {
    desc = "Move line up",
})

-- Move selected lines up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {
    desc = "Move selection down",
})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {
    desc = "Move selection up",
}) ]]

opt.termguicolors = true
