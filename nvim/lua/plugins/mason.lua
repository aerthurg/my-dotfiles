return {
  {
    "williamboman/mason.nvim",
    opts = function (_, opts)
      opts.ensure_installed = {
        "herb-language-server",
        "eslint_d",
        "prettierd",
        "docker-language-server"
      }
    end
  }
}
