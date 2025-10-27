-- ~/.config/nvim/after/ftplugin/php.lua
vim.schedule(function()
    local attached = false
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if c.name == "intelephense" then
            attached = true
            break
        end
    end
    if not attached then
        pcall(vim.lsp.enable, "intelephense")
    end
end)
