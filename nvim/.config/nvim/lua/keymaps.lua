-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ My own commands ]]
-- ok most taken shamelessly from ThePrimagen

-- Navigate wrapped text
vim.keymap.set('n', '<up>', 'g<up>')
vim.keymap.set('n', '<down>', 'g<down>')
-- Open file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })
-- Center cursor when paging up
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move screen half-page up, center cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move screen half-page up, center cursor' })
vim.keymap.set('n', '<C-e>', '<C-d>zz', { desc = 'Move screen half-page up, center cursor' })
-- Unfold region when searching
vim.keymap.set('n', 'n', 'nzv')
vim.keymap.set('n', 'N', 'Nzv')
-- Move selected lines up/down, like alt-up/down in vscode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Keep cursor in same spot when combining lines
vim.keymap.set('n', 'J', 'mzJ`z')
-- "Never press shift-q it's the worst place in the universe"
vim.keymap.set('n', 'Q', '<nop>')

-- Paste without overwriting paste register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over selection without overwriting buffer' })

-- enable word backspace/delete from insert mode
vim.keymap.set('i', '<C-H>', '<C-w>')
vim.keymap.set('i', '<C-BS>', '<C-w>') -- this doesn't work in terminal
vim.keymap.set('i', '<C-Del>', '<Esc>lvec')

-- allow ctrl-shift select from insert mode
vim.keymap.set('i', '<C-S-left>', '<Esc>vb')
vim.keymap.set('i', '<C-S-right>', '<Esc>lve')
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
