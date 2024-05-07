return {
  {
    dir = "~/project/tramp.nvim/",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    cmd = { "Tramp", "TrampSubmit" },
    keys = {},
    opts = {
      tramp_url = "",
    },
  },
  {
    "vidocqh/data-viewer.nvim",
    branch = "main",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua", -- Optional, sqlite support
    },
  },
}
