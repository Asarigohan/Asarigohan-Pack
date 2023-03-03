local idleTimer = 0.72

function onCreatePost()
    playAnim('pl4', 'danceLeft', true)
    animationPlayed('dl')
end

function onBeatHit()

    if getProperty('pl4.animation.curAnim.name') == 'danceLeft' or getProperty('pl4.animation.curAnim.name') == 'danceRight' then
        if curBeat % 2 == 0 then
            playAnim('pl4', 'danceLeft', true)
            animationPlayed('dl')
        elseif curBeat % 2 == 1 then
            playAnim('pl4', 'danceRight', true)
            animationPlayed('dr')
        end
    end

end

function animationPlayed(anim) --animation offsets

    if anim == 'dl' then
        setProperty('pl4.offset.x', 50)
        setProperty('pl4.offset.y', 50)
    end
    if anim == 'dr' then
        setProperty('pl4.offset.x', 39)
        setProperty('pl4.offset.y', 50)
    end
    if anim == 'le' then
        setProperty('pl4.offset.x', 169)
        setProperty('pl4.offset.y', 50)
    end
    if anim == 'do' then
        setProperty('pl4.offset.x', 85)
        setProperty('pl4.offset.y', 22)
    end
    if anim == 'up' then
        setProperty('pl4.offset.x', 128)
        setProperty('pl4.offset.y', 59)
    end
    if anim == 'ri' then
        setProperty('pl4.offset.x', 90)
        setProperty('pl4.offset.y', 50)
    end
    if anim == 'bwah' then
        setProperty('pl4.offset.x', 156)
        setProperty('pl4.offset.y', 59)
    end

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

    if noteType == 'P4_Note_Player' then
        runTimer('backtoIdle', idleTimer)
        if noteData == 0 then
            playAnim('pl4', 'singLEFT', true)
            animationPlayed('le')

        elseif noteData == 1 then
            playAnim('pl4', 'singDOWN', true)
            animationPlayed('do')

        elseif noteData == 2 then
            playAnim('pl4', 'singUP', true)
            animationPlayed('up')

        elseif noteData == 3 then
            playAnim('pl4', 'singRIGHT', true)
            animationPlayed('ri')

        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'backtoIdle' then
        playAnim('pl4', 'danceLeft', true, false, 6)
        timerRunning = false
        animationPlayed('dl')
    end
end

function onEvent(n, v1, v2)
    if n == 'bwah' then
      cancelTimer('backtoIdle')
      playAnim('pl4', 'bwah', true)
      animationPlayed('bwah')
    end
end