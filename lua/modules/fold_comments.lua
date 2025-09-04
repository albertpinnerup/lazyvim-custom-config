-- fold-comments.lua
local M = {}

-- returns fold ranges for consecutive comment lines
function M.get_comment_folds(bufnr)
    local folds = {}
    local start_line = nil

    for lnum = 1, vim.api.nvim_buf_line_count(bufnr) do
        local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
        if line:match("^%s*//") or line:match("^%s*/%*") or line:match("^%s*{/%*") then
            if not start_line then
                start_line = lnum
            end
        else
            if start_line then
                if lnum - start_line > 1 then
                    table.insert(folds, { start_line - 1, lnum - 2 }) -- zero-indexed
                end
                start_line = nil
            end
        end
    end

    -- end of file
    if start_line and vim.api.nvim_buf_line_count(bufnr) - start_line >= 1 then
        table.insert(folds, { start_line - 1, vim.api.nvim_buf_line_count(bufnr) - 1 })
    end

    return folds
end

return M
