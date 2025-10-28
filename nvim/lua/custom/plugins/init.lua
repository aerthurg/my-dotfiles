-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Adding Lazygit for a better integrated Git experience
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },

  -- Adding Noice.nvim for a better UI experience
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  -- Adding VimWiki for note-taking and task management
  {
    -- The plugin location on GitHub
    'vimwiki/vimwiki',
    -- The event that triggers the plugin
    event = 'BufEnter *.md',
    -- The keys that trigger the plugin
    keys = { '<leader>ww', '<leader>wt' },
    -- The configuration for the plugin
    init = function()
      vim.g.vimwiki_list = {
        {
          -- Here will be the path for your wiki
          path = '/home/aerthurg/Koofr/Databases/vimwiki-database',
          -- The syntax for the wiki
          syntax = 'markdown',
          ext = 'md',
        },
      }
      -- vim.g.vimwiki_ext2syntax = {}
    end,
  },

  -- Adding render-markdown for beautifying .md files render
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { 'markdown', 'vimwiki' },
      render_modes = true,
      anti_conceal = { enabled = false },
      latex = {
        enabled = true,
        render_modes = false,
        converter = { 'latex2text' },
        highlight = 'RenderMarkdownMath',
        position = 'center',
      },
      math = { enabled = true, engine = 'pylatexenc' },
      max_file_size = 15.0,
    },
  },

  -- Adding solarized-osaka as the theme
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = 'dark',
        floats = 'dark',
      },
    },
  },

  -- Adding Oil for a better file management experience
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    lazy = false,
  },
}
