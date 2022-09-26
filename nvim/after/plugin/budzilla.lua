print(vim.inspect(os.getenv("BUDZILLA_HOST")))
require("budzilla").setup({host = os.getenv("BUDZILLA_HOST")})

