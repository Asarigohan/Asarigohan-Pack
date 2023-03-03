
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx =  100;
local yy =  200;
local xx2 = 380;
local yy2 = 200;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
    luaDebugMode = true

  makeLuaSprite('bg', 'mira/bg sky', -1500, -800)
  addLuaSprite('bg', false)

  makeLuaSprite('bg2', 'mira/cloud fathest', -1300, -100)
  addLuaSprite('bg2', false)

  makeLuaSprite('bg3', 'mira/cloud front', -1300, 0)
  addLuaSprite('bg3', false)

  makeLuaSprite('cloud1', 'mira/cloud 1', -0, -1000)
  addLuaSprite('cloud1', false)

  makeLuaSprite('cloud2', 'mira/cloud 2', -0, -1200)
  addLuaSprite('cloud2', false)

  makeLuaSprite('cloud3', 'mira/cloud 3', -0, -1400)
  addLuaSprite('cloud3', false)

  makeLuaSprite('cloud4', 'mira/cloud 4', -0, -1600)
  addLuaSprite('cloud4', false)

  makeLuaSprite('cloudbig', 'mira/bigcloud', -0, -1200)
  addLuaSprite('cloudbig', false)

  makeLuaSprite('bg4', 'mira/glasses', -1200, -750)
  addLuaSprite('bg4', false)

  makeAnimatedLuaSprite('greymira', 'mira/crew', -260, -75)
  addAnimationByPrefix('greymira', 'bop', 'grey', 24, false)
  addLuaSprite('greymira', false)

  makeLuaSprite('what', 'mira/what is this', 0, -650)
  addLuaSprite('what', false)

  makeAnimatedLuaSprite('cyanmira', 'mira/crew', 740, -50)
  addAnimationByPrefix('cyanmira', 'bop', 'tomatomongus', 24, false)
  addLuaSprite('cyanmira', false)

  makeAnimatedLuaSprite('oramira', 'mira/crew', 1000, 125)
  addAnimationByPrefix('oramira', 'bop', 'RHM', 24, false)
  addLuaSprite('oramira', false)
  setScrollFactor('oramira', 1.2, 1)

  makeLuaSprite('lmao', 'mira/lmao', -800, -10)
  addLuaSprite('lmao', false)
  scaleObject('lmao', 0.9, 0.9)
  setProperty('lmao.offset.x', 0)
  setProperty('lmao.offset.y', 0)

  makeAnimatedLuaSprite('bluemira', 'mira/crew', -1300, 0)
  addAnimationByPrefix('bluemira', 'bop', 'blue', 24, false)
  addLuaSprite('bluemira', true)
  setScrollFactor('bluemira', 1.2, 1)

  makeLuaSprite('pot', 'mira/front pot', -1550, 650)
  addLuaSprite('pot', true)
  setScrollFactor('pot', 1.2, 1)

  makeAnimatedLuaSprite('vines', 'mira/vines', -1200, -1200)
  addAnimationByPrefix('vines', 'bop', 'green', 24, true)
  addLuaSprite('vines', true)
  setScrollFactor('vines', 1.4, 1)


  makeLuaSprite('pinkVignette', 'mira/vignette', 0, 0)
  setObjectCamera('pinkVignette', 'hud')
  addLuaSprite('pinkVignette', true)
  setBlendMode('pinkVignette', 'add')

  makeLuaSprite('pinkVignette2', 'mira/vignette2', 0, 0)
  setObjectCamera('pinkVignette2', 'hud')
  addLuaSprite('pinkVignette2', true)

  makeAnimatedLuaSprite('heartsImage', 'mira/hearts', -25, 0)
  addAnimationByPrefix('heartsImage', 'boil', 'Symbol 2', 24, true)
  setObjectCamera('heartsImage', 'other')
  addLuaSprite('heartsImage', true)

  setProperty('pinkVignette.alpha', 0)
  setProperty('pinkVignette2.alpha', 0)
  setProperty('heartsImage.alpha', 0)


  makeAnimatedLuaSprite('heartsWhite', 'mira/heartsWhite', -25, 0)
  addAnimationByPrefix('heartsWhite', 'boil', 'Symbol 2', 24, true)
  setObjectCamera('heartsWhite', 'other')
  addLuaSprite('heartsWhite', true)
  setBlendMode('heartsWhite', 'add')
  setProperty('heartsWhite.alpha', 0)

end

function onBeatHit()
    if curBeat % 1 == 0 then
        playAnim('bluemira','bop', true)
    end
    if curBeat % 2 == 0 then
        playAnim('greymira','bop', false)
        playAnim('oramira','bop', false)
        playAnim('cyanmira','bop', false)
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
  setProperty('camZooming', true)
end

function onSongStart()
    playAnim('greymira','bop', false)
    playAnim('oramira','bop', false)
    playAnim('cyanmira','bop', false)
    playAnim('bluemira','bop', true)
end


function onUpdate(elapsed)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
    doTweenX('c1', 'cloud1', getProperty('cloud1.x') -1, 9/60, 'linear')
    doTweenX('c2', 'cloud2', getProperty('cloud2.x') -3, 9/60, 'linear')
    doTweenX('c3', 'cloud3', getProperty('cloud3.x') -2, 9/60, 'linear')
    doTweenX('c4', 'cloud4', getProperty('cloud4.x') -0.1, 9/60, 'linear')
    doTweenX('cb', 'cloudbig', getProperty('cloudbig.x') -0.1, 9/60, 'linear')
    
end

function onEndSong()
    followchars = false;
    triggerEvent('Camera Follow Pos','400','150')
end
