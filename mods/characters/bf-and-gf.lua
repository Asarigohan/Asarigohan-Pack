function onCreatePost()
    addCharacterToList('GAYOVER-dead', 'boyfriend')
    setPropertyFromClass('GameOverSubstate', 'characterName', 'GAYOVER-dead')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'hammerhead_gameOver')

    setCharacterX("gf", getCharacterX("boyfriend"))
    setCharacterY("gf", getCharacterY("boyfriend")-10)

    setCharacterX("boyfriend", getCharacterX("boyfriend")+420)
    setCharacterY("boyfriend", getCharacterY("boyfriend")+10)

    setProperty("gf.flipX", false)
end