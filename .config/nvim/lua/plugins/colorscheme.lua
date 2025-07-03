return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "soft",
        palette_overrides = {},
        overrides = {},
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
