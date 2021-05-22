--[[
	Author: @ProjektKris
	lua pointer, takes advantage of table behaviour that doesn't clone, instead points
]]

-- types
export type Pointer = {
	Value: any,
	New: (any) -> (Pointer, string),
	Delete: () -> ()
}

local pointer = {}
pointer.__index = pointer

function pointer.New(value: any): (Pointer, string)
	local newPointer: Pointer
	local s: boolean, err: string = pcall(function()
		newPointer = {
			Value = value
		}
		setmetatable(newPointer, pointer)
	end)
	if not s then
		-- error
		return nil, err
	else
		return newPointer, nil
	end
end

function pointer:Delete()
	self.Value = nil
	self = nil
end

return pointer