return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          neotree = true,
          telescope = {
            enabled = true,
          }
        }
      })

      vim.o.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
