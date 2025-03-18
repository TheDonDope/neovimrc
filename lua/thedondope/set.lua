-- Keep block as gui cursor in all modes
vim.opt.guicursor = ''

-- Make line numbers default
vim.opt.number = true
-- Enable relative line numbers to help with jumping
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Show the mode (Insert/Visual etc.)
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Configure indents
vim.opt.breakindent = true
vim.opt.smartindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 100

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Highlight the cursors current line
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8

-- Configure tabstops
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- No line wrapping
vim.opt.wrap = false

-- Configure backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Configure search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable 24-bit RGB color in the tui
vim.opt.termguicolors = true

-- Include file names in search which have an @ sign in their name
vim.opt.isfname:append('@-@')

-- Draw a optical vertical ruler at column 80
vim.opt.colorcolumn = '80'

-- To enable obsidian plugin markdown rendering features
-- vim.opt.conceallevel = 1
