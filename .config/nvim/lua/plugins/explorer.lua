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

      -- Navigation
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close folder"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in vsplit"))
      vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open in split"))
      vim.keymap.set("n", "t", api.node.open.tab, opts("Open in new tab"))

      -- File operations
      vim.keymap.set("n", "a", api.fs.create, opts("Create file/folder"))
      vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))

      -- Misc
      vim.keymap.set("n", "q", api.tree.close, opts("Close tree"))
      vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
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
