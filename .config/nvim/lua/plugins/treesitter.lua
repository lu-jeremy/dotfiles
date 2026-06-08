return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "java",
        "javascript",
        "typescript",
        "lua",
        "json",
        "yaml",
        "markdown",
        "bash",
        "vim",
        "vimdoc",
        "c",
        "cpp",
        "rust",
        "go",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
