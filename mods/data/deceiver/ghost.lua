-- made by Laztrix#5670 

local timeEffect = 0.25
local zoomMulti = {0.015,0.015}
local alphaTrail = 0.8
function onSongStart()
	makeTrailEffect()
end
function onEvent(n,v1,v2)
	if n == 'Change Character' then
		isTrail = false
		runHaxeCode([[
			game.remove(trailBF);
			game.remove(trailDad);
			game.remove(trailGF);
		]])
		runTimer('characterChanged',0.2)
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if not isSustainNote and not gfSection or not isSustainNote and not noteType == 'GF Sing' then
		if passDirectionBF ~= nil then
		runHaxeCode([[
			trailBF.playAnim(game.singAnimations[]]..passDirectionBF..[[], true);
		]])
		setProperty('trailBF.alpha',alphaTrail)
		doTweenAlpha('betrailbf','trailBF',0,timeEffect,'linear')
		cancelTimer('bfframed')
		end
		passDirectionBF = direction
		runTimer('bfframed', 0.025)	end
	if not isSustainNote and gfSection or not isSustainNote and noteType == 'GF Sing' then
		if passDirectionGF ~= nil then
		runHaxeCode([[
			trailGF.playAnim(game.singAnimations[]]..passDirectionGF..[[], true);
		]])
		cancelTimer('gfframed')
		setProperty('trailGF.alpha',alphaTrail)
		doTweenAlpha('betrailgf','trailGF',0,timeEffect,'linear')
		end
		passDirectionGF = direction
		runTimer('gfframed', 0.025)
	end
end
function opponentNoteHit(id, direction ,noteType, isSustainNote)
	if not isSustainNote and not gfSection or not isSustainNote and not noteType == 'GF Sing' and not gfSection then
	if noteType == 'GF Sing' or gfSection then else
		if passDirectionDad ~= nil then
    	runHaxeCode([[
    	    trailDad.playAnim(game.singAnimations[]]..passDirectionDad..[[], true);
    	]])
		cancelTimer('dadframed')
		setProperty('trailDad.alpha',alphaTrail)
		doTweenAlpha('betraildad','trailDad',0,timeEffect,'linear')
		
		end
		passDirectionDad = direction
		runTimer('dadframed', 0.025)
	end
	end

	if not isSustainNote and gfSection or not isSustainNote and noteType == 'GF Sing'then
	if noteType == 'GF Sing' or gfSection then 
		if passDirectionGF ~= nil then
    	runHaxeCode([[
    	    trailGF.playAnim(game.singAnimations[]]..passDirectionGF..[[], true);
    	]])
		cancelTimer('gfframed')
		setProperty('trailGF.alpha',alphaTrail)
		doTweenAlpha('betrailgf','trailGF',0,timeEffect,'linear')
		
		end
		passDirectionGF = direction
		runTimer('gfframed', 0.025)
	end
	end

end
function onTimerCompleted(t)
    if t == 'bfframed' then
        passDirectionBF = nil
    end

    if t == 'dadframed' then
        passDirectionDad = nil
    end

	if t == 'gfframed' then
        passDirectionGF = nil
    end

	if t == 'characterChanged' then
		makeTrailEffect()
	end
end
function makeTrailEffect()
	isTrail = true
	runHaxeCode([[

		BFPos = [game.boyfriend.x,game.boyfriend.y];
      	DadPos = [game.dad.x,game.dad.y];
		GFPos = [game.gf.x,game.gf.y];

		trailBF = new Boyfriend(BFPos[0], BFPos[1], ']]..boyfriendName..[[');
		game.addBehindBF(trailBF);

		trailDad = new Character(DadPos[0], DadPos[1], ']]..dadName..[[');
		game.addBehindDad(trailDad);

		trailGF = new Character(GFPos[0], GFPos[1], ']]..gfName..[[');
		game.addBehindGF(trailGF);

		game.variables.set('trailGF', trailGF);
		game.variables.set('trailDad', trailDad);
        game.variables.set('trailBF', trailBF);

		trailDad.alpha = 0;
		trailBF.alpha = 0;
		trailGF.alpha = 0;
	]])

	setProperty('trailDad.color',getIconColor('dad'))
	setProperty('trailGF.color',getIconColor('gf'))
	setProperty('trailBF.color',getIconColor('boyfriend'))

end

function onUpdatePost()
	if isTrail then
	runHaxeCode([[
		trailGF.holdTimer = 0;
		trailDad.holdTimer = 0;
		trailBF.holdTimer = 0;
	]])
	end
end

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end