local function map(mode, key, cmd)
   return vim.api.nvim_set_keymap(mode, key, cmd, { silent = true })
end

local function bufmap(mode, key, cmd)
   return vim.api.nvim_buf_set_keymap(bufnr or 0, mode, key, cmd, { silent = true })
end

local key_bindings = {
  {
    mode = 'n',
    cmd = "<cmd>NeoTreeRevealToggle<CR>",
    key = "<C-f>"
  },
  {
    mode = 'n',
    cmd = "<cmd>NeoTreeFocus<CR>",
    key = "<C-M-f>"
  },
  {
    mode = 'n',
    cmd = "<cmd>w<cr>",
    key = "<space>fs"
  },
  {
    mode = 'n',
    cmd = "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    key = "<space>wa",
    buf = true
  },
  {
    mode = 'n',
    cmd = "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    key = "<space>wr",
    buf = true
  },
  {
    mode = 'n',
    cmd = "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    key = "<space>wl",
    buf = true
  },
  {
    mode = 'n',
    cmd = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    key = "<space>fd",
    buf = true
  },
  {
    mode = 'n',
    cmd = "<cmd>lua vim.lsp.buf.rename()<CR>",
    key = "<space>rn",
    buf = true
  },
  {
    mode = 'n',
    cmd = "<cmd>lua vim.lsp.buf.formatting()<CR>",
    key = "<space-M>f",
    buf = true
  } 
}


for index, value in pairs(key_bindings) do
  if not value.buf then
    map(value.mode, value.key, value.cmd)
  else
    bufmap(value.mode, value.key, value.cmd)
  end
end
