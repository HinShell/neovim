return {
  {
    "mihaifm/megatoggler",
    keys = {
      { "<leader>M", "<cmd>MegaToggler<CR>", desc = "Megatoggler" },
    },
    config = function()
      require("megatoggler").setup({
        tabs = {
          {
            -- global options you might want to persist
            id = "Globals",
            items = {
              {
                id = "Ignore Case",
                -- all items must define a get method
                get = function() return vim.o.ignorecase end,
                -- items with boolean value must define on_toggle
                on_toggle = function(on) vim.o.ignorecase = on end,
              },
              {
                id = "Expand Tab",
                get = function() return vim.opt_global.expandtab:get() end,
                on_toggle = function(on) vim.opt_global.expandtab = on end,
              },
              {
                id = "Relative Number",
                get = function() return vim.wo.relativenumber end,
                on_toggle = function(on) vim.wo.relativenumber = on end,
              },
              {
                id = "Tabstop",
                label = "Tab Stop", -- optional label
                desc = "Tab size",  -- optional description
                get = function()
                  -- use opt_global for vim options you want to persist
                  return vim.opt_global.tabstop:get()
                end,
                -- items with numeric/string value must define on_set
                on_set = function(v)
                  vim.opt_global.tabstop = v
                end,
                -- size of the textbox when editing
                edit_size = 3
              },
              {
                id = "Inc Command",
                get = function() return vim.o.inccommand end,
                on_set = function(v) vim.o.inccommand = v end,
                edit_size = 10
              },
            }
          },
          {
            -- local options you might want to toggle but not persist
            id = "Local",
            items = {
              {
                id = 'Tabstop',
                -- disable persistence for buffer-local options
                persist = false,
                get = function() return vim.bo.tabstop end,
                on_set = function(v) vim.bo.tabstop = v end
              },
              {
                id = "Relative Number",
                get = function() return vim.wo.relativenumber end,
                on_toggle = function(on) vim.wo.relativenumber = on end,
              },
            }
          },
          {
            -- toggle features provided by other plugins
            id = "Features",
            items = {
              {
                id = "Autopairs",
                get = function()
                  -- check if plugin is loaded by Lazy
                  -- only needed if you lazy load the plugin
                  local lc = require("lazy.core.config")
                  if not (lc.plugins["nvim-autopairs"] and lc.plugins["nvim-autopairs"]._.loaded) then
                    return false
                  end

                  return not require("nvim-autopairs").state.disabled
                end,
                on_toggle = function(on)
                  -- avoid lazy loading the plugin if on == false
                  if on == false then
                    local lc = require("lazy.core.config")
                    if not (lc.plugins["nvim-autopairs"] and lc.plugins["nvim-autopairs"]._.loaded) then
                      return
                    end
                  end

                  if on then
                    require("nvim-autopairs").enable()
                  else
                    require("nvim-autopairs").disable()
                  end
                end
              },
              {
                id = "Smooth scrolling",
                -- disable persistence when it's difficult to get the plugin's internal state
                persist = false,
                get = function() return true end,
                on_toggle = function() vim.cmd("ToggleNeoscroll") end,
                -- set custom icons for plugins where it's difficult to get the state
                icons = { checked = "", unchecked = "" },
              },
            }
          }
        }
      })
    end
  }
}
