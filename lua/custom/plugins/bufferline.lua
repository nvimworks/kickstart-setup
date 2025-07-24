return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                options = {
                    -- Buffer management
                    mode = "buffers", -- can be "buffers" or "tabs"
                    themable = true,
                    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"
                    close_command = "bdelete! %d",
                    right_mouse_command = "bdelete! %d",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = nil,
                    
                    -- Visual settings
                    indicator = {
                        icon = '▎', -- this should be omitted if indicator style is not 'icon'
                        style = 'icon', -- 'icon' | 'underline' | 'none'
                    },
                    buffer_close_icon = 'X',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    
                    -- Tabs
                    max_name_length = 18,
                    max_prefix_length = 15,
                    tab_size = 18,
                    diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
                    diagnostics_update_in_insert = false,
                    
                    -- Custom areas
                    custom_areas = {
                        right = function()
                            local result = {}
                            local seve = vim.diagnostic.severity
                            local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
                            local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
                            local info = #vim.diagnostic.get(0, {severity = seve.INFO})
                            local hint = #vim.diagnostic.get(0, {severity = seve.HINT})
                            
                            if error ~= 0 then
                                table.insert(result, {text = "  " .. error, fg = "#EC5241"})
                            end
                            
                            if warning ~= 0 then
                                table.insert(result, {text = "  " .. warning, fg = "#EFB839"})
                            end
                            
                            if hint ~= 0 then
                                table.insert(result, {text = "  " .. hint, fg = "#A3BA5E"})
                            end
                            
                            if info ~= 0 then
                                table.insert(result, {text = "  " .. info, fg = "#7EA9A7"})
                            end
                            return result
                        end,
                    },
                    
                    -- Appearance
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    show_tab_indicators = true,
                    persist_buffer_sort = true,
                    separator_style = "thin", -- "slant" | "thick" | "thin" | {"any", "any"}
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
                    
                    -- Sorting
                    sort_by = 'id', -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs'
                    
                    -- Filtering
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                    
                    -- Hover
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                }
            })
            
            -- Keymaps for bufferline
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }
            
            -- Navigate buffers
            keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
            keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
            
            -- Move buffers
            keymap("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", opts)
            keymap("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", opts)
            
            -- Buffer operations
            keymap("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", opts)
            keymap("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", opts)
            keymap("n", "<leader>bse", "<Cmd>BufferLineSortByExtension<CR>", opts)
            keymap("n", "<leader>bsd", "<Cmd>BufferLineSortByDirectory<CR>", opts)
            
            -- Close buffers
            keymap("n", "<leader>bd", "<Cmd>bdelete<CR>", opts)
            keymap("n", "<leader>bD", "<Cmd>bdelete!<CR>", opts)
            keymap("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", opts)
            keymap("n", "<leader>bcr", "<Cmd>BufferLineCloseRight<CR>", opts)
            keymap("n", "<leader>bcl", "<Cmd>BufferLineCloseLeft<CR>", opts)
            
            -- Go to buffer by number
            for i = 1, 9 do
                keymap("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
            end
        end
    }
}