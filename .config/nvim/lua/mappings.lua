-- remaps
local opts = { noremap = true , silent = true}
local keymap = vim.api.nvim_set_keymap
local bufkeymap = vim.api.nvim_buf_set_keymap

keymap('n', '<C-s>', ':w<CR>', {})
keymap('i', '<C-s>', '<ESC>:w<CR>', {})

-- Switch between splits faster
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-s>s', ':source %<CR>', opts)

-- Switch between tabs faster
keymap('n', '<C-Left>', ':tabprevious<CR>', opts)
keymap('n', '<C-Right>', ':tabnext<CR>', opts)
keymap('n', '<C-t>', ':tabnew<CR>', opts)
keymap('n', '<C-S-Left>', ':tabm -1<CR>', opts)
keymap('n', '<C-S-Right>', ':tabm +1<CR>', opts)

keymap('n', '<c-P>', '<cmd>FzfLua<CR>', opts)

-- NvimTree
keymap('n', '<c-n>', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', opts)

vim.cmd[[ autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif ]]

-- Formatting
keymap('n', '<space>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Packer 
keymap('n', '<space>ps', '<cmd>PackerSync<CR>', opts)

keymap('n', '<space>t', '<cmd>ToggleTerm<CR>', opts)

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  bufkeymap(0, 't', '<leader><Esc>', [[<C-\><C-n>]], opts)
  bufkeymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  bufkeymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  bufkeymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  bufkeymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  bufkeymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
