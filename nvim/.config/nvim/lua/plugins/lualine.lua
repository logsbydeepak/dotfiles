return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "tiagovla/scope.nvim" },
  config = function()
    -- tab-scoped buffers
    require("scope").setup({})

    -- vague palette
    local c = {
      bg      = "#141415",
      fg      = "#cdcdcd",
      line    = "#252530",
      comment = "#606079",
      keyword = "#6e94b2",
      string  = "#e8b589",
      func    = "#c48282",
      error   = "#d8647e",
    }

    local vague = {
      normal = {
        a = { bg = c.keyword, fg = c.bg, gui = "bold" },
        b = { bg = c.line, fg = c.fg },
        c = { bg = c.bg, fg = c.comment },
      },
      insert = {
        a = { bg = c.string, fg = c.bg, gui = "bold" },
        b = { bg = c.line, fg = c.fg },
      },
      visual = {
        a = { bg = c.func, fg = c.bg, gui = "bold" },
        b = { bg = c.line, fg = c.fg },
      },
      replace = {
        a = { bg = c.error, fg = c.bg, gui = "bold" },
        b = { bg = c.line, fg = c.fg },
      },
      command = {
        a = { bg = c.comment, fg = c.bg, gui = "bold" },
        b = { bg = c.line, fg = c.fg },
      },
      inactive = {
        a = { bg = c.bg, fg = c.comment },
        b = { bg = c.bg, fg = c.comment },
        c = { bg = c.bg, fg = c.comment },
      },
    }

    require("lualine").setup({
      options = {
        theme = vague,
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
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            mode = 2,
            tabs_color = {
              active = { bg = c.line, fg = c.fg, gui = "bold" },
              inactive = { bg = c.bg, fg = c.comment },
            },
            fmt = function(name, context)
              local tp = vim.api.nvim_list_tabpages()[context.tabnr]
              if tp then
                local ok, custom = pcall(vim.api.nvim_tabpage_get_var, tp, "tabname")
                if ok and custom and custom ~= "" then
                  return custom
                end
              end
              return name
            end,
          },
        },
      },
    })

    -- only show tabline when there are 2+ tabs
    vim.opt.showtabline = 1

    vim.keymap.set("n", "<S-h>", ":bprev<cr>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>q", ":bw<CR>")
    vim.keymap.set("n", "<leader>Q", ":bufdo bd<CR>")

    -- tabs
    vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
    vim.keymap.set("n", "<leader>tw", ":tabclose<CR>", { desc = "Close tab" })
    vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
    vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
    vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Prev tab" })

    -- rename current tab
    vim.keymap.set("n", "<leader>tr", function()
      vim.ui.input({ prompt = "Tab name: ", default = vim.t.tabname or "" }, function(input)
        if input ~= nil then
          vim.t.tabname = input
          vim.cmd("redrawtabline")
        end
      end)
    end, { desc = "Rename tab" })

    -- jump directly to tab by number: <leader>1 .. <leader>9
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
    end
  end,
}
