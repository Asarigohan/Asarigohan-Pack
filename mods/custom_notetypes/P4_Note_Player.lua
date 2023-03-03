function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'P4_Note_Player' then
            setPropertyFromGroup('unspawnNotes', i, "colorSwap.saturation", -10)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -10);
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                --setPropertyFromGroup('unspawnNotes', i, 'hitByOpponent', true);
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

local susOfs = 30
function onUpdatePost()

    for i = 0, getProperty('notes.length') do
		if getPropertyFromGroup('notes', i, 'noteType') == 'P4_Note_Player' then
            setPropertyFromGroup('notes', i, 'alpha', 0.3)

            if stringEndsWith(getPropertyFromGroup('notes', i, 'animation.curAnim.name'), 'hold') or string.find(getPropertyFromGroup('notes', i, 'animation.curAnim.name'):lower(), 'end') then
                setPropertyFromGroup('notes', i, 'offset.x', -susOfs)
            end

            if getPropertyFromGroup('notes', i, 'noteData') == 0 then
                setPropertyFromGroup('notes', i, 'x', defaultPlayerStrumX0)
            elseif getPropertyFromGroup('notes', i, 'noteData') == 1 then
                setPropertyFromGroup('notes', i, 'x', defaultPlayerStrumX1)
            elseif getPropertyFromGroup('notes', i, 'noteData') == 2 then
                setPropertyFromGroup('notes', i, 'x', defaultPlayerStrumX2)
            elseif getPropertyFromGroup('notes', i, 'noteData') == 3 then
                setPropertyFromGroup('notes', i, 'x', defaultPlayerStrumX3)
            end

        end
    end
end
