-- toggler true false
return {
    "rmagatti/alternate-toggler",
    name = "alternate-toggler",
    config = function ()
    end,
    opts = {
        alternates = {
            ["true"] = "false",
            ["True"] = "False",
            ["TRUE"] = "FALSE",
            ["Yes"] = "No",
            ["YES"] = "NO",
            ["1"] = "0",
            ["<"] = ">",
            ["("] = ")",
            ["["] = "]",
            ["{"] = "}",
            ['"'] = "'",
            ['""'] = "''",
            ["+"] = "-",
            ["==="] = "!=="
        }
    }
}