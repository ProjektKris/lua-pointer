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

local pointer = {
	Pointers = {} -- it had to be done, also this isnt replicated across clients so it's quite safe
}

function pointer.GetPointerFromAddress(address: string): (Pointer, string)
	local p: Pointer
	local s: boolean, err: string = pcall(function()
		if pointer.Pointers[address] then
			p = pointer.Pointers[address]
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
		function newPointer:GetAddress(): string
			return tostring(self)
		end
		
		function newPointer:Delete()
			self.Value = nil
			self = nil
		end
		pointer.Pointers[newPointer:GetAddress()] = newPointer
		print(shared)
	end)
	if not s then
		-- error
		return nil, err
	else
		return newPointer, nil
	end
end

return pointer