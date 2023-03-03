function onUpdate()
  if curBeat <= 4 then
    for i = 0,3 do
      setPropertyFromGroup('playerStrums', i, 'alpha', 0.8)
      setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
   end
  end
end