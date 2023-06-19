local Patcher = {
    ["Map"] = function(name, solo, mode)
        return {
            ["Map"] = type(name) == table and name or {name},
            ["Solo"] = solo or true,
            ["Mode"] = mode or "Survival",
        }
    end,
    ["Loadout"] = function(...)
        local OldList = {...}
        for i,v in next, OldList do
            if v:lower() == "nil" then
                OldList[i] = nil
            end
        end
        local TowerList = {}
        TowerList["TotalTowers"] = OldList
        if type(getgenv().GoldenPerks) ~= "table" then
            getgenv().GoldenPerks = {}
        end
        for i,v in next, OldList do
            if type(v) == "string" then
                TowerList[v] = {table.find(getgenv().GoldenPerks,v) and true or false}
            end
        end
        return TowerList
    end,
    ["Place"] = function(troop, x, y, z, wave, min, sec,rotate, rotatex, rotatey, rotatez, inbetween)
        return {
            ["Type"] = troop,
            ["TypeIndex"] = "",
            ["Position"] = Vector3.new(x,y,z),
            ["Rotation"] = CFrame.new(rotatex or 0, rotatey or 0, rotatez or 0),
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["Upgrade"] = function(troop, wave, min, sec, inbetween)
        return {
            ["TowerIndex"] = troop,
            ["TypeIndex"] = "",
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["Sell"] = function(troop, wave, min, sec, inbetween)
        local troop = type(troop) == "table" and troop or {troop}
        --[[for i,v in next , troop then
            troop[i] = {v}
        end]]
        return {
            ["TowerIndex"] = troop,
            ["TypeIndex"] = "",
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["Skip"] = function(wave, min, sec, inbetween)
        return {
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["Ability"] = function(troop, nameability, wave, min, sec, inbetween)
        return {
            ["TowerIndex"] = troop,
            ["TypeIndex"] = "",
            ["Ability"] = nameability,
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["Target"] = function(troop, wave, target, min, sec, inbetween)
        return {
            ["TowerIndex"] = troop,
            ["TypeIndex"] = "",
            ["Wave"] = wave,
            ["Target"] = target,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["AutoChain"] = function(troop1, troop2, troop3, wave, min, sec, inbetween)
        return {
            ["TowerIndex1"] = troop1,
            ["TowerIndex2"] = troop2,
            ["TowerIndex3"] = troop3,
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    ["SellAllFarms"] = function(wave, min, sec, inbetween)
        return {
            ["Wave"] = wave,
            ["Minute"] = min,
            ["Second"] = sec,
            ["InBetween"] = inbetween or false,
        }
    end,
    --[[[""] = function()
        return
    end,]]
}
return Patcher
