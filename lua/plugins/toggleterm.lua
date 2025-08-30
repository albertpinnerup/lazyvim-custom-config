return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<leader>tt]],
        direction = "horizontal", -- can be "vertical", "float", etc.
      })
    end,
  },
}
