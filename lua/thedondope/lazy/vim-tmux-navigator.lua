return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux: Navigate left" })
        vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux: Navigate right" })
        vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux: Navigate down" })
        vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux: Navigate up" })
    end
}
