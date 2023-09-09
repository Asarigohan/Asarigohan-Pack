function onCreatePost()
    for i = 0, getProperty("unspawnNotes.length")-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Animation' then
            setPropertyFromGroup('unspawnNotes', i, 'noteType', 'Luigi Sing')
        end
    end
end