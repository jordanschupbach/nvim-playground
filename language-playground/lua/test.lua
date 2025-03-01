
local mymod = require("testmodule")

print("")
mymod.test_function()
-- mymod.other_test_function()
-- mymod.some_additional_test_function()

function Dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k, v in pairs(o) do
			if type(k) ~= 'number' then k = '"' .. k .. '"' end
			s = s .. '[' .. k .. '] = ' .. Dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end


local size = 10
local vec = {}
for i = 1, size do
		vec[i] = math.random()
end


X=0;X=X+1; print(X);

type(Dump)

print("")
print("Hello, World")
print("10 random numbers:")
print(dump(vec))
print("")
print("")



