local mymod = require("testmodule")

-- package.loaded["testmodule"] = nil -- for reloading the module during dev
-- mymod = require("testmodule")

mymod.test_function()

mymod.other_test_function()

mymod.some_additional_test_function()

mymod.asdf()

print("Hello from test.lua")

print(mymod.add(1, 2))

