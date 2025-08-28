return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts

  opts = {
    -- Define your formatters
    formatters_by_ft = {
      -- Disabling stylua and shfmt (I don't need them)
      -- lua = { "stylua" },
      -- sh = { "shfmt" },

      -- Enabled formatters
      python = { "pylsp" },
      rust = { "rust_analyzer" },
      webassembly = { "wasm-language-tools" },
      -- javascript = { "prettierd", stop_after_first = true },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
