return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "tailwindcss",
          "ts_ls",
          "pyright",
          "docker_compose_language_service",
          "dockerls",
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
      lspconfig.html.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.docker_compose_language_service.setup({})

      -- setting up useful keymaps for language servers
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end,
  },
}
