return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        harpoon = true,
        mason = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
