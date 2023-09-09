local X = 0;
local Y = 0;
local idleTimer = 0.5;
local char = "mario"
function onCreate()
	X = getCharacterX("dad")
	Y = getCharacterY("dad")

	makeAnimatedLuaSprite(char, "characters/mario", X-400, Y+70)
	addAnimationByIndices(char, "idle", "mario", "1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14", 24)
	addAnimationByIndices(char, "singLEFT", "mario", "15, 16, 17, 18, 19", 24)
	addAnimationByIndices(char, "singDOWN", "mario", "20, 21, 22, 23, 24", 24)
	addAnimationByIndices(char, "singUP", "mario", "25, 26, 27, 28, 29", 24)
	addAnimationByIndices(char, "singRIGHT", "mario", "30, 31, 32, 33, 34", 24)
	addAnimationByIndices(char, "letsago", "mario", "35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55", 24)
	addAnimationByIndices(char, "calmadown", "mario", "56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152", 24)
	addAnimationByIndices(char, "faceapalm", "mario", "153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203", 24)
	addLuaSprite("mario", true)

end

function onCountdownTick(count)
	if count % 2 == 0 then
		playAnim(char, "idle", true)
	end
end

local holdFinished = true;
local specialAnim = false;

function onBeatHit()
    if holdFinished == true and specialAnim == false then
        if curBeat % 2 == 0 then
            playAnim(char, "idle", true)
        end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

    if noteType == "" then

        holdFinished = false;
        runTimer("idleMario", idleTimer, 1)

        if noteData == 0 then
            playAnim(char, 'singLEFT', true)
        elseif noteData == 1 then
            playAnim(char, 'singDOWN', true)
        elseif noteData == 2 then
            playAnim(char, 'singUP', true)
        elseif noteData == 3 then
            playAnim(char, 'singRIGHT', true)
        end
    end
        
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'idleMario' then
        holdFinished = true;
        if specialAnim == true then
            specialAnim = false;
        end
        playAnim(char, 'idle', true)
    end
end

function onEvent(n, v1, v2)
	if n == "Play Animation" then
		if v2 == char then
            playAnim(v2, v1, true)
            specialAnim = true;
        end
	end
end

function onUpdate(elapsed)
    if specialAnim == true then
        if getProperty("mario.animation.curAnim.name") == "letsago" or getProperty("mario.animation.curAnim.name") == "calmadown" then
            if getProperty("mario.animation.curAnim.finished") then
                specialAnim = false;
                playAnim(char, 'idle', true)
            end
        end
    end
end