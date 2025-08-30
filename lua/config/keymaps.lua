-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
    desc = "Exit terminal mode"
})
-- in lua/config/keymaps.lua
-- vim.keymap.set("n", "<leader>tt", function()
-- require("toggleterm").toggle(1, 20, vim.loop.cwd(), "horizontal")
-- end, { desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>tr", ":bd!<CR>", {
    desc = "Close terminal completely"
})

vim.api.nvim_create_user_command("Tutor", function()
    vim.cmd("silent! Tutor")
end, {})

-- Correct keymaps: pass function, not result
vim.keymap.set('n', 'zR', function()
    require('ufo').openAllFolds()
end, {
    desc = 'Open all folds'
})
vim.keymap.set('n', 'zM', function()
    require('ufo').closeAllFolds()
end, {
    desc = 'Close all folds'
})
