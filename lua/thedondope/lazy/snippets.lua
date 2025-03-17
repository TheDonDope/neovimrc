return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local ls = require("luasnip")
        ls.filetype_extend("javascript", { "jsdoc" }) -- Extend JavaScript filetype with JSDoc snippets

        -- Expand the current snippet
        vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true, desc = "LuaSnip: Expand snippet" })

        -- Jump forward in the snippet
        vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end,
            { silent = true, desc = "LuaSnip: Jump to next snippet node" })

        -- Jump backward in the snippet
        vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end,
            { silent = true, desc = "LuaSnip: Jump to previous snippet node" })

        -- Cycle through choices in a snippet (if available)
        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true, desc = "LuaSnip: Cycle snippet choices" })
    end,
}
