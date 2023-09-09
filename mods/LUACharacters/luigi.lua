local X = 0;
local Y = 0;
local idleTimer = 0.5;
local char = "luigi"
local char2 = "mrl"
local char3 = "mrl-tired"
function onCreate()
	X = getCharacterX("dad")
	Y = getCharacterY("dad")

	makeAnimatedLuaSprite(char, "characters/luigi/luigi", X+50, Y-50)
	addAnimationByIndices(char, "idle", "luigi", "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14", 24)
	addAnimationByIndices(char, "singLEFT", "luigi", "15, 16, 17, 18, 19", 24)
	addAnimationByIndices(char, "singDOWN", "luigi", "20, 21, 22, 23, 24", 24)
	addAnimationByIndices(char, "singUP", "luigi", "25, 26, 27, 28, 29", 24)
	addAnimationByIndices(char, "singRIGHT", "luigi", "30, 31, 32, 33, 34", 24)
	addAnimationByIndices(char, "alright", "luigi", "35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50", 24)
	addAnimationByIndices(char, "trans", "luigi", "51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103", 24)
	addLuaSprite(char, true)

    makeAnimatedLuaSprite(char2, "characters/luigi/mrl", X+50, Y-50)
	addAnimationByIndices(char2, "idle", "mrl", "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14", 24)
	addAnimationByIndices(char2, "singLEFT", "mrl", "15, 16, 17, 18, 19", 24)
	addAnimationByIndices(char2, "singDOWN", "mrl", "20, 21, 22, 23, 24", 24)
	addAnimationByIndices(char2, "singUP", "mrl", "25, 26, 27, 28, 29", 24)
	addAnimationByIndices(char2, "singRIGHT", "mrl", "30, 31, 32, 33, 34", 24)
	addAnimationByIndices(char2, "trans", "mrl", "35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89", 24)
	addLuaSprite(char2, true)
    setProperty("mrl.alpha", 0)

    makeAnimatedLuaSprite(char3, "characters/luigi/mrl_tired", X+50, Y-50)
	addAnimationByIndices(char3, "idle", "mrl tired", "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14", 24)
	addAnimationByIndices(char3, "singLEFT", "mrl tired", "15, 16, 17, 18, 19", 24)
	addAnimationByIndices(char3, "singDOWN", "mrl tired", "20, 21, 22, 23, 24", 24)
	addAnimationByIndices(char3, "singUP", "mrl tired", "25, 26, 27, 28, 29", 24)
	addAnimationByIndices(char3, "singRIGHT", "mrl tired", "30, 31, 32, 33, 34", 24)
	addAnimationByIndices(char3, "fall", "mrl tired", "35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87", 24)
	addLuaSprite(char3, true)
    setProperty("mrl-tired.alpha", 0)


end

function onCountdownTick(count)
	if count % 2 == 0 then
		playAnim(char, "idle", true)
        playAnim(char2, "idle", true)
        playAnim(char3, "idle", true)
	end
end

local holdFinished = true;
local specialAnim = false;

function onBeatHit()
    if holdFinished == true and specialAnim == false then
        if curBeat % 2 == 0 then
            playAnim(char, "idle", true)
            playAnim(char2, "idle", true)
            playAnim(char3, "idle", true)
        end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

    if noteType == "Luigi Sing" then

        holdFinished = false;
        runTimer("idleLuigi", idleTimer, 1)

        if noteData == 0 then
            playAnim(char, 'singLEFT', true)
            playAnim(char2, 'singLEFT', true)
            playAnim(char3, 'singLEFT', true)
        elseif noteData == 1 then
            playAnim(char, 'singDOWN', true)
            playAnim(char2, 'singDOWN', true)
            playAnim(char3, 'singDOWN', true)
        elseif noteData == 2 then
            playAnim(char, 'singUP', true)
            playAnim(char2, 'singUP', true)
            playAnim(char3, 'singUP', true)
        elseif noteData == 3 then
            playAnim(char, 'singRIGHT', true)
            playAnim(char2, 'singRIGHT', true)
            playAnim(char3, 'singRIGHT', true)
        end
    end
        
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "idleLuigi" then
        holdFinished = true;
        if specialAnim == false then
            playAnim(char, 'idle', true)
            playAnim(char2, 'idle', true)
            playAnim(char3, 'idle', true)
        else
            specialAnim = false;
            playAnim(char, 'idle', true)
        end
    elseif tag == "animDelay" then
        playAnim(char, "trans", true);
    end
end

function onEvent(n, v1, v2)
	if n == "Play Animation" and v2 == "luigi" then
        specialAnim = true;
        if v1 == "fall" then
            playAnim(char3, v1, true);
        else
            playAnim(char, v1, true);
        end
	end
    if n == "Change Luigi" then
        specialAnim = true;
        holdFinished = true;
        cancelTimer("idleLuigi")
        if v1 == "mrl" then
            runTimer("animDelay", 0.1, 1)
        elseif v1 == "mrl-tired" then
            playAnim(char2, "trans", true);
        end
        local changeTo = v1
    end
end

function onUpdate(elapsed)
    if specialAnim == true then
        if getProperty("luigi.animation.curAnim.name") == "alright" and getProperty("luigi.animation.curAnim.finished") then
            specialAnim = false;
            playAnim(char, 'idle', true)
        end
        if getProperty("luigi.animation.curAnim.name") == "trans" and getProperty("luigi.animation.curAnim.finished") then
            specialAnim = false;
            setProperty("luigi.alpha", 0)
            setProperty("mrl.alpha", 1)
            setProperty("mrl-tired.alpha", 0)
        end
        if getProperty("mrl.animation.curAnim.name") == "trans" and getProperty("mrl.animation.curAnim.finished") then
            specialAnim = false;
            setProperty("luigi.alpha", 0)
            setProperty("mrl.alpha", 0)
            setProperty("mrl-tired.alpha", 1)
        end
    end
end