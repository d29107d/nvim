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
          "<cmd>Switch<CR>",
          desc = "Toggler",
        }

        maps.n["<Leader>bj"] = {
          "<cmd>bprevious<CR>",
          desc = "Buffer previous",
        }

        maps.n["<Leader>bk"] = {
          "<cmd>bnext<CR>",
          desc = "Buffer next",
        }

        maps.n["<Leader>ro"] = {
          "<cmd>set formatoptions-=ro<CR>",
          desc = "Disable the automatic insertion of comment symbols when wrapping lines.",
        }

        maps.n["H"] = {
          function()
            require("astrocore.buffer").nav(-vim.v.count1)
          end,
          desc = "Next buffer"
        }

        maps.n["L"] = {
          function()
            require("astrocore.buffer").nav(vim.v.count1)
          end,
          desc = "Previous buffer"
        }

        -- mappings seen under group name "Buffer"
        maps.n["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        }

        maps.n["J"] = {
          function()

          end,
          desc = "",
        }

        -- maps.n[";"] = {
        --   desc = "⚡︎ Flash",
        -- }
      end

    end,
  }