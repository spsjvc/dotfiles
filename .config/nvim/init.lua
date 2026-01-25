-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Hybrid line numbers - absolute on current line, relative on other lines
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line
vim.opt.cursorline = true

-- Show whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '→ ', multispace = '·', trail = '·', nbsp = '␣', }

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'nvim-telescope/telescope.nvim',
      tag = 'v0.2.1',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        require('telescope').setup({
          defaults = {
            file_ignore_patterns = { "^.git/" },
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                prompt_position = "top",
                width = { padding = 0 },
                height = { padding = 0 },
                preview_width = 0.5,
              },
            },
            sorting_strategy = "ascending",
          }
        })
      end
    },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Telescope keybindings
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<CR>', { noremap = true })
