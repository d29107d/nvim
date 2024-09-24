local prefix = ";"
local icon = vim.g.icons_enabled and "⚡︎" or ""
return {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true
        }
      }
    },
    keys = {
        {
            prefix .. "s",
            mode = {"n", "x", "o"},
            function() require("flash").jump() end,
            desc = "Flash jump"
        },
        {
            prefix .. "c",
            mode = {"n", "x", "o"},
            function()
                require("flash").jump({
                    pattern = vim.fn.expand("<cword>"),
                })
             end,
            desc = "Flash jump"
        },
        {
            prefix .. "n",
            mode = {"n", "x", "o"},
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^"
                })
             end,
            desc = "Flash jump"
        },
        {
            prefix .. "a",
            mode = {"n", "x", "o"},
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                      mode = function(pattern)
                        -- remove leading dot
                        if pattern:sub(1, 1) == "." then
                          pattern = pattern:sub(2)
                        end
                        -- return word pattern and proper skip pattern
                        return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                      end,
                    },
                    -- select the range
                    jump = { pos = "range" },
                  })
             end,
            desc = "Flash jump"
        },
    }
}