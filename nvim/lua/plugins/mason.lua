return {
  {
    "williamboman/mason.nvim",
    opts = function (_, opts)
      opts.ensure_installed = {
        "uv",
        "wasm-language-tools",
        "docker-language-server"
      }
    end
  }
}
