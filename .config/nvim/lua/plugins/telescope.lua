return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-c>"] = function() vim.cmd("stopinsert") end,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        file_ignore_patterns = { "node_modules", ".git/", "build/", "%.class" },
      },
    })

    telescope.load_extension("fzf")

    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fs", builtin.grep_string, { desc = "Grep word under cursor" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    map("n", "<leader>fc", builtin.git_commits, { desc = "Git commits" })
    map("n", "<leader>fb", builtin.git_branches, { desc = "Git branches" })
  end,
}
