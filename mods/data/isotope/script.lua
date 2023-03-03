function onCreatePost()

  setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
  setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
  setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
  setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

  setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0)
  setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0)
  setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0)
  setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0)

  setProperty('camHUD.alpha',0)

end

function onEvent(name,v1,v2)

  if name == 'HUDbye' then

    if v1 == '1' then
        doTweenAlpha('bye','camHUD', 0, 0.05, 'linear')

    elseif v1 == '0' then

        doTweenAlpha('hi','camHUD', 1, 0.05, 'linear')
    end

  end

  if name == 'setStrums' then

    for i = 0,3 do
      setPropertyFromGroup('playerStrums', i, 'alpha', 1)
      setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
    end
  end
end