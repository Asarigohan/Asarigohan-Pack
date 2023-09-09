local zoomStep = 4
local zooming = false
local addGame = 0.05
local addHud = 0.04

function onBeatHit()
    --debugPrint('               '.. curBeat ..'')
    if curBeat == 4 then
        changeValue(true, 0.02, 0.03, 4)
    end
    if curBeat == 36 then
        changeValue(true, 0.03, 0.04, 4)
    end
    if curBeat == 100 then
        changeValue(true, 0.02, 0.03, 4)
    end

    if curBeat == 132 then
        changeValue(true, 0.02, 0.02, 2)
    end
    if curBeat == 144 then
        changeValue(true, 0.03, 0.04, 8)
    end
    if curBeat == 148 then
        changeValue(true, 0.015, 0.02, 2)
    end
    if curBeat == 160 then
        changeValue(true, 0.03, 0.04, 8)
    end

    if curBeat == 164 then
        changeValue(true, 0.04, 0.03, 4)
    end

    if curBeat == 229 then
        changeValue(true, 0.03, 0.04, 8)
    end
    if curBeat == 260 then
        changeValue(true, 0.03, 0.04, 4)
    end
    if curBeat == 324 then
        zooming = false;
        triggerEvent('Add Camera Zoom', 0.2, 0.1)
    end
    if curBeat == 328 then
        setProperty("camZooming", false)
    end
    if curBeat == 332 then
        setProperty("camZooming", false)
    end
end

function changeValue(ing, game, hud, step)
    zooming = ing;
    addGame = game;
    addHud = hud;
    zoomStep = step;
end

function onStepHit()
    if zooming == true then
        if curStep % zoomStep == 0 then
            triggerEvent('Add Camera Zoom', addGame, addHud)
        end
    end
end