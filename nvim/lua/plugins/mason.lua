return {
  {
    "williamboman/mason.nvim",
    opts = function (_, opts)
      opts.ensure_installed = {
        "duster",
        "eslint_d",
        "prettierd",
        "docker-language-server"
      }
    end
  }
}
