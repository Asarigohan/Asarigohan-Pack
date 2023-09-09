local fixer = "substates.";
local isPixel = false;
function onCreate()
    if stringStartsWith(version, '0.6') or stringStartsWith(version, '0.5') then
        fixer = "";
    end
    addCharacterToList("bf-pixel", "boyfriend")
    addCharacterToList("red-pixel", "dad")
    addCharacterToList("pixel-bf-dead", "boyfriend")
    setPropertyFromClass(fixer..'GameOverSubstate', 'endSoundName', 'gameOverEndRed');

end

--[[
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene then
	    startVideo("CUTSCENE");
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
]]

function onCreatePost()

    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 600)
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 600)
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 600)
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX2 + 600)
    setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX3 + 600)
end

function onStepHit()
    if curStep==512 then
        triggerEvent("Pixel", "true", "")
    end

    if curStep==576 then
        triggerEvent("Pixel", "false", "")
    end

    if curStep==640 then
        triggerEvent("Pixel", "true", "")
    end

    if curStep==704 then
        triggerEvent("Pixel", "false", "")
    end

    if curStep==1056 then
        triggerEvent("Pixel", "true", "")
    end

    if curStep==1263 then
        triggerEvent("Pixel", "false", "")
    end
end

function onEvent(name, value1, value2)
    if name == "Pixel" then
        if value1 == "true" then
            setPropertyFromClass(fixer..'GameOverSubstate', 'characterName', 'pixel-bf-dead');
            setPropertyFromClass(fixer..'GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel')
        else
            setPropertyFromClass(fixer..'GameOverSubstate', 'characterName', 'bf-dead');
            setPropertyFromClass(fixer..'GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
        end
    end
end