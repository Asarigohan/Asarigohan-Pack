local offsX = 210
local offsY = 430

function onCreate()
    luaDebugMode = true

    makeLuaSprite('otherroom', 'meeting/backer_groung_voting', 387.3, 194.1)
    setScrollFactor('otherroom', 0.8, 0.8)
    addLuaSprite('otherroom', false)

    makeLuaSprite('votingbg', 'meeting/main_bg_meeting', -315.15, 52.85)
    setScrollFactor('votingbg', 0.95, 0.95)
    addLuaSprite('votingbg', false)
    
    makeLuaSprite('chairs', 'meeting/CHAIRS!!!!!!!!!!!!!!!', -7.9, 644.85)
    addLuaSprite('chairs', false)

    makeLuaSprite('table', 'meeting/table_voting', 209.4, 679.55)
    addLuaSprite('table', true)

    makeLuaSprite('vt_light', 'meeting/light_voting', 0, 0)
    updateHitbox('vt_light')
    setObjectCamera('vt_light', 'hud')
    setBlendMode('vt_light', 'add')
    setProperty('vt_light.alpha', 0.46)
    addLuaSprite('vt_light', true)

    makeLuaSprite('bars', 'bars', 0, 0)
    setObjectCamera('bars', 'hud')
    addLuaSprite('bars', true)

    makeAnimatedLuaSprite('pl4', 'meeting/madgus', offsX+1194, offsY+192)
    addAnimationByPrefix('pl4', 'danceLeft', 'DANCELEFT', 12, false)
    addAnimationByPrefix('pl4', 'danceRight', 'DANCERIGHT', 12, false)
    addAnimationByPrefix('pl4', 'singLEFT', 'left', 12, false)
    addAnimationByPrefix('pl4', 'singDOWN', 'down', 12, false)
    addAnimationByPrefix('pl4', 'singUP', 'up', 12, false)
    addAnimationByPrefix('pl4', 'singRIGHT', 'right', 12, false)
    addAnimationByPrefix('pl4', 'bwah', 'scream', 12, false)
    addLuaSprite('pl4', false)

end
function onUpdate(elapsed)
  setProperty('camZooming', false)
  
end

function onSongStart()
    setProperty('cameraSpeed', 1)
end

function onEvent(n,v1,v2)

    if n == 'Cam lock in Voting Time' then
        if v1 == 'in' then
            setProperty('defaultCamZoom', 1.2)
            setProperty('camGame.zoom', 1.2)

            if v2 == 'dad' then
                setProperty('camFollowPos.x', 460)
                setProperty('camFollowPos.y', 700)
                triggerEvent('Camera Follow Pos', 460, 700)
            else

                setProperty('camFollowPos.x', 1470)
                setProperty('camFollowPos.y', 700)
                triggerEvent('Camera Follow Pos', 1470, 700)
            end

        elseif v1 == 'close' then
            setProperty('defaultCamZoom', 1.25)
            setProperty('camGame.zoom', 1.25)

            if v2 == 'dad' then
                setProperty('camFollowPos.x', 480)
                setProperty('camFollowPos.y', 680)
                triggerEvent('Camera Follow Pos', 480, 680)
            else
                setProperty('camFollowPos.x', 1450)
                setProperty('camFollowPos.y', 680)
                triggerEvent('Camera Follow Pos', 1450, 680)
            end

        else
            setProperty('defaultCamZoom', 0.7)
            setProperty('camGame.zoom', 0.7)
            setProperty('camFollowPos.x', 960)
            setProperty('camFollowPos.y', 540)
            triggerEvent('Camera Follow Pos', 960, 540)

            
        end
    end
end
