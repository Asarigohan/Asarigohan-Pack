function onCreate()

--Stage

    makeLuaSprite('bg','buried/bg',-390,-593)
    scaleObject('bg', 5, 5)
    setProperty('bg.antialiasing', false);

    makeLuaSprite('floor','buried/floor',-390,-593)
    scaleObject('floor', 5, 5)
    setProperty('floor.antialiasing', false);

    makeLuaSprite('graves','buried/graves',-390,-593)
    scaleObject('graves', 5, 5)
    setProperty('graves.antialiasing', false);

    makeAnimatedLuaSprite('ball', 'characters/missingnoball', -20,-110)
    setProperty('ball.alpha', 0);
    scaleObject('ball', 5, 5)
    setProperty('ball.antialiasing', false);

    addAnimationByPrefix('ball', 'idle', 'Ball_Idle_Normal', 24, true)
    addAnimationByPrefix('ball', 'break', 'Ball_Break01', 24, false)
    addAnimationByPrefix('ball', 'break2', 'Ball_Break02', 24, false)
    addAnimationByPrefix('ball', 'idle2', 'Ball_Idle_Break01', 24, true)
    addAnimationByPrefix('ball', 'idle3', 'Ball_Idle_Break02', 24, true)
    addAnimationByPrefix('ball', 'burst', 'Ball_FinalBurst', 24, false)

    makeAnimatedLuaSprite('missingno', 'characters/ba-missingno', -65,-330)
    setProperty('missingno.alpha', 0);
    scaleObject('missingno', 5, 5)
    setProperty('missingno.antialiasing', false);

    addAnimationByPrefix('missingno', 'idle', 'Idle', 24, false)
    addAnimationByPrefix('missingno', 'singLEFT', 'Left0', 24, false)
    addAnimationByPrefix('missingno', 'singLEFTmiss', 'LeftMiss', 24, false)
    addAnimationByPrefix('missingno', 'singDOWN', 'Down0', 24, false)
    addAnimationByPrefix('missingno', 'singDOWNmiss', 'DownMiss', 24, false)
    addAnimationByPrefix('missingno', 'singUP', 'Up0', 24, false)
    addAnimationByPrefix('missingno', 'singUPmiss', 'UpMiss', 24, false)
    addAnimationByPrefix('missingno', 'singRIGHT', 'Right0', 24, false)
    addAnimationByPrefix('missingno', 'singRIGHTmiss', 'RightMiss', 24, false)

    addLuaSprite('bg',false)
    addLuaSprite('floor',false)
    addLuaSprite('graves',false)

    addLuaSprite('ball',true)
    addLuaSprite('missingno',true)

--GF layer

    setObjectOrder('gfGroup', 6)

--HUD

    makeLuaSprite('GBblend','',0,-0)
    makeGraphic('GBblend', 1500, 1000, '88bf72')
    setObjectCamera('GBblend','hud')
    setBlendMode('GBblend', 'darken')
    setProperty('GBblend.alpha', 0);

end




function onCreatePost()

--ScoreText
    if downscroll == true then
        setProperty('scoreTxt.y', 10)
    else
        setProperty('scoreTxt.y', 685)
    end

    setProperty('scoreTxt.width', 10)
    setTextFont('scoreTxt','poke.ttf')
    setTextSize('scoreTxt', 24)

    setObjectOrder('GBBlend', 50)

end


--Events

function onEvent(name,v1,v2)

    if name == 'Missingno' then

        if v1 == '1' then
            setProperty('ball.alpha', 1);
            objectPlayAnimation('ball', 'idle', true)
        end
        if v1 == '2' then
            objectPlayAnimation('ball', 'break', false)
        end
        if v1 == '3' then
            objectPlayAnimation('ball', 'break2', false)
        end
        if v1 == '4' then
            objectPlayAnimation('ball', 'idle2', true)
        end
        if v1 == '5' then
            objectPlayAnimation('ball', 'burst', true)
        end
        if v1 == '6' then
            setProperty('missingno.alpha', 1);
        end
        if v1 == '7' then
            setProperty('ball.alpha', 0);
        end
        if v1 == '8' then
            doTweenY('gone', 'missingno', 1000, 1, 'circIn')
        end
        if v1 == '9' then
            objectPlayAnimation('ball', 'idle3', true)
        end
    end

    if name == 'gameboy' then
        if v1 == 'start' then
            setProperty('defaultCamZoom', 0.962)
            --doTweenZoom('gameboy', 'camGame', 0.962, 1.2, 'quadOut')
            --doTweenAlpha('GBTween', 'GBblend', 1, 2, 'quadOut')
            setProperty('GBblend.alpha', 1)
            cameraFlash('game','ffffff',0.4,false)
        end
        if v1 == 'end' then
            setProperty('defaultCamZoom', 0.72)
            --doTweenZoom('gameboy', 'camGame', 0.72, 2, 'expoOut')
            --doTweenAlpha('GBTween', 'GBblend', 0, 2, 'expoOut')
            setProperty('GBblend.alpha', 0)
            cameraFlash('game','0xacffffff',0.5,false)

        end
    end
end

--Missingno shit


local isIdle = true;

function onBeatHit()

    if curBeat % 4 == 0 then
        if isIdle == true then

        objectPlayAnimation('missingno', 'idle', false);
        end
    end
end


function goodNoteHit(id, direction, noteType, isSustainNote)

    if noteType == 'MNSings' then

        runTimer('idletimer', 0.35)
        isIdle = false

        if direction == 0 then
        objectPlayAnimation('missingno', 'singLEFT', true);
        end
        if direction == 1 then
        objectPlayAnimation('missingno', 'singDOWN', true);
        end
        if direction == 2 then
        objectPlayAnimation('missingno', 'singUP', true);
        end
        if direction == 3 then
        objectPlayAnimation('missingno', 'singRIGHT', true);
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'idletimer' then
        isIdle = true
        objectPlayAnimation('missingno', 'idle', false);
    end
end
