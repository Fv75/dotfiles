vim.g.mapleader = ' '

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------NvimTree------
map("n", "<leader>po", ":NvimTreeToggle<cr>")
map("n", "<leader>pf", ":NvimTreeFindFile<cr>")

