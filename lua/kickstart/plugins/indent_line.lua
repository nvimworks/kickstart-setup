return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
      require("ibl").setup({
        indent = {
          char = "|"
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          highlight = { "Function", "Label" },
        }
      })
    end
  },
}
