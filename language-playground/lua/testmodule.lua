
-- Just a simple test module
local M = {}

--- The main test function
--
-- This the main test function.
M.test_function = function()
  print("hello from test function")
end

--- Other test function
--
-- This is a test function, the other one.
M.other_test_function = function()
  print("hello from other test function")
end


--- Additional test function
---
--- This is a test function, yet another one.

M.some_additional_test_function = function()
  print("hello from my attitional test function")
end


--- Adds two numbers together.
-- @param a The first number.
-- @param b The second number.
-- @return The sum of a and b.
function M.add(a, b)
    return a + b
end

return M
