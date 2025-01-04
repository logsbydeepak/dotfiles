return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "ts_ls", "html", "tailwindcss", "astro", "cssls", "clangd" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilites = capabilities,
            }
          end,
        }
      }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
    end,
  },
  {
    lazy = true,
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
