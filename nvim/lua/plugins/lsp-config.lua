return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "rust_analyzer",
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
      lspconfig.pyright.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.tailwindcss.setup({})

      -- setting up useful keymaps for language servers
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end,
  },
}
