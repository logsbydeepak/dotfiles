-- return {
--   "christoomey/vim-tmux-navigator",
--   cmd = {
--     "TmuxNavigateLeft",
--     "TmuxNavigateDown",
--     "TmuxNavigateUp",
--     "TmuxNavigateRight",
--     "TmuxNavigatePrevious",
--   },
--   keys = {
--     { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
--     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--   }
-- }

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}

    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", {})
    vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", {})
    vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", {})
    vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", {})
    vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", {})
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {})
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {})
    vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", {})
    vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", {})
  end
}
