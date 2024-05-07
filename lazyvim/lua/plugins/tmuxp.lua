return {
  dir = "/home/lys/project/tmuxp.nvim",
  cmd = {
    "TmuxpNewWindow",
    "TmuxpList",
  },
  keys = {
    {
      "<leader>m",
      mode = { "n" },
      "<cmd>TmuxpList<cr>",
      desc = "Test assistant",
    },
    {
      "<leader>mn",
      mode = { "n" },

      "<cmd>TmuxpNewWindow<cr>",
      desc = "New tmux window",
    },
  },
}
