-- Simple test playground for testing the Lua API
-- anything in here is likely to be deleted or changed

-- local playground = require("testmodule")
local playground = require("lua.playground")

-- Reload the module:
-- playground = nil
-- print('hello world')
-- print(playground)

local l = playground.hello_world()

print(l)


