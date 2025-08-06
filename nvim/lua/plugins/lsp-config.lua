return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "phpactor",
          "ts_ls",
          "volar",
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
      lspconfig.phpactor.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.volar.setup({})
      lspconfig.tailwindcss.setup({})

      -- setting up useful keymaps for language servers
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end,
  },
}
