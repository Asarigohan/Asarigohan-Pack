function onCreate()

    makeLuaSprite('bg','gay/googabgshit',-600,-250)
    setProperty('bg.antialiasing', false)
    setScrollFactor('bg', 0.8, 0.8)
    setScrollFactor('dadGroup', 0.92, 0.92)
    scaleObject('bg', 1.6, 1.6)

    addLuaSprite('bg',false)

    --i drew this shit
end

--Strums Swap

function onCreatePost()

    setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
    setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
    setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
    setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

    setPropertyFromGroup('opponentStrums', 0, 'x', 2000)
    setPropertyFromGroup('opponentStrums', 1, 'x', 2000)
    setPropertyFromGroup('opponentStrums', 2, 'x', 2000)
    setPropertyFromGroup('opponentStrums', 3, 'x', 2000)

end