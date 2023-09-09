function onCreate()
    luaDebugMode = true;

	makeLuaSprite('bgg', '', -1000, -1000);
    makeGraphic('bgg', 6000, 3000, '0xff1f92c9')
	setScrollFactor('bgg', 0.9, 0.9);
	addLuaSprite('bgg', false);

	makeLuaSprite("spr1", "super-mario-world/hammer_left_bush", -100, -731)
	setScrollFactor("spr1", 0.92, 1)
	addLuaSprite("spr1", false)

	makeLuaSprite("spr1f", "super-mario-world/hammer_left_bush", -100-675, -731)
	setScrollFactor("spr1f", 0.92, 1)
	setProperty("spr1f.flipX", true)
	addLuaSprite("spr1f", false)

	makeLuaSprite("spr2", "super-mario-world/hammer_mid_bush", 1200, -220)
	setScrollFactor("spr2", 0.92, 1)
	addLuaSprite("spr2", false)

	makeLuaSprite("spr3", "super-mario-world/hammer_right_bush", 2500, -788)
	setScrollFactor("spr3", 0.9, 1)
	addLuaSprite("spr3", false)

	makeLuaSprite("spr3f", "super-mario-world/hammer_right_bush", 2500+800, -788)
	setScrollFactor("spr3f", 0.9, 1)
	setProperty("spr3f.flipX", true)
	addLuaSprite("spr3f", false)

	makeLuaSprite("spr4", "super-mario-world/hammergroundnocorpse", 188-710, -4)
	scaleObject("spr4", 1.5, 1)
	addLuaSprite("spr4", false)

	makeLuaSprite("spr5", "super-mario-world/austin", 50, 230)
	scaleObject("spr5", 1.6, 0.5)
	updateHitbox("spr5")
	addLuaSprite("spr5", false)

	makeLuaSprite("spr6", "super-mario-world/pussyslayer9000", 588 + 1644, -4 + 128)
	scaleObject("spr6", 606/667, 129/143)
	updateHitbox("spr6")
	addLuaSprite("spr6", false)

	if not lowQuality then
		makeAnimatedLuaSprite("speakers", "super-mario-world/speaker", 1220-45, -90-15)
		addAnimationByPrefix("speakers", "idle", "idle", 24, false)
		setScrollFactor("speakers", 0.95, 0.95)
		scaleObject("speakers", 1.1, 1.1)
		addLuaSprite("speakers", false)

		makeAnimatedLuaSprite("goomba", "super-mario-world/goomba", 3000, 240)
		addAnimationByPrefix("goomba", "idle", "goomber", 24, false)
		addLuaSprite("goomba", false)
	end

end

function onCountdownTick(count)
	if not lowQuality then
    	if curBeat % 2 == 0 then
	    	playAnim("goomba", "idle", true)
		end
		playAnim("speakers", "idle", true)
	end
end
function onBeatHit()

	if not lowQuality then
    	if curBeat % 2 == 0 then
	    	playAnim("goomba", "idle", true)
		end
		playAnim("speakers", "idle", true)
	end

end

function onCreatePost()
	setProperty("gfGroup.flipX", false)
end