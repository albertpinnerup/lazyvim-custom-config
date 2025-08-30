-- Using lazy.nvim
return {
  "andymass/vim-matchup",
  event = "BufRead",
  config = function()
    vim.g.matchup_enabled = 1
    vim.g.matchup_html_infer_tag = 1
  end,
}
