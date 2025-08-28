return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        python = { "pylsp" },
        webassembly = { "wasm-language-tools" }
      }
    end,
  },
}
