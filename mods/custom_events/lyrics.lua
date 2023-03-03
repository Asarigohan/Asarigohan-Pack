function onCreatePost()
	makeLuaText('Lyrics', (value1), 1250, 0, 480)
	setTextAlignment('Lyrics', 'Center')
      setTextFont('Lyrics', 'poketext.ttf')
	addLuaText('Lyrics')
	setTextSize('Lyrics', 24)
	setObjectCamera('Lyrics', 'other')
end
function onEvent(name, value1, value2)
	if name == 'lyrics' then
		setTextString('Lyrics', (value1));
		if value2 == '' then
		    --do nothing lol
		else
		setTextColor('Lyrics', (value2))
		end
	end
end



--Comical Chaos made this event