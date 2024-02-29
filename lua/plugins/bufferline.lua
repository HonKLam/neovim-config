return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        style_preset = require("bufferline").style_preset.minimal,
        buffer_close_icon = "",
        sort_by = "insert_at_end",
        diagnostics = "nvim_lsp",

        offsets = {
          text_align = "left",
        },

        indicator = {
          icon = '▎',
          style = "icon",
        },
      },
    })
  end,
}
