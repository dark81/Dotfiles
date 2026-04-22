-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy absolute path to clipboard

-- Helper function using LazyVim's internal root detection with fallbacks
---@return string|nil
local function get_root()
  -- 1. Try LazyVim's official root detector
  ---@type string|nil
  local root = LazyVim.root.get()
  -- 2. Fallback: Search manually for .git if LazyVim failed
  if not root or root == "/" then
    root = vim.fs.root(0, ".git")
  end
  -- 3. Final Fallback: Use the Current Working Directory
  if not root or root == "/" then
    root = vim.uv.cwd()
  end
  return root
end

-- Helper to get relative path from the project root
---@return string|nil
local function get_relative_path()
  local root = get_root()
  local path = vim.fn.expand("%:p")
  -- Calculate path relative to root
  local relative_path = vim.fs.relpath(root, path) or vim.fn.fnamemodify(path, ":.")
  -- Make it robust: if path is outside root, just use absolute
  if relative_path:sub(1, 1) == "/" then
    relative_path = vim.fn.expand("%:p")
  end
  return relative_path
end

vim.keymap.set("n", "<leader>fP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy Absolute Path" })

-- Copy relative path to clipboard
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy Relative Path (from cwd)" })

-- Copy Path from Project Root
vim.keymap.set("n", "<leader>fy", function()
  local relative_path = get_relative_path()

  vim.fn.setreg("+", relative_path)
  vim.notify("Copied root-relative path: " .. relative_path)
end, { desc = "Copy Path from Project Root" })

-- Copy Path + Line Number (Project Relative)
vim.keymap.set("n", "<leader>fY", function()
  local relative_path = get_relative_path()
  local line = vim.fn.line(".")
  -- Combine path and line number
  local result = relative_path .. ":" .. line

  vim.fn.setreg("+", result)
  vim.notify("Copied location: " .. result)
end, { desc = "Copy Path with Line Number" })
