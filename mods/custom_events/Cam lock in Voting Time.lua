local p1color = '31B0D1' --bf
local p2color = '710FAF' --purple
local p3color = 'E9B4D7' --rose
local p4color = 'FF283C' --red
function swapIcon(icon)
    runHaxeCode([[game.iconP2.changeIcon(']] .. icon .. [[')]])
end

function onEvent(n,v1,v2)

    if n == 'Cam lock in Voting Time' then
        if v1 == 'in' then
            if v2 == 'dad' then
                swapIcon('warchief')
                setHealthBarColors(p2color, p1color)
            end
        elseif v1 == 'close' then
            if v2 == 'dad' then
                swapIcon('thejelqer')
                setHealthBarColors(p3color, p1color)
            else
                swapIcon('redmungus')
                setHealthBarColors(p4color, p1color)
            end
        end
    end
end
