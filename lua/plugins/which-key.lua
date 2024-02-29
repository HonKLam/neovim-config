return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 -- Time in ms until which-key ui is activated
  end,

  config = function()
    local wk = require("which-key")
    wk.setup({
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        -- '"',
        "<c-r>",
        -- spelling
        "z=",
      },
    })

    wk.register({
      ["<leader>"] = {
        f = {
          name = "File",
          f = { "<cmd>Telescope find_files hidden=true<CR>", "Find File" },
          g = { "<cmd>Telescope live_grep<CR>", "live Grep" },
          b = { "<cmd>Telescope buffers<CR>", "Show Buffers" },
          h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
        },

        g = {
          name = "Tools",
          f = { vim.lsp.buf.format, "Format File" },
          g = { "<cmd>LazyGit<CR>", "LazyGit" },
        },

        c = {
          name = "Code",
          a = { vim.lsp.buf.code_action, "Code Actions" },
        },

        n = { ":Telescope file_browser<CR>", "File Browser" },

        x = {
          name = "Trouble",
          x = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
          w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Worspace Diagnostics" },
          d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Document Diagnostics" },
          q = { "<leader>xq <cmd>TroubleToggle quickfix<cr>", "Trouble Quickfix" },
        },

        w = { "<cmd>w<CR>", "Save File" },
      },
    })
  end,
}
