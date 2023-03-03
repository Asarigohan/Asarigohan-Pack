
function onEvent(n,v1,v2)
  if n == 'Extra Cam Zoom' then
    setProperty('defaultCamZoom', 0.5 + v1)
  end
end
    