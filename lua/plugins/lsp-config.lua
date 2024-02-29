return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "html",
          "cssls",
          "dockerls",
          "jsonls",
          "eslint",
        },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Auto-Setup LSPs mentioned above
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("lspconfig")["gdscript"].setup({
        capabilities = capabilities,
        cmd = { "nc", "localhost", "6005" },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end,
  },
}
