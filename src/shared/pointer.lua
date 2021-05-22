--!nocheck
--[[
	Author: @ProjektKris
	lua pointer, takes advantage of table behaviour that doesn't clone, instead points
]]

-- types
export type Pointer = {
	Value: any,
	New: (any) -> (Pointer, string),
	GetAddress: () -> string,
	Delete: () -> ()
}

local pointers = {}
local pointer = {}
pointer.__index = pointer

function pointer.GetPointerFromAddress(address: string): (Pointer, string)
	local p: Pointer
	local s: boolean, err: string = pcall(function()
		if pointers[address] then
			p = pointers[address]
		else
			error("pointer not found")
		end
	end)
	if not s then
		-- error
		return nil, err
	else
		-- success
		return p, nil
	end
end

function pointer.New(value: any): (Pointer, string)
	local newPointer: Pointer
	local s: boolean, err: string = pcall(function()
		newPointer = {
			Value = value
		}
		setmetatable(newPointer, pointer)
		pointers[newPointer:GetAddress()] = newPointer
	end)
	if not s then
		-- error
		return nil, err
	else
		return newPointer, nil
	end
end

function pointer:GetAddress(): string
	return tostring(self)
end

function pointer:Delete()
	self.Value = nil
	self = nil
end

return pointer