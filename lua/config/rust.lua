-- Define a function to insert Rust test boilerplate code
function insertRustTestBoilerplate()
  vim.fn.append(vim.fn.line("$"), "#[cfg(test)]")
  vim.fn.append(vim.fn.line("$"), "mod tests {")
  vim.fn.append(vim.fn.line("$"), "    #[test]")
  vim.fn.append(vim.fn.line("$"), "    fn PLACEHOLDER() {")
  vim.fn.append(vim.fn.line("$"), "        todo!();")
  vim.fn.append(vim.fn.line("$"), "    }")
  vim.fn.append(vim.fn.line("$"), "}")
end

vim.keymap.set("n", "<leader>rt", ":lua insertRustTestBoilerplate()<CR>", { noremap = true, silent = true })
