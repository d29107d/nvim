return {
    "stevearc/aerial.nvim",
    opts = {
        ignore = {
            filetypes = {"txt"},
        },

        filter_kind = {
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Interface",
            "Module",
            "Method",
            "Struct",
        },
    }
}