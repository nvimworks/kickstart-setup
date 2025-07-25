return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        icons_enabled = true,
        theme = 'auto'
    },
    config = function()
        require("lualine").setup()
    end
}