return {
  {
    "mrlys/assistant.nvim",
    opts = {
      api_key = function()
        return os.getenv("ANTHROPIC_CLAUDE_API_KEY")
      end,
      sleep_ms = 25,
      render_hook = function(input_winid, chat_winid, _)
        local success, ui = pcall(require, "render-markdown.ui")
        if success then
          vim.api.nvim_set_current_win(chat_winid)
          ui.refresh()
          vim.api.nvim_set_current_win(input_winid)
        end
      end,
      move_to_input_key = "<c-j>",
      move_to_chat_key = "<c-k>",
    },
    cmd = {
      "AssistantToggle",
      "AssistantChat",
      "AssistantInput",
    },
    keys = {
      {
        "<leader>t",
        "<cmd>AssistantToggle<cr>",
        desc = "Toggle assistant chat window",
      },
      {
        "<leader>th",
        "<cmd>AssistantHide<cr>",
        desc = "Hide assistant chat window",
      },
    },
  },
  {
    "github/copilot.vim",
  },
}
