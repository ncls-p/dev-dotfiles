lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "catppuccin-mocha"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true


-- Additional Plugins
lvim.plugins = {
  -- copilot
  { "github/copilot.vim" },

  -- Discord Presence
  { "andweeb/presence.nvim" },

  -- colorizer
  { "norcalli/nvim-colorizer.lua" },

  -- smooth scroll
  { "karb94/neoscroll.nvim" },

  -- python env
  { "PieterjanMontens/vim-pipenv" },

  -- catpuccin
  { "catppuccin/nvim" },

  -- git conflit
  {
    'akinsho/git-conflict.nvim',
    tag = "*",
    config = function()
      require('git-conflict').setup()
    end
  },

  -- whitespace
  {
    'johnfrankmorgan/whitespace.nvim',
    config = function()
      require('whitespace-nvim').setup({
        highlight = 'DiffDelete',
        ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
        ignore_terminal = true,
      })
      vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
    end
  },

  -- Prettier
  {
    "sbdchd/neoformat"
  },
  -- jupynium
  {
    { "kiyoon/jupynium.nvim",  run = "pip3 install --user ." },
    { "hrsh7th/nvim-cmp" },
    { "rcarriga/nvim-notify" },
    { "stevearc/dressing.nvim" },
  },
}

-- autocmd prettier
lvim.autocommands.custom_groups = {
  { "BBufWinEnter,BufWritePre,InsertLeave,TextChanged",
    "*.js,*.jsx,*.ts,*.tsx,*.lua,*.py,*.go,*.rs,*.c,*.cpp,*.h,*.hpp,*.css,*.scss,*.html,*.json,*.md,*.yaml,*.toml,*.yml,*.sh,*.fish,*.zsh,*.bash,*.rb,*.php,*.java,*.dart,*.kt,*.kts,*.swift,*.vue,*.svelte,*.elm,*.erl,*.ex,*.exs,*.eex,*.leex,*.hrl,*.rl,*.rs,*.r",
    ":Neoformat prettier" },
}

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

-- copilot
lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

-- show errors with key map ctrl + m
vim.api.nvim_set_keymap("n", "<C-m>", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true, silent = true })

-- lsp automatic server install
lvim.lsp.automatic_servers_installation = true

-- dap
lvim.builtin.dap.active = true

-- set indentation
vim.opt.showtabline = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- debug
lvim.builtin.dap.active = true

-- colorColumn
vim.opt.colorcolumn = { 81, 101, 121 }
