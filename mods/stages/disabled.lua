function onCreate()

  makeLuaSprite('background', 'disabled/background', -280, -340);
  scaleObject('background', 1.5, 1.25);
  setScrollFactor('background', 0.125, 0.5);
  addLuaSprite('background', false);

  setProperty('background.antialiasing', false);

  makeLuaSprite('background2', 'disabled/background2', -280, -340);
  scaleObject('background2', 1.5, 1.25);
  setScrollFactor('background2', 0.125, 0.5);
  addLuaSprite('background2', false);

  setProperty('background2.visible', false);
  setProperty('background2.antialiasing', false);

  makeLuaSprite('questionare', 'disabled/background2', -120, -340);
  scaleObject('questionare', 1.5, 1.25);
  setScrollFactor('questionare', 0, 0);
  addLuaSprite('questionare', false);

  setProperty('questionare.visible', false);

  makeLuaSprite('plateL', 'disabled/Purple_place', -920, -155);
  --scaleObject('plateL', 0.9, 0.9);
  addLuaSprite('plateL', false);

  makeLuaSprite('plateR', 'disabled/Purple_place', -150, -345);
  scaleObject('plateR', 0.62, 0.62);
  addLuaSprite('plateR', false);

--[[
  initLuaShader('pincushion')
  setSpriteShader('background', 'pincushion')
  setShaderFloat('background', 'distort', 1.5)
  setShaderFloat('background', 'prob', 1.5)
]]--
  makeLuaSprite('blackbg', '', -0, -0);
  makeGraphic('blackbg', 1280, 720, '000000')
  setScrollFactor('blackbg', 0, 0);
  addLuaSprite('blackbg', false);


  makeLuaSprite('warnWhite', '', -0, -0);
  makeGraphic('warnWhite', 1280, 720, 'FFFFFF')
  setScrollFactor('warnWhite', 0, 0);
  addLuaSprite('warnWhite', false);
  setProperty('warnWhite.alpha', 0)

end

function onCreatePost()
  triggerEvent('Camera Follow Pos', -115, -250)
  setProperty('boyfriend.color', getColorFromHex('000000'))
  setProperty('dadGroup.color', getColorFromHex('000000'))
  setProperty('camHUD.alpha', 0)

  setProperty('boyfriend.x', -1000)
  setProperty('dadGroup.x', 700)
  setProperty('iconP2.y', getProperty('iconP2.y') -20)

end

function onMoveCamera(focus)
  if focus == 'boyfriend' then
    setProperty('defaultCamZoom', 1.1 +0.05)
  elseif focus == 'dad' then
    setProperty('defaultCamZoom', 1.1 -0.15)
  end
end

local time = 60/180
function onSongStart()
  doTweenAlpha('warn', 'warnWhite', 0.5, time, 'sineOut')


end

function onTweenCompleted(tag)
  if not introEnd == true then
    if tag == 'warn' then
      doTweenAlpha('ing', 'warnWhite', 0, time, 'sineIn')
    elseif tag == 'ing' then
      doTweenAlpha('warn', 'warnWhite', 0.5, time, 'sineOut')
    end
  end
end

local hello = 0.7
function onEvent(n,v1,v2)

  if n == 'WiggleStart' then
    introEnd = true
    doTweenAlpha('huddd', 'camHUD', 1, 0.75, 'sineOut')
    setProperty('blackbg.visible', false)
    setProperty('warnWhite.visible', false)
    setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
    setProperty('dadGroup.color', getColorFromHex('FFFFFF'))
    cameraFlash('other', 'FFFFFF', 0.5, false)
    for i = 0,3 do
      setPropertyFromGroup('playerStrums', i, 'alpha', 0.8)
      setPropertyFromGroup('opponentStrums', i, 'alpha', 0.8)
    end
  end

  if n == 'Encounter' then

    if v1 == '1' then
      doTweenX('ponytaEnter', 'boyfriend', 0, hello, 'cubeOut')

    elseif v1 == '2' then
      doTweenX('wiggleEnter', 'dadGroup', -518, hello, 'cubeOut')

    end
  end

  if n == 'Change Character' then
  end

  if n == 'Toggle camZooming' then
    setProperty('camZooming', true)
  end

end

function onUpdate()

  if not mustHitSection then

    if dadName == 'wigglytuff0' then
      setProperty('defaultCamZoom', 1.1 -0.15)

    elseif dadName == 'wigglytuff1' then
      setProperty('defaultCamZoom', 1.1 -0.07)

    elseif dadName == 'wigglytuff2' then
      setProperty('defaultCamZoom', 1.1 -0.05)

    elseif dadName == 'wigglytuff3' then
      setProperty('defaultCamZoom', 1.1 +0.02)

    end
  end
end