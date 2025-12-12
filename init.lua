-- Leader key (must be before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Load core config
require("config.options")
require("config.keymaps")
-- Load plugins
require("config.lazy")
