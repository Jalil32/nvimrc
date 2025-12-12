return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
    })
    vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>")
    vim.keymap.set("n", "-", "<cmd>Oil<cr>")
  end,
}
