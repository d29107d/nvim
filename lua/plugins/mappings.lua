---@type LazySpec
return {
    "AstroNvim/astrocore",
    opts = function(
      _,
      opts --[[@as AstroCoreOpts]]
    )
      local maps = opts.mappings
      local is_available = require("astrocore").is_available
      -- disbale defaults:

      if is_available then
        -- local builtin = require('telescope.builtin')

        maps.n["<Leader>fd"] = {
            function ()
                local word = vim.fn.expand("<cword>")
                return vim.cmd(string.format("Telescope find_files default_text=%s", word))
            end,
            desc = "Find files under cursor",
        }
        -- maps.n["<C-s>"] = { ":w!<cr>", desc = "Save File" }
        maps.n["cqc"] = {
          ":ccl<cr>",
          desc = "Close Quickfix List",
        }
        maps.n["cqj"] = {
          ":cprevious<cr>",
          desc = "Next Quickfix Entry",
        }
        maps.n["cqk"] = {
          ":cnext<cr>",
          desc = "Previous Quickfix Entry",
        }

        maps.n["<Leader>ma"] = {
          "<cmd>AerialToggle!<CR>",
          desc = "Aerial Toggle",
        }

        maps.n["<Leader>mn"] = {
          "<cmd>AerialNavToggle<CR>",
          desc = "Aerial Nav Toggle",
        }

        maps.n["<Leader>tt"] = {
          "<cmd>ToggleAlternate<CR>",
          desc = "Toggler",
        }

        -- maps.n[";"] = {
        --   desc = "⚡︎ Flash",
        -- }
      end

    end,
  }