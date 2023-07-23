local home = os.getenv("HOME")
local jdtls = require("jdtls")

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- eclipse.jdt.ls stores project specific data within a folder. If you are working
-- with multiple different projects, each project must use a dedicated data directory.
-- This variable is used to configure eclipse to use the directory name of the
-- current project found using the root_marker as the folder for project specific data.
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Helper function for creating keymaps
function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Regular Neovim LSP client keymappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
  nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
  nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
  nnoremap("<leader>ck", vim.lsp.buf.signature_help, bufopts, "Show signature")
  --nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  --nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  --nnoremap("<space>wl", function()
  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts, "List workspace folders")
  nnoremap("<leader>cD", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap("<leader>cr", vim.lsp.buf.rename, bufopts, "Rename")
  nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set(
    "v",
    "<leader>ca",
    "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
  )
  nnoremap("<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts, "Format file")

  -- Java extensions provided by jdtls
  nnoremap("<leader>co", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("<leader>ce", jdtls.extract_variable, bufopts, "Extract variable")
  nnoremap("<leader>cc", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set(
    "v",
    "<leader>cm",
    [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
  )
end

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    "/home/alex/software/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    "-configuration",
    "/home/alex/software/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- See `data directory configuration` section in the README
    "-data",
    workspace_folder,
  },

  flags = {
    debounce_text_changes = 80,
  },
  root_dir = root_dir, -- Set the root directory to our found root_marker
  on_attach = on_attach,
  -- Here you can configure eclipse.jdt.ls specific settings
  -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      format = {
        settings = {
          -- Use Google Java style guidelines for formatting
          -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
          -- and place it in the ~/.local/share/eclipse directory
          url = "/home/alex/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
      -- Specify any completion options
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      -- If you are developing in projects with different Java versions, you need
      -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- And search for `interface RuntimeOption`
      -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
      --  configuration = {
      --    runtimes = {
      --      {
      --        name = "JavaSE-17",
      --        path = home .. "/.asdf/installs/java/corretto-17.0.4.9.1",
      --      },
      --      {
      --        name = "JavaSE-11",
      --        path = home .. "/.asdf/installs/java/corretto-11.0.16.9.1",
      --      },
      --      {
      --        name = "JavaSE-1.8",
      --        path = home .. "/.asdf/installs/java/corretto-8.352.08.1",
      --      },
      --    },
      --  },
    },
  },
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
