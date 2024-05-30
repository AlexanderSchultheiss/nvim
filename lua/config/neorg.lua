require("neorg").setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.summary"] = {},
    ["core.ui.calendar"] = {},
    ["core.integrations.image"] = {},
    ["core.latex.renderer"] = {},
    ["core.journal"] = { -- Manages Neorg workspaces
      config = {
        workspace = "journal",
        journal_folder = "logs",
      },
    },
    ["core.completion"] = { -- Manages Neorg workspaces
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          journal = "~/research/journal/",
        },
        default_workspace = "journal",
      },
    },
  },
})
