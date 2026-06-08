return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left (tmux/nvim)" },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down (tmux/nvim)" },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up (tmux/nvim)" },
    -- C-l intentionally NOT mapped — keeps its clear-screen behavior
    -- Use <leader>l to navigate right within nvim instead
  },
  init = function()
    vim.keymap.set("n", "<leader>l", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate right (tmux/nvim)" })
  end,
}
