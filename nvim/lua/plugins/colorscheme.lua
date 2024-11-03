return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      style = "night",
      transparent = true,
      styles = {
        sidebards = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- make neotree background transparent
        hl.NeoTreeNormal = { bg = "none" }
        hl.NeoTreeNormalNC = { bg = "none" }
      end,
    }
  end,
}
