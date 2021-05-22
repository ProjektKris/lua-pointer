# lua-pointer

A simple pointer system in Lua that takes advantage of Lua table behaviour that doesn't clone.

Used [Rojo](https://github.com/rojo-rbx/rojo) 6.1.0.

## Getting Started

To build the place from scratch, use:

```bash
rojo build -o "lua-pointer.rbxlx"
```

Next, open `lua-pointer.rbxlx` in Roblox Studio and start the Rojo server:

```bash
rojo serve
```

For more help, check out [the Rojo documentation](https://rojo.space/docs).

## Docs

### Constructor

```lua
.New(value: any): (pointer Pointer, err string)
```

Creates a new pointer variable

### Module Methods
#### function GetPointerFromAddress

```lua
.GetPointerFromAddress(address: string): (pointer Pointer, err string)
```

Gets the variable from the address.

---

### Class Properties

#### Value

`any`

the value of the pointer

---

### Class Methods

#### function GetAddress

```lua
:GetAddress(): (address string)
```

returns the address of the pointer

---

#### function Delete

```lua
:Delete()
```

deletes the pointer

---

### Types

#### export type Pointer

```ts
export type Pointer = {
	Value: any,
	New: (any) -> (Pointer, string),
	GetAddress: () -> string,
	Delete: () -> ()
}
```

### Example

```lua
-- load the module
local pointer = require(game.ReplicatedStorage.Common.pointer)

-- create a new pointer
local newPointer = pointer.New(42)
local pointToPointer = pointer.GetPointerFromAddress(newPointer:GetAddress())

print(newPointer.Value)
print(pointToPointer.Value)

newPointer.Value = 69

print(newPointer.Value)
print(pointToPointer.Value)
```