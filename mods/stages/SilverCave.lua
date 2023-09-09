local PokBar = 0.5; --the fucking bar
FearFull = false; --instant death
local offsetshitX = -350
local offsetshitY = 0

function onCreate()
    luaDebugMode = true

    precacheImage('PIXEL_assets')
    addCharacterToList("pixel-bf", "boyfriend")
    addCharacterToList("pixel-red", "dad")

--background
    makeLuaSprite('bg','red/fondo_pokemon_1',-450,-300)
    scaleObject('bg',1.2,1.2)

    makeAnimatedLuaSprite('charizard','red/charizard',540,-290)
    scaleObject('charizard',0.65,0.65)
    addAnimationByPrefix('charizard','idle','chari idle',24,true)
    addAnimationByPrefix('charizard', 'atack', 'charizard atack', 24, false)
    addOffset("charizard", "idle", 180, 130)
    addOffset("charizard", "atack", 475, 150)
    playAnim('charizard','idle',true)

    makeAnimatedLuaSprite('pika','red/pikachu',1100,60)
    scaleObject('pika',0.7,0.7)
    addAnimationByPrefix('pika','idle','PIKACHU IDLE',24,true)
    addAnimationByPrefix('pika', 'atack', 'pikaatack', 24, false)
    addOffset("pika", "idle", 60, 60)
    addOffset("pika", "atack", 80, 45)
    playAnim('pika','idle',true)

    makeLuaSprite('bg2','red/fondo_pokemon_2',-450,-300)
    scaleObject('bg2',1.2,1.2)

    makeAnimatedLuaSprite('charizard2','red/pixelcharizard',720,-30)
    scaleObject('charizard2',0.65,0.65)
    addAnimationByPrefix('charizard2','idle','chariidle',24,true)
    playAnim('charizard2','idle',true)
    setProperty("charizard2.antialiasing", false)

    makeAnimatedLuaSprite('pika2','red/pixelpikachu',1140,200)
    addAnimationByPrefix('pika2','idle','pikachu idle',24,true)
    playAnim('pika2','idle',true)
    scaleObject('pika2',0.7,0.7)
    setProperty("pika2.antialiasing", false)

--hud
    makeLuaSprite('healthBG', 'red/health', 600+offsetshitX, 500+offsetshitY);
    scaleObject('healthBG', 0.44, 0.44);
    setObjectCamera('healthBG','hud');
    setProperty("healthBG.antialiasing", false)

    makeLuaSprite('health', 'red/healthBar', 630+offsetshitX, 550+offsetshitY);
    scaleObject('health', 0.44, 0.44);
    setObjectCamera('health','hud');
    setProperty("health.antialiasing", false)

    makeLuaSprite('bared', '', 990+offsetshitX, 582+offsetshitY)
    makeGraphic('bared', 509, 5, 'FF0000') --260
    setObjectCamera('bared', 'hud')
    setProperty('bared.angle', 180)

    makeLuaSprite('bar', '', 990+offsetshitX, 582+offsetshitY)
    makeGraphic('bar', 509, 5, 'adff2f') --260
    setObjectCamera('bar', 'hud')
    setProperty('bar.angle', 180)

    setProperty('bared.scale.x', PokBar)
    setProperty('bared.origin.x', getProperty('bar.height'));
    setProperty('bar.scale.x', PokBar)
    setProperty('bar.origin.x', getProperty('bar.height'));


    addLuaSprite('bg',false)
    addLuaSprite('charizard',false)
    addLuaSprite('pika',true)

    addLuaSprite('bg2',false)
    addLuaSprite('charizard2',false)
    addLuaSprite('pika2',true)
    setProperty("bg2.alpha", 0)
    setProperty("charizard2.alpha", 0)
    setProperty("pika2.alpha", 0)

    addLuaSprite('healthBG',true)
    addLuaSprite('health',true)
    addLuaSprite('bared', true)
    addLuaSprite('bar', true)
end

function onCreatePost()
    setTextSize('Watermark', 20);
    setTextSize('scoreTxt', 16);
    setProperty("scoreTxt.antialiasing", false)
    setTextSize('healthCounter', 20);
    setTextSize('timeTxt', 20);
    setTextSize('botplayTxt', 20);
    setTextSize('judgementCounter', 20);

    setProperty('iconP1.visible', false);
    setProperty('iconP2.visible', false);
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);
end

local isPixel = false;
function onEvent(name, value1, value2)

    if name == "Pixel" then
        if value1 == "true" then
            isPixel = true;
            triggerEvent("Change Character", "bf", "pixel-bf")
            triggerEvent("Change Character", "dad", "pixel-red")

            setProperty("bg.alpha", 0)
            setProperty("charizard.alpha", 0)
            setProperty("pika.alpha", 0)
            setProperty("bg2.alpha", 1)
            setProperty("charizard2.alpha", 1)
            setProperty("pika2.alpha", 1)

            setProperty("defaultCamZoom", 0.9)

            for i=0,4,1 do 
                setPropertyFromGroup('opponentStrums', i, 'texture', 'PIXEL_assets')
                setPropertyFromGroup('playerStrums', i, 'texture', 'PIXEL_assets') 
            end
            for i = 0, getProperty('unspawnNotes.length')-0 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'texture', 'PIXEL_assets'); 
                end 
                if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXEL_assets'); 
                end
            end 
        else
            isPixel = false;
            triggerEvent("Change Character", "bf", "bf")
            triggerEvent("Change Character", "dad", "red")

            setProperty("bg.alpha", 1)
            setProperty("charizard.alpha", 1)
            setProperty("pika.alpha", 1)
            setProperty("bg2.alpha", 0)
            setProperty("charizard2.alpha", 0)
            setProperty("pika2.alpha", 0)

            setProperty("defaultCamZoom", 0.7)
            
            for i=0,4,1 do 
                setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets')
                setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets') 
            end
            for i = 0, getProperty('unspawnNotes.length')-0 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'texture', 'NOTE_assets'); 
                end
                if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets'); 
                end
            end
        end
    end
end

function noteMiss()
    setProperty('bar.scale.x', getProperty('bar.scale.x') - 0.05)
end

function onUpdate()
    if FearFull == true then--Instant Death
        setProperty('health', -500)
    end
    if getProperty('songMisses') > 10 and getProperty('songMisses') < 1 then --wow
        FearFull = false;
    end

    if getProperty('songMisses') > 10 then --wow
        FearFull = true;
    end
end

function onGameOver()
	  setProperty("camFollowPos.x", 0)
	  cameraSetTarget('boyfriend')
end