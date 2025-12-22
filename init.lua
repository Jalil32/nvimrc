-- Leader key (must be before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.omni_sql_default_compl_type = "syntax"
-- Load core config
require("config.options")
require("config.keymaps")
-- Load plugins
require("config.lazy")
