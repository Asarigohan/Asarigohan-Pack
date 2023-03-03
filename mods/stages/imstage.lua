function onCreate()

  makeLuaSprite('bg','imbg', -250, -40)
  setScrollFactor('bg', 0.5, 0.8)

  makeAnimatedLuaSprite('yooo','imsaster', -500, 80)
  setScrollFactor('yooo', 0.7, 0.7)
  addAnimationByPrefix('yooo', 'higuys', 'imsaster', 24, false)

  makeAnimatedLuaSprite('oooy','retsasmi', -500, 80)
  setScrollFactor('oooy', 0.7, 0.7)
  addAnimationByPrefix('oooy', 'syugih', 'sasutaamove', 24, false)

  makeLuaSprite('ground','imground', -220, -30)
  setScrollFactor('ground', 0.7, 0.9)

  makeLuaSprite('rock','imrock', -170, -30)
  setScrollFactor('rock', 1.2, 0.9)

  addLuaSprite('bg', false)
  addLuaSprite('ground', false)
  addLuaSprite('yooo', false)
  addLuaSprite('oooy', false)
  addLuaSprite('rock', false)

  makeAnimatedLuaSprite('cutscene','imcutscene', 0, 0)
  addLuaSprite('cutscene', true)
  setObjectCamera('cutscene', 'hud')
  addAnimationByPrefix('cutscene', '1', 'one', 24, true)
  addAnimationByPrefix('cutscene', '2', 'two', 24, true)
  addAnimationByPrefix('cutscene', '3', 'three', 24, true)
  addAnimationByPrefix('cutscene', '4', 'four', 24, false)

  setProperty('cutscene.alpha', 0)

--[[
  makeLuaSprite('ref','ref', -200, -0)
  setScrollFactor('ref', 1, 1)
  addLuaSprite('ref', false)
  setProperty('ref.alpha', 0.5)
]]--

end

function onBeatHit()

  if curBeat % 2 == 1 then
    playAnim('yooo', 'higuys', true)
    playAnim('oooy', 'syugih', true)
  end

--cutscene
  if curBeat == 476 then
    setProperty('cutscene.alpha', 1)
  end
  if curBeat == 477 then
    playAnim('cutscene', '2', true)
  end
  if curBeat == 478 then
    playAnim('cutscene', '3', true)
  end
  if curBeat == 479 then
    playAnim('cutscene', '4', true)
  end
  if curBeat == 480 then
    setProperty('cutscene.alpha', 0)
  end

end

function onEvent(n,v1,v2)

  if n == 'saster' then

    if v1 == '0' then
      setProperty('yooo.x', -500)
      setProperty('yooo.y', 80)
      cancelTween('hiR')
      doTweenX('hiL', 'yooo', 1750, v2, 'linear')

    elseif v1 == '1' then
      setProperty('oooy.x', 1750)
      setProperty('oooy.y', 80)
      cancelTween('hiL')
      doTweenX('hiR', 'oooy', -500, v2, 'linear')

    end
  end
end
      
  