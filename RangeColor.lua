local function UpdateRange()
    -- List all the action bar names in the default UI
    local barNames = {
        "ActionButton",   -- Main bar
        "MultiBarBottomLeftButton",   -- Bottom left bar
        "MultiBarBottomRightButton",  -- Bottom right bar
        "MultiBarRightButton",        -- Right bar
        "MultiBarLeftButton"          -- Left vertical bar
    }
    
    -- Check all buttons on each bar
    for _, barName in pairs(barNames) do
        for i = 1, 12 do
            local button = _G[barName .. i]
            if button then
                local icon = _G[barName .. i .. "Icon"]
                local isUsable, notEnoughMana = IsUsableAction(button.action)
                if isUsable then
                    if IsActionInRange(button.action) == false then
                        icon:SetVertexColor(1, 0, 0)  -- Red
                    else
                        icon:SetVertexColor(1, 1, 1)  -- Reset to normal (white)
                    end
                end
            end
        end
    end
end

-- Hook the function to the action button update events
hooksecurefunc("ActionButton_UpdateRangeIndicator", function(self, checksRange, inRange)
    UpdateRange()
end)
