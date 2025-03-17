require("thedondope.set")
require("thedondope.remap")
require("thedondope.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local TheDonDopeGroup = augroup('TheDonDope', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = TheDonDopeGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = TheDonDopeGroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = e.buf, desc = "LSP: Go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = e.buf, desc = "LSP: Show documentation" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = e.buf, desc = "LSP: Search workspace symbols" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = e.buf, desc = "Diagnostics: Open diagnostic float" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = e.buf, desc = "LSP: Code actions" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = e.buf, desc = "LSP: Find references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = e.buf, desc = "LSP: Rename symbol" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = e.buf, desc = "LSP: Signature help" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = e.buf, desc = "Diagnostics: Go to next item" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = e.buf, desc = "Diagnostics: Go to previous item" })
    end
})

-- You can uncomment the following lines if you do not use nvim-tree and instead use netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
