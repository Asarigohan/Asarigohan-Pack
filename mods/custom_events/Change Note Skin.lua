local evilMode = 0;
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if evilMode == 0 and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXEL_assets');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
	end
end
end