function onCreate()

  makeAnimatedLuaSprite('reddd', 'characters/red-speak', 600,100)
  addAnimationByIndices('reddd', 'idle', 'GlitchySpeak', 0, 24)
  addAnimationByPrefix('reddd', 'speak', 'GlitchySpeak', 24, false)
  scaleObject('reddd', 0.85, 0.85)
  setScrollFactor('reddd', 0, 0)

  makeLuaSprite('blackout', '', -1000,-1000)
  makeGraphic('blackout', 4000, 4000, '000000')
  setScrollFactor('blackout', 0, 0)

  addLuaSprite('reddd', true)
  addLuaSprite('blackout', true)


  setProperty('reddd.alpha', 0);
  setProperty('blackout.visible', false);


end

local focusRed = false

function onEvent(n,v1,v2)

  if n == 'RedSpeakin' then

    if v1 == '1' then
      setProperty('defaultCamZoom', 2)
      setProperty('dadGroup.visible',false)
      setProperty('gfGroup.visible',false)
      setProperty('blackout.visible',true)
      setProperty('tiles.alpha', 0.5);

      doTweenZoom('mmmmm', 'camGame', 1.5, 2, 'cubeOut')

--HUDdied
      setProperty('timeBar.visible',false)
      setProperty('timeBarBG.visible',false)
      setProperty('timeTxt.visible',false)
      setProperty('healthBar.visible',false)
      setProperty('healthBarBG.visible',false)
      setProperty('iconP1.visible',false)
      setProperty('iconP2.visible',false)
      setProperty('scoreTxt.visible',false)

      objectPlayAnimation('reddd', 'speak', false)

    elseif v1 == '2' then

      doTweenAlpha('blackfade', 'blackout', 0.4, 2, 'linear')
      doTweenX('theytook', 'reddd', getProperty('reddd.x') - 100, 9, 'sineInOut')
      doTweenAlpha('mypussy', 'reddd', 1, 9, 'sineInOut')

      noteTweenAlpha('notesGone1', 4, 0, 4, 'sineInOut')
      noteTweenAlpha('notesGone2', 5, 0, 4, 'sineInOut')
      noteTweenAlpha('notesGone3', 6, 0, 4, 'sineInOut')
      noteTweenAlpha('notesGone4', 7, 0, 4, 'sineInOut')

    elseif v1 == '3' then
      setProperty('defaultCamZoom', 0.7)
      setProperty('tiles.alpha', 1);
      setProperty('blackout.alpha',1)
      setProperty('dadGroup.visible',true)
      setProperty('gfGroup.visible',true)
      removeLuaSprite('reddd')

    elseif v1 == '4' then
      removeLuaSprite('blackout')
      setProperty('timeBar.visible',true)
      setProperty('timeBarBG.visible',true)
      setProperty('timeTxt.visible',true)
      setProperty('healthBar.visible',true)
      setProperty('healthBarBG.visible',true)
      setProperty('iconP1.visible',true)
      setProperty('iconP2.visible',true)
      setProperty('scoreTxt.visible',true)
      setProperty('opponentStrums.visible',true)
      for i = 0,3 do
        setPropertyFromGroup('playerStrums', i, 'alpha', 0.75)
      end

      focusRed = false

    end
  end
--TheInnu
end
--o

function onTweenCompleted(name)
  if name == 'mmmmm' then
    setProperty('defaultCamZoom', 1.5)
    setProperty('camGame.zoom', 1.5)
  end
end

function onUpdate()
  if focusRed == true then

  else
--nothing do
  end
end