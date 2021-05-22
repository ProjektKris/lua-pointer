return function ()
    local pointer = require(game.ReplicatedStorage.Common.pointer)

    local newPointerVar: pointer.Pointer, err: string = pointer.New(69)
    if err ~= nil then
        warn(err)
    end

    local point: pointer.Pointer, err2: string = pointer.GetPointerFromAddress(newPointerVar:GetAddress())
    if err2 ~= nil then
        warn(err)
    end

    local function summarize()
        print("p1:", newPointerVar.Value)
        print("p2:", newPointerVar.Value)
    end

    print(string.format("p1 address: %s | p2 address: %s", newPointerVar:GetAddress(), point:GetAddress()))
    summarize()
    newPointerVar.Value = 100
    summarize()
end