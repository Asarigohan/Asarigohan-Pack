local camTwist = false
local twistInt = 0
local twistInt2 = 0
local twistAmo = 1

function onEvent(n,v1,v2)

    if n == 'Camera Twist' then
        camTwist = true
        twistInt = v1
        twistInt2 = v2
        if twistInt2 == '' or twistInt2 == '0' then
            camTwist = false
            cancelTween('hudSwing')
            cancelTween('gameSwing')
            doTweenAngle('hudEnd', 'camHUD', 0, 1, 'sineInOut')
            doTweenAngle('gameEnd', 'camGame', 0, 1, 'sineInOut')
        end
    end
end


function onBeatHit()

    if camTwist then
        triggerEvent('Add Camera Zoom', 0.015, 0.03)
        if curBeat % 2 == 0 then 
            twistAmo = 1
        else
            twistAmo = -1
        end

        setProperty('camHUD.angle', twistAmo * twistInt2)
        setProperty('camGame.angle', twistAmo * twistInt2)

        doTweenAngle('hudSwing', 'camHUD', twistAmo * twistInt, stepCrochet * 0.002, 'circOut')
        doTweenX('hudX', 'camHUD', twistAmo * twistInt, crochet * 0.001, 'linear')
        doTweenAngle('gameSwing', 'camGame', twistAmo * twistInt, stepCrochet * 0.002, 'circOut')
        doTweenX('gameX', 'camGame', twistAmo * twistInt, crochet * 0.001, 'linear')

    else
        triggerEvent('Add Camera Zoom', 0, 0)
    end

end

function onStepHit()
    if camTwist then
        if curStep % 4 == 0 then
            doTweenY('hudY1', 'camHUD', -6 * twistInt2, stepCrochet * 0.002, 'circOut')
            doTweenY('gameY1', 'camGame.scroll', 12, stepCrochet * 0.002, 'sineIn')
        elseif curStep % 4 == 2 then
            doTweenY('hudY2', 'camHUD', 0 * twistInt2, stepCrochet * 0.002, 'sineIn')
            doTweenY('gameY2', 'camGame.scroll', 0, stepCrochet * 0.002, 'sineIn')
        end
    end
end