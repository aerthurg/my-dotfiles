return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruby_lsp",
          "sorbet",
          "ts_ls",
          "stimulus_ls",
          "tailwindcss",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- setting up language servers
      lspconfig.lua_ls.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.sorbet.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.stimulus_ls.setup({})
      lspconfig.tailwindcss.setup({})

      -- setting up useful keymaps for language servers
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end,
  },
}
