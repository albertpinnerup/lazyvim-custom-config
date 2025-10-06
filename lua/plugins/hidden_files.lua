return {
    {
        "ibhagwan/fzf-lua",
        opts = function(_, opts)
            opts = opts or {}
            opts.files = opts.files or {}
            opts.files.fd_opts = [[--color=never --type f --hidden --follow --exclude .git]]
            return opts
        end,
    },

    --[[ {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- make sure defaults exists
      opts.defaults = opts.defaults or {}

      -- extend find_command safely
      opts.defaults.find_command = opts.defaults.find_command
        or { "fd", "--type", "f", "--hidden", "--exclude", ".git" }
      -- add --hidden if not present
      local has_hidden = false
      for _, v in ipairs(opts.defaults.find_command) do
        if v == "--hidden" then
          has_hidden = true
          break
        end
      end
      if not has_hidden then
        table.insert(opts.defaults.find_command, 2, "--hidden") -- after "fd"
      end

      -- file_ignore_patterns exists
      opts.defaults.file_ignore_patterns = opts.defaults.file_ignore_patterns or {}
    end,
  } ]]

    --[[ {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")

      vim.keymap.set("n", "<leader>fb", function()
        require("telescope").extensions.file_browser.file_browser({
          hidden = true,
        })
      end, { desc = "File Browser (show hidden files)" })
    end,
  } ]]

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            filters = { dotfiles = false }, -- show hidden files
        },
    },
}
