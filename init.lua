-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("flash").toggle()

-- vim.g.trouble_lualine = false
vim.cmd([[ hi IlluminatedWordRead gui=underline ]])
vim.cmd([[ colorscheme tokyonight-night ]])
