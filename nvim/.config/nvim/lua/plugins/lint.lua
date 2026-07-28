return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      astro = { "eslint_d" },
      -- python is handled by the ruff LSP; add extra linters here if desired
    }

    local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

    -- Run only linters whose executable is actually installed
    local function try_lint_available()
      local names = lint.linters_by_ft[vim.bo.filetype] or {}
      local runnable = {}
      for _, name in ipairs(names) do
        local linter = lint.linters[name]
        local cmd = type(linter) == "table" and linter.cmd or nil
        if type(cmd) == "function" then
          cmd = cmd()
        end
        if cmd and vim.fn.executable(cmd) == 1 then
          table.insert(runnable, name)
        end
      end
      if #runnable > 0 then
        lint.try_lint(runnable)
      end
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = try_lint_available,
    })

    vim.keymap.set("n", "<leader>l", try_lint_available, { desc = "Trigger linting for current file" })
  end,
}
