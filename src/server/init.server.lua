--!nonstrict
--[[
    Author: @ProjektKris
    serverside tester
]]

type Array<T> = {[number]: T}
type Result = {
    t0: number,
    t1: number,
    module: ModuleScript
}

local results: Array<Result> = {}
for _, module: Instance in pairs(script:GetChildren()) do
    if module:IsA("ModuleScript") then
        local newResult: Result
        newResult.t0 = os.clock()

        require(module)()

        newResult.t1 = os.clock()
        newResult.module = module

        results[#results+1] = newResult
    end
end

-- summarize
for _, res: Result in pairs(results) do
    print(string.format("%s finished in %f", res.module.name, res.t1-res.t0))
end