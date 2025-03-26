return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").find_files({ cwd = "/Volumes/Workspaces/src" })
        end,
        desc = "Find file in Workspace",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Find in here",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({ cwd = "/Volumes/Workspaces/src" })
        end,
        desc = "Grep in workspace",
      },
      {
        -- Find word in current file
        "<leader>fu",
        function()
          require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("%:p") } })
        end,
        desc = "Grep in workspace",
      },
      {
        "<leader>fi",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep in workspace",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    config = function()
      local telescope = require("telescope")

      -- first setup telescope
      telescope.setup({
        -- your config
      })

      -- then load the extension
      telescope.load_extension("live_grep_args")
    end,
  },
}
