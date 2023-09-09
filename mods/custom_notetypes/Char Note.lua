function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Char Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'fuegoflechas'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.2'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Char Note' then
		cameraFlash("game", "FFA500", 0.6, false)
		playAnim("charizard", "atack", true)
		playSound('Flame', 0.8)
		triggerEvent('Screen Shake', '0.1, 0.1', '0.1, 0.1')
		runTimer('normal', 0.8)
	end
end

function onTimerCompleted(tag)
    if tag == 'normal' then
		playAnim('charizard', 'idle', false)
	end
end