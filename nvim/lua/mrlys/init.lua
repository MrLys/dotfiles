require("mrlys.set")
require("mrlys.packer")
require("mrlys.remap")

local augroup = vim.api.nvim_create_augroup
local mrlysGroup = augroup("mrlys", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWritePre"}, {
    group = mrlysGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

