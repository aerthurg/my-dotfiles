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
      -- Disabling stylua and shfmt to avoid autoinstall
      -- lua = { "stylua" },
      -- sh = { "shfmt" },

      -- Enabled formatters
      php = { "duster" },
      blade = { "duster" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
