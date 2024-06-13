return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        section_separators = { left = "█", right = "█" },
        component_separators = { left = " ", right = " " },
      },
      sections = {
        lualine_a = {
          {
            'buffers',
          },
        },
        lualine_b = {
        },
        lualine_c = {
        },
        lualine_x = {
          {
            'branch', 'diff', 'diagnostics'
          }

        },
      }
    })

    vim.keymap.set("n", "<S-h>", ":bprev<cr>", {})
    vim.keymap.set("n", "<S-l>", ":bnext<cr>", {})
    vim.keymap.set("n", "<leader>q", ":bw<CR>")
    vim.keymap.set("n", "<leader>Q", ":bufdo bd<CR>")
  end,
}
