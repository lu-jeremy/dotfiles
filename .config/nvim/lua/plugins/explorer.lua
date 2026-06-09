return {
  "nvim-tree/nvim-tree.lua",
  tag = "compat-nvim-0.9",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = desc, buffer = bufnr, noremap = true, silent = true }
      end

      -- Load all default keybinds first
      api.config.mappings.default_on_attach(bufnr)

      -- Add custom keybinds on top
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close folder"))
      vim.keymap.set("n", "Y", api.fs.copy.absolute_path, opts("Copy absolute path"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end

    require("nvim-tree").setup({
      view = { width = 30 },
      filters = { dotfiles = false },
      on_attach = on_attach,
    })
    vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle explorer" })
    vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
  end,
}
