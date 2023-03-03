function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do

		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'P4_Note' then
            setPropertyFromGroup('unspawnNotes', i, "colorSwap.saturation", -10)
            setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -10);
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
end

function onUpdatePost()
    for i = 0, getProperty('notes.length') do
		if getPropertyFromGroup('notes', i, 'noteType') == 'P4_Note' then
            setPropertyFromGroup('notes', i, 'alpha', 0.3)
        end
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)

    if noteType == 'P4_Note' then
        if noteData == 0 then
            playAnim('gf', 'singLEFT', true)
            setProperty('gf.specialAnim', true)
        elseif noteData == 1 then
            playAnim('gf', 'singDOWN', true)
            setProperty('gf.specialAnim', true)
        elseif noteData == 2 then
            playAnim('gf', 'singUP', true)
            setProperty('gf.specialAnim', true)
        elseif noteData == 3 then
            playAnim('gf', 'singRIGHT', true)
            setProperty('gf.specialAnim', true)
        end
    end
end