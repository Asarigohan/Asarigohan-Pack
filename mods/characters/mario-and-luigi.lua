function onCreate()
	setCharacterX("dad", getCharacterX("dad")-330)
	setCharacterY("dad", getCharacterY("dad")-870)
	setProperty("dadGroup.visible", false)
	addLuaScript("LUACharacters/mario")
	addLuaScript("LUACharacters/luigi")
end

function onCreatePost()

end