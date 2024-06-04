require("java").setup({
  --  list of file that exists in root of the project
  root_markers = {
    "settings.gradle",
    "settings.gradle.kts",
    "pom.xml",
    "build.gradle",
    "mvnw",
    "gradlew",
    "build.gradle",
    "build.gradle.kts",
    ".git",
  },

  -- load java test plugins
  java_test = {
    enable = true,
  },

  -- load java debugger plugins
  java_debug_adapter = {
    enable = true,
  },

  jdk = {
    -- install jdk using mason.nvim
    auto_install = false,
  },

  notifications = {
    -- enable 'Configuring DAP' & 'DAP configured' messages on start up
    dap = true,
  },
})

local config = {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk/",
            default = true,
          },
        },
      },
    },
  },
}

require("lspconfig").jdtls.setup(config)
