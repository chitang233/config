vim.opt.number = true
vim.opt.relativenumber = true

lvim.plugins = {
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  {
    'github/copilot.vim',
    cmd = "Copilot",
    event = "InsertEnter"
  }
}
