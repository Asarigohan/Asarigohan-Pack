local dadCam = {1270, 30};
local bfCam = {2100, 50};

local dadCamX = 1270;
local dadCamY = 30;
local bfCamX = 2100;
local bfCamY = 50;

local centered = false;
local specialCamera = false;
local zoom = 1;
local duration = 0;

local bullshit = false;

function onCreate()
	luaDebugMode = true;

	makeLuaSprite("lef", "", 0.0, 0.0);
	makeGraphic("lef", 1, 1, "0xFF000000");
	addLuaSprite("lef", false)

	makeLuaSprite("rig", "", 0.0, 0.0);
	makeGraphic("rig", 1, 1, "0xFF000000");
	addLuaSprite("rig", false)

	makeLuaSprite("top", "", 0.0, 0.0);
	makeGraphic("top", 1, 1, "0xFF000000");
	addLuaSprite("top", false)

	makeLuaSprite("bot", "", 0.0, 0.0);
	makeGraphic("bot", 1, 1, "0xFF000000");
	addLuaSprite("bot", false)

	makeLuaSprite("mid", "mwcircletransition", 0.0, 0.0);
	screenCenter("mid", 'xy')
	addLuaSprite("mid", false)
	setProperty("mid.origin.x", getProperty("mid.width")/2)
	setProperty("mid.origin.y", getProperty("mid.height")/2)

	setObjectCamera("lef", "other")
	setObjectCamera("rig", "other")
	setObjectCamera("top", "other")
	setObjectCamera("bot", "other")
	setObjectCamera("mid", "other")

end

function onCreatePost()
	triggerEvent("Camera Follow Pos", dadCamX, dadCamY)
	setProperty("camFollowPos.x", 0)
	setProperty("camFollowPos.y",-500)
end

--[[
function onMoveCamera(who)

	if who == "dad" then
		triggerEvent("Camera Follow Pos", dadCamX, dadCamY)
	end
	if who == "boyfriend" then
		triggerEvent("Camera Follow Pos", bfCamX, bfCamY)
	end

	return Function_Stop;
end
]]

function onSectionHit()
	if centered == false and specialCamera == false then
	    if mustHitSection then
	    	triggerEvent("Camera Follow Pos", bfCamX, bfCamY)
	    else
	    	triggerEvent("Camera Follow Pos", dadCamX, dadCamY)
	    end
	end
end

local customZoom = 1;
local lH = 0;
local mX = 0;
local mY = 0;
function onUpdate(elapsed)
	if centered then
	    setProperty("defaultCamZoom", 0.48*customZoom)
	else
		setProperty("defaultCamZoom", 0.5*customZoom)
	end
	if bullshit == true then

		updateHitbox("mid")
		mX = getProperty("mid.x");
		mY = getProperty("mid.y");

		if mY >= 0 and mY <= screenHeight then
			setProperty("lef.y", 0);
			lH = screenHeight;
		elseif mY < 0 then
			setProperty("lef.y", mY);
			lH = screenHeight - mY;
		end

	    setProperty("lef.x", mX-screenWidth)
		setGraphicSize("lef", screenWidth, lH)

		setProperty("top.x", mX)
		setProperty("top.y", mY-screenHeight)
		setGraphicSize("top", getProperty("mid.width")+1, screenHeight)
		updateHitbox("top")

		setProperty("bot.x", mX)
		setProperty("bot.y", mY+getProperty("mid.height"))
		setGraphicSize("bot", getProperty("mid.width")+1, screenHeight)
		updateHitbox("bot")

		setProperty("rig.x", mX+getProperty("mid.width"))
		setProperty("rig.y", 0)
		setGraphicSize("rig", screenWidth, screenHeight)
		updateHitbox("rig")
	
		
	end
end


function onEvent(n, v1, v2)

	if n == "Center Camera" then
		if v1 == "true" then
		    centered = true;
			triggerEvent("Camera Follow Pos", (dadCamX+bfCamX)/2, (dadCamY+bfCamY)/2)
		else
			centered = false;
			--triggerEvent("Camera Follow Pos", "", "")
		end
	end

	if n == "Play Animation" then
		if v1 == "laugh" then
			specialCamera = true;
			triggerEvent("Camera Follow Pos", bfCamX+115, bfCamY+40)
			customZoom = 1;
		end
	end

	if n == "Change Luigi" then
        triggerEvent("Change Character", "dad", "mario-and-luigi2")
	end

	if n == "Set Camera Alignment" then
	    setCameraAlignment(v1, v2, 1)
    end

	if n == "Set Camera Alignment Instant" then
	    setCameraAlignment(v1, v2, 3)
    end

	if n == "Tween Zoom" then
		if v1 == "" then
			v1 = 1;
		end
		if v2 == "" then
			v2 = 0.001;
		else
		    cancelTween("zoomTwn")
		    doTweenZoom("zoomTwn", "camGame", 0.5*v1, v2, "quadInOut")
		end
		customZoom = v1
	end

end

function setCameraAlignment(v1, v2, defaultVal)
	if v1 == "" then
		specialCamera = false;
		setProperty("cameraSpeed", 1)
	else
		specialCamera = true;
	    triggerEvent("Camera Follow Pos", (1-v1)*dadCamX + v1*bfCamX, (1-v1)*dadCamY + v1*bfCamY)
		if v2 == "" then
	        setProperty("cameraSpeed", 1*defaultVal)
		else
			setProperty("cameraSpeed", 1*v2)
		end
	end
end

function onBeatHit()
	if curBeat == 656 then
		doTweenAlpha("hud", "camHUD", 0, 1.8, "expoIn")
	end
	if curBeat == 688 then
		doCircleTween(0, 720/2-1280/2, 1280, 0.6, "circInOut");
	end
	if curBeat == 692 then
		doCircleTween(530, 220, 500, 0.9, "circOut");
	end
	if curBeat == 697 then
		--doTweenColor(colorTwn, "mid", 0xFF000000, 0.3, "quadIn"); --what is this
	end
	if curBeat == 700 then
		doCircleTween(560 + (460/2), 220 + (460/2), 0.000001, 1, "circOut");
	end
end

local sX = -92;
local sY = -373;
local sS = 1465;
function doCircleTween(eX, eY, eS, dur, easeFunc)
	bullshit = true;

	sX = getProperty("mid.x");
    sY = getProperty("mid.y");
    sS = getProperty("mid.width");
	
	doTweenX("midX", "mid", eX, dur, easeFunc)
	doTweenY("midY", "mid", eY, dur, easeFunc)
	doTweenX("midXS", "mid.scale", eS/1465, dur, easeFunc)
	doTweenY("midYS", "mid.scale", eS/1465, dur, easeFunc)
end