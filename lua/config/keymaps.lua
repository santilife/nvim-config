-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- prettier
-- En tu configuración de Neovim
vim.api.nvim_set_keymap(
    "n",
    "<leader>f", -- Usa <leader> + f para formatear
    "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
    { noremap = true, silent = true }
)

