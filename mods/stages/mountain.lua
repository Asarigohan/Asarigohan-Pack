function onCreate()

    makeLuaSprite('bg','mountain/bg',-500,-300)
    setScrollFactor('bg', 0.6, 0.6)
    scaleObject('bg', 0.8, 0.8)

    makeLuaSprite('po1','mountain/Blastoise',-595,-270)
    setScrollFactor('po1', 0.75, 0.75)
    scaleObject('po1', 0.4, 0.4)

    makeLuaSprite('po2','mountain/Charizard',-220,-390)
    setScrollFactor('po2', 0.7, 0.7)
    scaleObject('po2', 0.5, 0.5)

    makeLuaSprite('po3','mountain/Pokemons',100,-190)
    setScrollFactor('po3', 0.8, 0.8)
    scaleObject('po3', 0.25, 0.25)

    makeLuaSprite('fog','mountain/fog',-0,-0)
    setObjectCamera('fog','hud')

    addLuaSprite('bg',false)
    addLuaSprite('po2',false)
    addLuaSprite('po1',false)
    addLuaSprite('po3',false)
    addLuaSprite('fog',true)

end



--Strums Swap

function onCreatePost()

    setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
    setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
    setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
    setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)

end