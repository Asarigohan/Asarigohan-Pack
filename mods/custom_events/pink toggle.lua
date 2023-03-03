local cameraSwing = false
local pinkCanPulse = false
local fadetime = 0.1

function onEvent(n,v1,v2)
    if n == 'pink toggle' then

        if pinkCanPulse == false then
            fadeTime = v1*1.2
            pinkCanPulse = true
            cameraSwing = true

            setProperty('pinkVignette.alpha', 1)
            setProperty('heartsImage.alpha', 1)
            setProperty('pinkVignette2.alpha', 0.3)
            setProperty('heartsWhite.alpha', 1)
        else
            fadeTime = v1*2
            cancelTween('vign')
            cancelTween('heawh')

            setProperty('pinkVignette.alpha', 1)
            setProperty('heartsImage.alpha', 1)
            setProperty('pinkVignette2.alpha', 0.4)
            setProperty('heartsWhite.alpha', 1)
            
            doTweenAlpha('hea', 'heartsImage', 0, fadeTime, 'cubeInOut')
            doTweenAlpha('vig', 'pinkVignette', 0, fadeTime, 'cubeInOut')
            doTweenAlpha('vig2', 'pinkVignette2', 0, fadeTime, 'cubeInOut')

            doTweenAlpha('heawhite', 'heartsWhite', 0, fadeTime-0.7, 'cubeInOut')

            pinkCanPulse = false
            cameraSwing = false
        end
    end
end

function onBeatHit()
    if curBeat % 2 == 1 and pinkCanPulse == true then
        cancelTween('vign')
        cancelTween('heawh')
        setProperty('pinkVignette.alpha', 1)
        setProperty('heartsWhite.alpha', 0.8)
        doTweenAlpha('vign', 'pinkVignette', 0, fadeTime, 'sineOut')
        doTweenAlpha('heawh', 'heartsWhite', 0, fadeTime, 'sineOut')
    end
end