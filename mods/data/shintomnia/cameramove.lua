
-----------------------------------------------------------
--Camera Movement Script by NicolasMyt--
-----------------------------------------------------------

local enableSystem = true

local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local GfX = 0
local GfY = 0

local BfOfs = 15
local GfOfs = 15
local DadOfs = 15

local curCameraState = nil
local cameraMoving = false

local def = 0.69

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onUpdate()
    if enableSystem == true then

            BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
            BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY)
            else
                if cameraMoving == true then
                    triggerEvent('Camera Follow Pos',BfX,BfY)
                    cameraMoving = false
                end
            end

--Zooming

	local what = ''
	what = getProperty('boyfriend.animation.curAnim.name')
	
	if what == 'idle' then
		setProperty('defaultCamZoom', def + 0.0)
	end
	
	if what == 'singLEFT' then
		setProperty('defaultCamZoom', def + 0.005)
	end
	
	if what == 'singRIGHT' then
		setProperty('defaultCamZoom', def + 0.005)
	end
	
	if what == 'singUP' then
		setProperty('defaultCamZoom', def - 0.005)
	end
	
	if what == 'singDOWN' then
		setProperty('defaultCamZoom', def + 0.01)
	end
  end
	
end

function onEvent(n,v1,v2)

  if n == 'enableCamMove' then

    if v1 == '0' then
      enableSystem = false
      cameraSetTarget('dad')

    elseif v1 == '1' then
      enableSystem = true
    end

  end
end