function onCreate()

	makeLuaSprite('tiles', 'tiles', -140, -350);
	setScrollFactor('tiles', 0.9, 0.9);
	scaleObject('tiles', 0.6, 0.6);
	
	makeLuaSprite('glitch_City', 'glitch_City', -200, -350);
	setScrollFactor('glitch_City', 0.8, 0.8);
	scaleObject('glitch_City', 0.6, 0.6);

	makeLuaSprite('haze', 'haze', -100, -350);
	setScrollFactor('haze', 0.9, 0.9);
	scaleObject('haze', 0.6, 0.6);

	addLuaSprite('glitch_City', false);
	addLuaSprite('tiles', false);
	addLuaSprite('haze', false);
	
end